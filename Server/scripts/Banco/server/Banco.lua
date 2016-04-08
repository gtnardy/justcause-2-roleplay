class 'Banco'

function Banco:__init()

	self.bancos = {}
	
	Events:Subscribe("LocalSetado", self, self.ModuleLoad)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	
	Events:Subscribe("BancoSacar", self, self.Sacar)
	Events:Subscribe("BancoDepositar", self, self.Depositar)
	Events:Subscribe("BancoSaldo", self, self.Saldo)
	Events:Subscribe("BancoTransferir", self, self.Transferir)

	Events:Subscribe( "PlayerEnterCheckpoint", self, self.PlayerEnterCheckpoint)

end


function Banco:Saldo(args)

	if (not self:EstaNoBanco(args.player)) then
	
		Chat:Send(args.player, "Voce nao esta em um banco!", Color(255,0,0))
		return
	end
	
	local player = args.player
	local query = SQL:Query("SELECT dinheiro, dinheiroBanco FROM Player WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()		
	if #result > 0 then
		
		Chat:Send(player, "Banco Brasil Role Play", Color(255,255,200))
		Chat:Send(player, "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", Color(255,255,200))
		Chat:Send(player, "Saldo atual: R$ ".. tostring(result[1].dinheiroBanco), Color(255,255,255))
		Chat:Send(player, "Dinheiro no bolso: R$ ".. tostring(result[1].dinheiro), Color(255,255,255))
		Chat:Send(player, "Data: ".. os.date("%d/%m/%Y") .. " "..os.date("%X"), Color(255,255,255))
		Chat:Send(player, "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", Color(255,255,200))
			
	end

end


function Banco:Transferir(args)

	if (not self:EstaNoBanco(args.player)) then
	
		Chat:Send(args.player, "Voce nao esta em um banco!", Color(255,0,0))
		return
	end
	
	local valor = math.abs(math.floor(args.valor))
	
	local valorDisponivel = self:GetDinheiroBanco(args.player)
	
	if (valor > 1000000) then
		Chat:Send(args.player, "Voce nao pode transferir valores maiores que R$ 1,000,000 de uma so vez!", Color(255,0,0))
		return
	end
	
	if (valorDisponivel < valor) then
		Chat:Send(args.player, "Voce nao possue dinheiro suficiente em seu banco!", Color(255,0,0))
		return
	end
	
	local command = SQL:Command("UPDATE Player SET dinheiroBanco = dinheiroBanco - ? WHERE idPlayer = ?")
	command:Bind(1, valor)
	command:Bind(2, args.player:GetSteamId().id)
	command:Execute()	
	
	local command = SQL:Command("UPDATE Player SET dinheiroBanco = dinheiroBanco + ? WHERE idPlayer = ?")
	command:Bind(1, valor)
	command:Bind(2, args.destinatario:GetSteamId().id)
	command:Execute()
	
	Chat:Send(args.player, "Voce transferiu com sucesso R$ ".. valor .. " para ".. tostring(args.destinatario).."!", Color(52, 152, 219))
	Chat:Send(args.destinatario, "Voce recebeu em seu banco uma transferencia no valor de R$ ".. valor .. " de ".. tostring(args.player).."!", Color(52, 152, 219))
	Console:Print(tostring(args.player).." transferiu R$ ".. valor .. " para "..tostring(args.destinatario))
end


function Banco:Sacar(args)

	if (not self:EstaNoBanco(args.player)) then
	
		Chat:Send(args.player, "Voce nao esta em um banco!", Color(255,0,0))
		return
	end
	
	local valor = math.abs(math.floor(args.valor))
	
	if (valor > 1000000) then
		Chat:Send(args.player, "Voce nao pode sacar valores maiores que R$ 1,000,000 de uma so vez!", Color(255,0,0))
		return
	end
	
	local valorDisponivel = self:GetDinheiroBanco(args.player)
	
	if (valorDisponivel <= 0) then
		Chat:Send(args.player, "Voce nao possue dinheiro suficiente em seu banco!", Color(255,0,0))
		return
	end
	
	if (valorDisponivel < valor) then
		valor = valorDisponivel
	end
	
	local command = SQL:Command("UPDATE Player SET dinheiroBanco = dinheiroBanco - ? WHERE idPlayer = ?")
	command:Bind(1, valor)
	command:Bind(2, args.player:GetSteamId().id)
	command:Execute()

	args.player:SetMoney(args.player:GetMoney() + valor)
	Chat:Send(args.player, "Voce sacou com sucesso R$ ".. valor.. " de seu banco!", Color(52, 152, 219))
end


function Banco:Depositar(args)

	if (not self:EstaNoBanco(args.player)) then
	
		Chat:Send(args.player, "Voce nao esta em um banco!", Color(255,0,0))
		return
	end
	
	local valor = math.abs(math.floor(args.valor))

	if (valor > args.player:GetMoney()) then
		valor = args.player:GetMoney()
	end
		
	if (valor > 1000000) then
		Chat:Send(args.player, "Voce nao pode depositar valores maiores que R$ 1,000,000 de uma so vez!", Color(255,0,0))
		return
	end
	
	local command = SQL:Command("UPDATE Player SET dinheiroBanco = dinheiroBanco + ? WHERE idPlayer = ?")
	command:Bind(1, valor)
	command:Bind(2, args.player:GetSteamId().id)
	command:Execute()

	args.player:SetMoney(args.player:GetMoney() - valor)
	Chat:Send(args.player, "Voce depositou com sucesso R$ ".. valor.. " em seu banco!", Color(52, 152, 219))
end


function Banco:GetDinheiroBanco(player)

	local query = SQL:Query("SELECT dinheiroBanco FROM Player WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	if #result > 0 then
	
		return tonumber(result[1].dinheiroBanco)
	end
	
	return -1

end


function Banco:EstaNoBanco(ply)
	
	local pos = ply:GetPosition()
	for i, vec in ipairs(self.bancos) do

		if (Vector3.Distance(pos, vec) < 15) then
			return true
		end
		
	end
	
	return false
	
end


function Banco:ModuleLoad()

	local query = SQL:Query("SELECT posicao FROM Local WHERE tipo = 11")
	local result = query:Execute()
	if #result >0 then
	
		for i, linha in ipairs(result) do
		
			table.insert(self.bancos, self:StringToVector3(linha.posicao))
		end
	end

end


function Banco:StringToVector3(str)
	
	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end

end


function Banco:PlayerEnterCheckpoint(args)
	
	if args.checkpoint:GetType() == 12 then
		Chat:Send(args.player, "Voce entrou no banco!", Color(255,255,200))
	end

end

banco = Banco()