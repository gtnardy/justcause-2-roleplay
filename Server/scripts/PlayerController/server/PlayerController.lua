class 'PlayerController'

function PlayerController:__init()

	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	Events:Subscribe("PlayerQuit", self, self.PlayerQuit)
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("PlayerMoneyChange", self, self.PlayerMoneyChange)
end


function PlayerController:PlayerJoin(args)
	
	local player = args.player
	
	local result = self:UpdatePlayer(player)
	if (result) then
		
		Chat:Broadcast(tostring(player) .. " entrou no servidor!", Color(255, 255, 0))
	else
		Chat:Broadcast(tostring(player) .. " entrou no servidor pela primeira vez!", Color(255, 255, 0))
		self:NewPlayer(player)
	end
	
end


function PlayerController:UpdatePlayer(player)

	local query = SQL:Query("SELECT Nome, NivelUsuario, Dinheiro, Nivel, Experiencia, UltimaPosicao, Fome, Sede FROM Player WHERE Id = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	if (#result > 0) then
	
		player:SetMoney(tonumber(result[1].Dinheiro))
		
		local vec = self:StringToVector3(tostring(result[1].UltimaPosicao))
		if (vec) then
			player:SetPosition(vec)
		end

		local values = {NivelUsuario = tonumber(result[1].NivelUsuario),
						Nivel = tonumber(result[1].nivel),
						Experiencia = tonumber(result[1].Experiencia),
						Fome = tonumber(result[1].Fome),
						Sede = tonumber(result[1].Sede)}
		
		Network:Send(player, "UpdatePlayerData", values)
		
		return true
	end
	return false
end


function PlayerController:NewPlayer(player)

	local command = SQL:Command("INSERT INTO Player (Id, Nome, Dinheiro, DataEntrada, DataUltimaEntrada, UltimaPosicao) VALUES(?, ?, ?, ?, ?, ?)")
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, player:GetName())
	command:Bind(3, 300)
	command:Bind(4, tostring(os.date()))
	command:Bind(5, tostring(os.date()))
	command:Bind(6, tostring(player:GetPosition()))
	
	command:Execute()
end


function PlayerController:PlayerQuit(args)

	local command = SQL:Command("UPDATE Player SET UltimaPosicao = ? WHERE Id = ?")
	command:Bind(1, tostring(args.player:GetPosition()))
	command:Bind(2, args.player:GetSteamId().id)
	command:Execute()
	
	Chat:Broadcast(tostring(args.player) .. " saiu do servidor!", Color(255,255,255))

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
		"Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT," ..
		"Nome VARCHAR(40) NOT NULL," ..
		"Nivel INTEGER NOT NULL DEFAULT 1," ..
		"Experiencia INTEGER NOT NULL DEFAULT 0," ..
		"Dinheiro INTEGER NOT NULL," ..
		"DinheiroBanco INTEGER NOT NULL DEFAULT 0," ..
		"Idioma INTEGER NOT NULL DEFAULT 0," ..
		"DataEntrada DATETIME NOT NULL," ..
		"DataUltimaEntrada DATETIME NOT NULL," ..
		"UltimaPosicao VARCHAR(50) NOT NULL," ..
		"Fome INT NOT NULL DEFAULT 70," ..
		"Sede INT NOT NULL DEFAULT 70," ..
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

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end

end


PlayerController = PlayerController()