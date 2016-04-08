class 'FomeServer'

function FomeServer:__init()
	
	--Events:Subscribe("ModulesLoad", self, self.ModulesLoad)
	Events:Subscribe("IngerirAlimento", self, self.IngerirAlimento)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	
	Network:Subscribe("MorrendoSede", self, self.MorrendoSede)
	Network:Subscribe("Salvar", self, self.Salvar)

end


function FomeServer:MorrendoSede(args, player)

	player:SetHealth(player:GetHealth() - 0.01)
end


function FomeServer:MorrendoFome(args, player)

	player:SetHealth(player:GetHealth() - 0.005)
end


function FomeServer:Salvar(args, player)

	local command = SQL:Command("UPDATE Player SET fome = ?, sede = ? WHERE idPlayer = ?")
	command:Bind(1, args.fome)
	command:Bind(2, args.sede)
	command:Bind(3, player:GetSteamId().id)
	command:Execute()
	
end


function FomeServer:ClientModuleLoad(args)
	
	self:AtualizarPlayer(args.player)

end


function FomeServer:IngerirAlimento(args)

	local query = SQL:Query("SELECT fome, sede, nome FROM InventarioAlimento ia INNER JOIN InventarioItem ii ON ia.idItem = ii.idItem WHERE ii.idItem = ?")
	query:Bind(1, args.idAlimento)
	local result = query:Execute()
	if (#result == 0) then
		Chat:Send(args.player, "Ocorreu um erro ao ingerir um alimento! O alimento nao existe!", Color(255,0,0))
		return
	end
	local alimento = result[1]--self.alimentos[tonumber(args.idAlimento)]
	
	-- if (not alimento.sede) then alimento.sede = 0 end
	-- if (not alimento.fome) then alimento.fome = 0 end

	self:Ingerir({player = args.player, fome = alimento.fome, sede = alimento.sede})
	Chat:Send(args.player, "Voce ingeriu um(a) "..alimento.nome.."!", Color(255,255,200))
	
end


function FomeServer:Ingerir(args)

	Network:Send(args.player, "Ingerir", {fome = args.fome, sede = args.sede})
end


function FomeServer:AtualizarPlayer(player)

	local query = SQL:Query("SELECT fome, sede FROM Player WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	
	Network:Send(player, "AtualizarFome", {fome = result[1].fome, sede = result[1].sede})

end


function FomeServer:ModulesLoad()

	for player in Server:GetPlayers() do
	
		self:AtualizarPlayer(player)
	
	end

end

FomeServer = FomeServer()