class 'Level'

function Level:__init()

	self.experienceLevels = {}
	
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
end


function Level:GetExperienceNecessary(player)
	local level = player:GetValue("Level") and player:GetValue("Level") or 1
	return self.experienceLevels[level] and self.experienceLevels[level] or 99999
end


function Level:UpdatePlayer(player)
	player:SetNetworkValue("MaxExperience", self:GetExperienceNecessary(player))
end


function Level:PlayerJoin(args)
	self:UpdatePlayer(args.player)
end


function Level:ModuleLoad()
	local query = SQL:Query("SELECT Level, Experience FROM LevelExperience")
	local result = query:Execute()
	for _, line in ipairs(result) do
		self.experienceLevels[tonumber(line.Level)] = tonumber(line.Experience)
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