class 'Gasolina'

function Gasolina:__init()

	self.veiculos = nil
	
	Events:Subscribe("ModulesLoad", self, self.ModulesLoad)
	
	
	Network:Subscribe("Abastecer", self, self.Abastecer)
	Network:Subscribe("SalvarGasolina", self, self.SalvarGasolina)
	-- Network:Subscribe("ComprarGalao", self, self.ComprarGalao)
	Network:Subscribe("ComprarItem", self, self.ComprarItem)
	Network:Subscribe("EjetarVeiculo", self, self.EjetarVeiculo)

	Events:Subscribe("TirouHabilitacao", self, self.AtualizarHabilitacoes)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	
    Events:Subscribe("UsarGalao", self, self.UsarGalao)	
    Events:Subscribe( "PlayerExitCheckpoint", self, self.PlayerExitCheckpoint )	
    Events:Subscribe( "PlayerEnterCheckpoint", self, self.PlayerEnterCheckpoint )	
	
	-- Events:Subscribe( "CriarPosto", self, self.CriarPosto)

	
end


function Gasolina:ModulesLoad()

	if self.veiculos then return end
	
	local query = SQL:Query("SELECT idVeiculo, tipo, gastoGasolina FROM Veiculo")
	self.veiculos = query:Execute()
	
	for player in Server:GetPlayers() do
		self:AtualizarPlayer(player)
	end

end


function Gasolina:AtualizarPlayer(ply)

	local query = SQL:Query("SELECT gasolina FROM Player WHERE idPlayer = ?")
	query:Bind(1, ply:GetSteamId().id)
	local result = query:Execute()
	local gasolina = 60
	if #result > 0 then
		gasolina = tonumber(result[1].gasolina)
	end

	Network:Send(ply, "AtualizarDados", {gasolina = gasolina, veiculos = self.veiculos, habilitacoes = self:GetHabilitacoes(ply)})
	
end


function Gasolina:PlayerJoin(args)

	self:AtualizarPlayer(args.player)
	
end


function Gasolina:EjetarVeiculo(args, ply)

	ply:SetPosition(ply:GetPosition() + Vector3(1,0,1))

end


function Gasolina:GetHabilitacoes(ply)

	local query = SQL:Query("SELECT idHabilitacao FROM PlayerHabilitacao WHERE idPlayer = ?")
	query:Bind(1, ply:GetSteamId().id)
	return query:Execute()

end


function Gasolina:ComprarItem(args, player)
	
	Events:Fire("ComprarItem", {player = player, item = args.item})
	
end


function Gasolina:UsarGalao(args)
	
	Network:Send(args.player, "Abastecer", 15)
	Chat:Send(args.player, "Voce usou um galao de combustivel e abasteceu 15 litros.", Color(255,255,200))
	
end


function Gasolina:Abastecer(args, player)
	
	local gasolinaAbastecer = args.litros
	
	if gasolinaAbastecer < 0 then
		gasolinaAbastecer = 0
	else	
		if gasolinaAbastecer > 100 then
			gasolinaAbastecer = 100
		end
	end
	
	local espacoLivre = 100 - args.gasolina
	
	if gasolinaAbastecer > espacoLivre then
		gasolinaAbastecer = espacoLivre
	end
	
	gasolinaAbastecer = math.floor(gasolinaAbastecer * 10) / 10
	
	local preco = self:PrecoGasolina() * gasolinaAbastecer
	
	if player:GetMoney() < preco then
		Chat:Send(player, "Voce nao possui dinheiro suficiente para abastecer ".. gasolinaAbastecer .." litros (R$ ".. preco ..")!", Color(255,0,0))
		return
	end
	
	player:SetMoney(player:GetMoney() - preco)
	
	local command = SQL:Command("UPDATE Player SET gasolina = gasolina + ? WHERE idPlayer = ?")
	command:Bind(1, gasolinaAbastecer)
	command:Bind(2, player:GetSteamId().id)
	command:Execute()
	
	Network:Send(player, "Abastecer", gasolinaAbastecer)
	Events:Fire("DescontarGasolinaGov", gasolinaAbastecer)
	
	if player:GetValue("Lingua") == 1 then
		
		Chat:Send(player, "You fueled ".. tostring(gasolinaAbastecer) .." liters of gasoline! (R$ ".. tostring(preco) .." )", Color(255,255,200))
	else

		Chat:Send(player, "Voce abasteceu ".. tostring(gasolinaAbastecer) .." litros de gasolina! (R$ ".. tostring(preco) .." )", Color(255,255,200))
	end			
	--Events:Fire("AumentarGov", preco)	
	
