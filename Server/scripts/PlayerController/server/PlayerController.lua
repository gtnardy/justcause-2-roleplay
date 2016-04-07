class 'PlayerController'

function PlayerController:__init()

	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("PlayerSpawn", self, self.PlayerSpawn)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	Events:Subscribe("PlayerQuit", self, self.PlayerQuit)
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("PlayerMoneyChange", self, self.PlayerMoneyChange)
	
	Events:Subscribe("NewPlayerCreated", self, self.NewPlayerCreated)
end


function PlayerController:ClientModuleLoad(args)
	local player = args.player

	if not self:GetPlayer(player) then
		self:NewPlayer(player)
	end
end


function PlayerController:PlayerJoin(args)
	self:UpdatePlayer(args.player)
end


function PlayerController:PlayerSpawn(args)
	local player = args.player
	if player:GetValue("UltimaPosicao") then
		player:SetPosition(player:GetValue("UltimaPosicao"))
		return false
	end
end


function PlayerController:GetPlayer(player)
	local query = SQL:Query("SELECT 1 FROM Player WHERE Id = ?")
	query:Bind(1, player:GetSteamId().id)
	return #query:Execute() > 0
end


function PlayerController:UpdatePlayer(player)
	local query = SQL:Query("SELECT Nome, NivelUsuario, Dinheiro, DinheiroBanco, IdJob, Nivel, Experiencia, UltimaPosicao, Fome, Sede, Combustivel FROM Player WHERE Id = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	if (#result > 0) then
	
		player:SetMoney(tonumber(result[1].Dinheiro))
		
		player:SetNetworkValue("IdJob", tonumber(result[1].IdJob))
		player:SetNetworkValue("Name", result[1].Nome)
		player:SetNetworkValue("MoneyBank", tonumber(result[1].DinheiroBanco))
		player:SetNetworkValue("NivelUsuario", tonumber(result[1].NivelUsuario))
		player:SetNetworkValue("Level", tonumber(result[1].Nivel))
		player:SetNetworkValue("Experience", tonumber(result[1].Experiencia))
		player:SetNetworkValue("Fome", tonumber(result[1].Fome))
		player:SetNetworkValue("Sede", tonumber(result[1].Sede))
		player:SetNetworkValue("Combustivel", tonumber(result[1].Combustivel))
		player:SetValue("UltimaPosicao", self:StringToVector3(tostring(result[1].UltimaPosicao)))

		return true
	else
		player:SetModelId(24)
		player:SetNetworkValue("IdJob", 1)
		player:SetNetworkValue("NivelUsuario", 0)
		player:SetNetworkValue("Level", 1)
		player:SetNetworkValue("Experience", 0)
		player:SetNetworkValue("Fome", 100)
		player:SetNetworkValue("Sede", 100)
		player:SetNetworkValue("Combustivel", 100)
		
		return false
	end
end


function PlayerController:NewPlayer(player)
	Events:Fire("TutorialNewPlayer", player)
end


function PlayerController:NewPlayerCreated(player)
	self:CreateNewPlayer(player)
end


function PlayerController:CreateNewPlayer(player)

	local command = SQL:Command("INSERT INTO Player (Id, Nome, Dinheiro, DataEntrada, DataUltimaEntrada, UltimaPosicao) VALUES(?, ?, ?, ?, ?, ?)")
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, player:GetCustomName())
	command:Bind(3, 300)
	command:Bind(4, tostring(os.date()))
	command:Bind(5, tostring(os.date()))
	command:Bind(6, tostring(player:GetPosition()))
	
	command:Execute()
	
	self:UpdatePlayer(player)
end


function PlayerController:PlayerQuit(args)
	
	local fome = args.player:GetValue("Fome")
	if not fome then fome = 30 end
	fome = math.floor(fome * 100) / 100
	
	local sede = args.player:GetValue("Sede")
	if not sede then sede = 30 end
	sede = math.floor(sede * 100) / 100
	
	local combustivel = args.player:GetValue("Combustivel")
	if not combustivel then combustivel = 30 end
	combustivel = math.floor(combustivel * 100) / 100
	
	local command = SQL:Command("UPDATE Player SET UltimaPosicao = ?, Fome = ?, Sede = ?, Combustivel = ? WHERE Id = ?")
	command:Bind(1, tostring(args.player:GetPosition()))
	command:Bind(2, fome)
	command:Bind(3, sede)
	command:Bind(4, combustivel)
	command:Bind(5, args.player:GetSteamId().id)
	command:Execute()
end


function PlayerController:ModuleLoad()
	for player in Server:GetPlayers() do
	
		self:UpdatePlayer(player)
	
	end
end


function PlayerController:ModuleUnload()
	for player in Server:GetPlayers() do
	
		self:PlayerQuit({player = player})
	
	end
end


function PlayerController:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS Player(" ..
		"Id VARCHAR(20) NOT NULL PRIMARY KEY," ..
		"Nome VARCHAR(40) NOT NULL," ..
		"Nivel INTEGER NOT NULL DEFAULT 1," ..
		"Experiencia INTEGER NOT NULL DEFAULT 0," ..
		"Dinheiro INTEGER NOT NULL," ..
		"DinheiroBanco INTEGER NOT NULL DEFAULT 0," ..
		"IdJob INTEGER NOT NULL DEFAULT 1," ..
		"Idioma INTEGER NOT NULL DEFAULT 0," ..
		"DataEntrada DATETIME NOT NULL," ..
		"DataUltimaEntrada DATETIME NOT NULL," ..
		"UltimaPosicao VARCHAR(50) NOT NULL," ..
		"Fome INT NOT NULL DEFAULT 70," ..
		"Sede INT NOT NULL DEFAULT 70," ..
		"Combustivel INT NOT NULL DEFAULT 30," ..
		"NivelUsuario INT NOT NULL DEFAULT 1," ..
		"HabilitacaoA BIT NOT NULL DEFAULT 0," ..
		"HabilitacaoB BIT NOT NULL DEFAULT 0," ..
		"HabilitacaoC BIT NOT NULL DEFAULT 0," ..
		"HabilitacaoD BIT NOT NULL DEFAULT 0)")
end


function PlayerController:PlayerMoneyChange(args)
	
	local command = SQL:Command("UPDATE Player SET Dinheiro = ? WHERE Id = ?")
	command:Bind(1, math.floor(args.new_money))
	command:Bind(2, args.player:GetSteamId().id)
	command:Execute()
end


function PlayerController:StringToVector3(str)

	local v = str:split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end

end


PlayerController = PlayerController()