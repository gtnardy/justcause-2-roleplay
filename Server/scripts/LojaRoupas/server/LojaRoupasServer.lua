class 'LojaRoupas'

function LojaRoupas:__init()
	
	self.lojas = nil

	Events:Subscribe("AtualizarQuantidadeVestimentas", self, self.AtualizarQuantidadeVestimentas)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("ModulesLoad", self, self.ModulesLoad)
	Events:Subscribe("PlayerExitCheckpoint", self, self.PlayerExitCheckpoint)
	Events:Subscribe("PlayerEnterCheckpoint", self, self.PlayerEnterCheckpoint)
	Network:Subscribe("ComprarVestimenta", self, self.ComprarVestimenta)
	Network:Subscribe("VestirVestimenta", self, self.VestirVestimenta)
	Network:Subscribe("AtualizarVestimentas", self, self.AtualizarVestimentas)
	
	self:AtualizarQuantidadeVestimentas()
end


function LojaRoupas:AtualizarQuantidadeVestimentas()

	local listaVestimentas = ListaVestimentas()
	local quantidades = {[1] = {quantidade = 68, nome = "Roupas"}}
	for tipo, array in ipairs(listaVestimentas.vestimentas) do
		if (tipo != 1) then
			quantidades[tipo] = {quantidade = #array, nome = array.nome}
		end
	end

	Events:Fire("QuantidadeVestimenta", quantidades)
	
end


function LojaRoupas:AtualizarVestimentas(args, player)

	self:AtualizarVestimenta(player)
end


function LojaRoupas:ClientModuleLoad(args)

	self:AtualizarVestimenta(args.player)

	
end


function LojaRoupas:VestirVestimenta(args, player)

	if (args.item.tipo == 1) then
		player:SetModelId(args.item.id)
	else
		local utensilhos = player:GetValue("utensilhos")
		local utensilhosDivididos = utensilhos:split(",")
		utensilhosFinal = ""
		for i, utensilhoString in ipairs(utensilhosDivididos) do
			local stringDividida = utensilhoString:split("=")
			local tipo = tonumber(stringDividida[1])
			local idVestimenta = tonumber(stringDividida[2])
			
			if (tipo == args.item.tipo) then
				utensilhosFinal = utensilhosFinal .. tipo .. "=" .. args.item.id
			else
				utensilhosFinal = utensilhosFinal .. utensilhoString
			end
			utensilhosFinal = utensilhosFinal .. ","
			
		end
		player:SetNetworkValue("utensilhos", utensilhosFinal)
	
	end
end


function LojaRoupas:ComprarVestimenta(args, player)

	local query = SQL:Query("SELECT idPlayerVestimenta FROM PlayerVestimenta WHERE idPlayer = ? AND idVestimenta = ? AND tipo = ?")
	query:Bind(1, player:GetSteamId().id)
	query:Bind(2, args.item.id)
	query:Bind(3, args.item.tipo)
	local result = query:Execute()
	if #result > 0 then
	
		local command = SQL:Command("UPDATE PlayerVestimenta SET ativo = 0 WHERE idPlayer = ? AND tipo = ?")
		command:Bind(1, player:GetSteamId().id)
		command:Bind(2, args.item.tipo)
		command:Execute()
	
		local command = SQL:Command("UPDATE PlayerVestimenta SET ativo = 1 WHERE idPlayer = ? AND idPlayerVestimenta = ?")
		command:Bind(1, player:GetSteamId().id)
		command:Bind(2, result[1].idPlayerVestimenta)
		command:Execute()
		Chat:Send(player, "Voce vestiu a peca: "..args.item.nome.."!", Color(34, 167, 240))

		self:AtualizarVestimenta(player)
		
		return
	end

	if player:GetMoney() < args.item.preco then
		Chat:Send(player, "Voce nao possui dinheiro suficiente para comprar esta peca: "..args.item.nome.."!", Color(255,0,0))
		return
	end

	local command = SQL:Command("UPDATE PlayerVestimenta SET ativo = 0 WHERE idPlayer = ? AND tipo = ?")
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, args.item.tipo)
	command:Execute()
		
	local command = SQL:Command("INSERT INTO PlayerVestimenta (idPlayer, idVestimenta, tipo, ativo) VALUES (?, ?, ?, ?)")
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, args.item.id)
	command:Bind(3, args.item.tipo)
	command:Bind(4, 1)
	command:Execute()
	
	Events:Fire("AdicionarItem", {player = player, item = {texto = "Roupa: "..args.item.nome}})
	Chat:Send(player, "Voce comprou a peca: "..args.item.nome.."!", Color(34, 167, 240))
	player:SetMoney(player:GetMoney() - args.item.preco)
	self:AtualizarVestimenta(player)
end


function LojaRoupas:AtualizarVestimenta(player)

	local query = SQL:Query("SELECT idVestimenta, tipo FROM PlayerVestimenta WHERE idPlayer = ? AND ativo = 1 ORDER BY tipo")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	
	for i, linha in ipairs(result) do
	
		local utensilhos = ""
		
		if (tonumber(linha.tipo) == 1) then
			player:SetModelId(tonumber(linha.idVestimenta))
		else

			utensilhos = utensilhos .. linha.tipo .."="..linha.idVestimenta..","

		end
		if string.len(utensilhos) > 0 then
			player:SetNetworkValue("utensilhos", utensilhos)
		end
	end
	
	local query = SQL:Query("SELECT idVestimenta, tipo FROM PlayerVestimenta WHERE idPlayer = ? ORDER BY tipo")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	Network:Send(player, "AtualizarVestimentasCompradas", result)	

end


function LojaRoupas:ModulesLoad()

	if (not self.lojas) then
		self.lojas = {}
		local locais = {}
		
		local query = SQL:Query("SELECT idLocalTipo, descricao FROM LocalTipo WHERE checkpoint = 5")
		local result = query:Execute()
		if #result > 0 then
			for i, linha in ipairs(result) do
				locais[linha.descricao] = {idLocalTipo = tonumber(linha.idLocalTipo), descricao = linha.descricao}
			end
		end
		
		for checkpoint in Server:GetCheckpoints() do
			local infos = locais[checkpoint:GetText()]
			if infos then
				self.lojas[checkpoint:GetId()] = {infos = infos, checkpoint = checkpoint}
			end
		end
	end
	
	
end


function LojaRoupas:PlayerExitCheckpoint(args)
	
	if (args.checkpoint:GetType() == 5) then
		
		Network:Send(args.player, "EnterCheckpoint", false)
	end
	
end


function LojaRoupas:PlayerEnterCheckpoint(args)
	
	if (args.checkpoint:GetType() == 5) then
		
		local loja = self.lojas[args.checkpoint:GetId()]
		if loja then
			Network:Send(args.player, "EnterCheckpoint", loja.infos)
		end
	end
	
end


lojaRoupas = LojaRoupas()