end


function Gasolina:AtualizarHabilitacoes(ply)
	
	Network:Send(ply, "AtualizarDados", {habilitacoes = self:GetHabilitacoes(ply)})
	
end


function Gasolina:SalvarGasolina(args)

	local gasolina = args.gasolina	
	gasolina = tonumber(string.sub(tostring(gasolina), 1, 4))	
	
	if gasolina > 100 then
		gasolina = 100
	end	
	
	if gasolina < 0 then
		gasolina = 0
	end

	local command = SQL:Command("UPDATE Player SET gasolina = ? WHERE idPlayer = ?")
	command:Bind(1, gasolina)
	command:Bind(2, args.player:GetSteamId().id)
	command:Execute()
	
end


function Gasolina:CriarPosto(args)

	local poss = tostring(args:GetPosition()):split(", ")
	local posx = poss[1]
	local posy = poss[3]
	local posz = poss[5]
	
	local query = SQL:Query("INSERT INTO jcUtilitarios (posx, posy, posz, tipoUtilitario) VALUES (".. posx ..", ".. posy ..", ".. posz ..", 3)")
	local result = query:Execute()
		
	if result then
		Chat:Broadcast("Posto de combustivel criado em: " .. tostring(args:GetPosition()), Color(100, 100, 100) )
	end
 
end


function Gasolina:ComprarGalao(args)

	local query = SQL:Query("SELECT jcIT.Peso FROM jcInventario jcI INNER JOIN jcInventarioTipo jcIT ON jcI.idItem = jcIT.Item WHERE idUsuario = ?")
	query:Bind(1, args:GetSteamId().id)
	local result = query:Execute()
	if #result > 0 then
	
		if #result >= 20 then
		
			Chat:Send(args, "Seu inventario esta cheio!", Color(255,0,0))
			return false
			
		end	
		pesoTotal = 0
		for p = 1, #result do
			pesoTotal = pesoTotal + tonumber(result[p].Peso)
		end
		
		if pesoTotal > 15 then
		
			Chat:Send(args, "Seu inventario esta cheio!", Color(255,0,0))	
			return false

		end

	end
	if args:GetMoney() < 25 then
		if args:GetValue("Lingua") == 1 then
			Chat:Send(args, "You do not have enough money! (R$ 25)", Color(255,0,0))
		else
			Chat:Send(args, "Voce nao possui dinheiro suficiente! (R$ 25)", Color(255,0,0))
		end	
		return
	end
	
	if args:GetValue("Lingua") == 1 then
		Chat:Send(args, "You bought a gallon of fuel (5 Liters) for R$ 25!", Color(255,255,200))
	else
		Chat:Send(args, "Voce comprou um Galao de Combustivel (5 Litros) por R$ 25!", Color(255,255,200))
	end	
	
	args:SetMoney(args:GetMoney() - 25)
	Events:Fire("AdicionarInventario", {args, 21})

end


