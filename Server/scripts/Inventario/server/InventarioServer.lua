class 'InventarioServer'

function InventarioServer:__init()

	--Events:Subscribe("ModulesLoad", self, self.ModulesLoad)
	Events:Subscribe("ComprarItem", self, self.ComprarItem)
	Events:Subscribe("AtualizarInventario", self, self.ClientModuleLoad)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Network:Subscribe("IngerirAlimento", self, self.IngerirAlimento)
	Network:Subscribe("UsarGalao", self, self.UsarGalao)

end


function InventarioServer:ComprarItem(args)

	local item = args.item
	if (args.player:GetMoney() < item.preco) then
		Chat:Send(args.player, "Voce nao possui dinheiro suficiente para comprar um "..item.nome.."!", Color(255,0,0))
		return
	end

	if (self:GetInventarioCheio(args.player)) then
		Chat:Send(args.player, "Voce nao possui espaco em seu inventario!", Color(255,0,0))
		return
	end

	local command = SQL:Command("INSERT INTO PlayerInventario (idPlayer, idItem) VALUES(?, ?)")
	command:Bind(1, args.player:GetSteamId().id)
	command:Bind(2, item.idAlimento)
	command:Execute()

	args.player:SetMoney(args.player:GetMoney() - item.preco)
	
	Chat:Send(args.player, "Voce comprou um "..item.nome.." por R$ ".. item.preco .."!", Color(34, 167, 240))

	Events:Fire("AdicionarItem", {player = args.player, item = {texto = item.nome}})

	self:AtualizarPlayer(args.player)

end


function InventarioServer:GetInventarioCheio(player)

	return false
	
end


function InventarioServer:UsarGalao(args, player)

	local result = self:GetItemInventario(player, args.idInventario)
	
	if #result > 0 then
	
		local command = SQL:Command("DELETE FROM PlayerInventario WHERE idPlayerInventario = ?")
		command:Bind(1, args.idInventario)
		command:Execute()
		
		Events:Fire("UsarGalao", {player = player})
		self:AtualizarPlayer(player)
	end
	
end


function InventarioServer:IngerirAlimento(args, player)

	local result = self:GetItemInventario(player, args.idInventario)
	
	if #result > 0 then
	
		local command = SQL:Command("DELETE FROM PlayerInventario WHERE idPlayerInventario = ?")
		command:Bind(1, args.idInventario)
		command:Execute()
		
		Events:Fire("IngerirAlimento", {player = player, idAlimento = result[1].idItem})
		self:AtualizarPlayer(player)
	end
	
end


function InventarioServer:GetItemInventario(player, idPlayerInventario)

	local query = SQL:Query("SELECT idItem FROM PlayerInventario WHERE idPlayer = ? AND idPlayerInventario = ?")
	query:Bind(1, player:GetSteamId().id)
	query:Bind(2, idPlayerInventario)
	local result = query:Execute()
	return result
	
end


function InventarioServer:ClientModuleLoad(args)
	
	self:AtualizarPlayer(args.player)

end


function InventarioServer:AtualizarPlayer(player)

	local query = SQL:Query("SELECT count(*) as 'quantidade', idPlayerInventario, pi.idItem, nome, tipo FROM PlayerInventario pi INNER JOIN InventarioItem ii ON ii.idItem = pi.idItem WHERE idPlayer = ? GROUP BY pi.idItem")
	query:Bind(1, player:GetSteamId().id)
	local itens = query:Execute()
	
	Network:Send(player, "AtualizarInventario", {itens = itens})

end


function InventarioServer:ModulesLoad()

	for player in Server:GetPlayers() do
	
		self:AtualizarPlayer(player)
	
	end

end

inventarioServer = InventarioServer()