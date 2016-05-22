class 'Level'

function Level:__init()

	self.LevelExperiences = {}
	
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	
	Events:Subscribe("EarnExperience", self, self.EarnExperience)
	-- Events:Subscribe("PlayerChat", self, self.PlayerChat)
end


-- function Level:PlayerChat(args)
	-- self:EarnExperience({player = args.player, experience = 100})
-- end


function Level:EarnExperience(args)
	local level = args.player:GetLevel()
	local experience = args.player:GetExperience()
	local maxExperience = args.player:GetMaxExperience()
	if (experience + args.experience >= maxExperience) then
		self:SetLevel(args.player, level + 1)
		self:SetExperience(args.player, experience + args.experience - maxExperience)
		self:UpdatePlayer(args.player)
	else
		self:SetExperience(args.player, experience + args.experience)
	end
end


function Level:SetLevel(player, level)
	player:SetNetworkValue("Level", level)
	local command = SQL:Command("UPDATE Player SET Nivel = ? WHERE Id = ?")
	command:Bind(1, level)
	command:Bind(2, player:GetSteamId().id)
	command:Execute()
end


function Level:SetExperience(player, experience)
	player:SetNetworkValue("Experience", experience)
	local command = SQL:Command("UPDATE Player SET Experiencia = ? WHERE Id = ?")
	command:Bind(1, experience)
	command:Bind(2, player:GetSteamId().id)
	command:Execute()
end


function Level:GetMaxExperience(level)
	return self.LevelExperiences[level] and self.LevelExperiences[level] or 99999
end


function Level:UpdatePlayer(player)
	player:SetNetworkValue("MaxExperience", self:GetMaxExperience(player:GetLevel()))
end


function Level:PlayerJoin(args)
	self:UpdatePlayer(args.player)
end


function Level:ModuleLoad()
	local experiences = SQL:Query("SELECT * FROM LevelExperience"):Execute()
	for _, line in ipairs(experiences) do
		self.LevelExperiences[tonumber(line.Level)] = tonumber(line.Experience)
	end
	
	for player in Server:GetPlayers() do
		self:UpdatePlayer(player)
	end
end


function Level:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS LevelExperience(" ..
		"Level INT NOT NULL PRIMARY KEY," ..
		"Experience INT NOT NULL)")
end

Level = Level()