function Gasolina:PrecoGasolina()

	-- imposto = 0
	
	-- local query = SQL:Query("SELECT DinheiroPublico FROM jcEssentials")
	-- local result = query:Execute()
	-- if #result > 0 then
	
		 -- valor = math.floor(tonumber(result[1].DinheiroPublico))
		
	-- end

	
	-- local query = SQL:Query("SELECT sum(Dinheiro + DinheiroBanco) AS 'soma' FROM jcUsuario")
	-- local result = query:Execute()
	-- if #result > 0 then
	
		-- dinheiro = math.floor(tonumber(result[1].soma))
		-- imposto = (dinheiro / valor) / 100
		-- imposto = tonumber(string.sub(tostring(imposto), 1, 5))	


		
	-- end
	
	-- if imposto < 1 then
		-- imposto = 1
	-- end

	local query = SQL:Query("SELECT precoGasolina FROM Governo")
	local result = query:Execute()	
	
	if #result > 0 then
		--return tonumber(result[1].PrecoGasolina) + (tonumber(result[1].PrecoGasolina) * imposto)
		return tonumber(result[1].precoGasolina)
	else
		return false
	end

end


function Gasolina:GasolinaServidor(args)

	local query = SQL:Query("SELECT quantidadeGasolina FROM Governo")
	local result = query:Execute()	
	
	if #result > 0 then
		return tonumber(result[1].quantidadeGasolina)
	else
		return false
	end

end


function Gasolina:TipoVeiculo(args)

	local query = SQL:Query("SELECT tipo FROM Veiculo WHERE idVeiculo = ?")
	query:Bind(1, args)
	local result = query:Execute()	
	if #result > 0 then
		return tonumber(result[1].Tipo)
	else
		return false
	end
end


function Gasolina:GastoVeiculo(args)

	local query = SQL:Query("SELECT gastoGasolina FROM Veiculo WHERE idVeiculo = ?")
	query:Bind(1, args)
	local result = query:Execute()
			
	if #result > 0 then
		return tonumber(result[1].gastoGasolina)
	else
		return false
	end

end


function Gasolina:AtualizarGasolina(args)

	if args:InVehicle() and args:GetVehicle():GetDriver() == args then
		Network:Send(args, "AtualizarGasolina", {self:GasolinaUsuario(args), self:GastoVeiculo(args:GetVehicle():GetModelId()), self:TipoVeiculo(args:GetVehicle():GetModelId())})
	end
		
end


function Gasolina:PlayerEnterCheckpoint(args)

	if args.checkpoint:GetType() == 19 then
	
		if args.player:GetValue("Lingua") == 0 then
			Chat:Send(args.player, "Posto de combustivel", Color(255,255,200))		
			Chat:Send(args.player, "--------------------------------------------------------------------------------------------------------------------------------", Color(255,255,200))-- Color(15,225,225))
			Chat:Send(args.player, "- J - Abre o menu do posto", Color(255,255,255))
			Chat:Send(args.player, "O preco do litro da gasolina hoje consta em: R$ "..tostring(self:PrecoGasolina()), Color(124,205,124))
			Chat:Send(args.player, "Gasolina disponivel no estoque: "..tostring(self:GasolinaServidor()).. " L", Color(124,205,124))
		else
			Chat:Send(args.player, "Gas Station", Color(255,255,200))		
			Chat:Send(args.player, "--------------------------------------------------------------------------------------------------------------------------------", Color(255,255,200))-- Color(15,225,225))
			Chat:Send(args.player, "- J - Open the menu of the gas station", Color(255,255,255))
			Chat:Send(args.player, "The price of gasoline today reported in: R$ "..tostring(self:PrecoGasolina()), Color(124,205,124))
			Chat:Send(args.player, "Gasoline available in stock: "..tostring(self:GasolinaServidor()).. " L", Color(124,205,124))			
		end		

		
		Chat:Send(args.player, "--------------------------------------------------------------------------------------------------------------------------------", Color(255,255,200))
		Network:Send(args.player, "EntrouNoPosto", true)
	end
	
end


function Gasolina:PlayerExitCheckpoint(args)

	if args.checkpoint:GetType() == 19 then
		Network:Send(args.player, "EntrouNoPosto", false)
	end
	
end


gasolina = Gasolina()