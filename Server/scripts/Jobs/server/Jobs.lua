class 'Jobs'

function Jobs:__init()

	self.categoriesJobs = {}
	
	Network:Subscribe("ChangeJob", self, self.ChangeJob)
	Network:Subscribe("TeleportJob", self, self.TeleportJob)
	
	Events:Subscribe("EarnJobExperience", self, self.EarnJobExperience)
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
end


function Jobs:EarnJobExperience(args)
	local jobLevel = args.player:GetJobLevel()
	local experience = args.player:GetJobExperience()
	local maxExperience = args.player:GetJobMaxExperience()
	
	if (experience + args.experience >= maxExperience) then
		self:SetLevel(args.player, level + 1)
		self:SetExperience(args.player, experience + args.experience - maxExperience)
		self:UpdateJobData(args.player)
	else
		self:SetExperience(args.player, experience + args.experience)
	end
end


function Jobs:SetLevel(player, level)
	player:SetNetworkValue("JobLevel", level)
	local command = SQL:Command("UPDATE PlayerJobs SET Level = ? WHERE IdPlayer = ?")
	command:Bind(1, level)
	command:Bind(2, player:GetSteamId().id)
	command:Execute()
	
	self:UpdateJobUnlocks(player)
end


function Jobs:SetExperience(player, experience)
	player:SetNetworkValue("JobExperience", experience)
	local command = SQL:Command("UPDATE PlayerJobs SET Experiencia = ? WHERE IdPlayer = ? AND IdJob = ?")
	command:Bind(1, experience)
	command:Bind(2, player:GetSteamId().id)
	command:Bind(3, player:GetJob())
	command:Execute()
end


function Jobs:ChangeJob(args, player)
	local command = SQL:Command("UPDATE Player SET IdJob = ? WHERE Id = ?")
	command:Bind(1, args.idJob)
	command:Bind(2, player:GetSteamId().id)
	command:Execute()
	
	local query = SQL:Query("SELECT * FROM PlayerJobs WHERE IdPlayer = ? AND IdJob = ?")
	query:Bind(1, player:GetSteamId().id)
	query:Bind(2, args.idJob)
	local result = query:Execute()
	
	if #result == 0 then
		local command = SQL:Command("INSERT INTO PlayerJobs VALUES(?, ?, ?, ?)")
		command:Bind(1, player:GetSteamId().id)
		command:Bind(2, args.idJob)
		command:Bind(3, 0)
		command:Bind(4, 0)
		command:Execute()	
	end
	
	player:SetNetworkValue("IdJob", args.idJob)
	self:UpdateJobData(args.player)
end


function Jobs:TeleportJob(args, player)
	local jobData = self.categoriesJobs[args.idCategory][args.idJob]
	player:SetPosition(jobData.spawnPosition)
end


function Jobs:ClientModuleLoad(args)
	Network:Send(args.player, "UpdateData", {categoriesJobs = self.categoriesJobs})
	
	self:UpdateJobData(args.player)
end


function Jobs:UpdateJobData(player)
	
	local query = SQL:Query("SELECT Level, Experience FROM PlayerJobs WHERE IdPlayer = ? AND IdJob = ?")
	query:Bind(1, player:GetSteamId().id)
	query:Bind(2, player:GetJob())
	local result = query:Execute()
	
	local jobLevel = 0 
	local jobExperience = 0
	if #result > 0 then
		jobLevel = tonumber(result[1].Level)
		jobExperience = tonumber(result[1].Experience)
	end
	
	player:SetNetworkValue("JobLevel", jobLevel)
	player:SetNetworkValue("JobExperience", jobExperience)
	
	local query = SQL:Query("SELECT Experience FROM JobsExperience WHERE IdJob = ? AND Level = ?")
	query:Bind(1, player:GetJob())
	query:Bind(2, player:GetJobLevel())
	local result = query:Execute()
	
	local experienceJobNecessary = 666
	if #result > 0 then
		experienceJobNecessary = tonumber(result[1].Experience)
	end
	
	player:SetNetworkValue("JobExperienceNecessary", experienceJobNecessary)
	
	self:UpdateJobUnlocks(player)
	Network:Send(player, "UpdateJobData")
end


function Jobs:UpdateJobUnlocks(player)
	local query = SQL:Query("SELECT IdUnlock, MinimumLevel FROM JobsUnlocks WHERE IdJob = ?")
	query:Bind(1, player:GetJob())
	local result = query:Execute()
	
	local playerJobLevel = player:GetJobLevel()
	local list = {}
	for _, line in ipairs(result) do
		list[tonumber(line.IdUnlock)] = {unlocked = (playerJobLevel >= tonumber(line.MinimumLevel)), minimumLevel = tonumber(line.MinimumLevel)}
	end

	player:SetNetworkValue("JobUnlocks", list)
	Network:Send(player, "UpdateJobUnlocks")
end


function Jobs:ModuleLoad()
	local query = SQL:Query("SELECT * FROM Jobs ORDER BY MinimumLevel")
	local result = query:Execute()
	for _, line in ipairs(result) do
		if not self.categoriesJobs[tonumber(line.IdJobCategory)] then
			self.categoriesJobs[tonumber(line.IdJobCategory)] = {}
		end
		
		self.categoriesJobs[tonumber(line.IdJobCategory)][tonumber(line.Id)] = {
			salary = tonumber(line.Salary),
			difficulty = tonumber(line.Difficulty),
			minimumLevel = tonumber(line.MinimumLevel),
			spawnPosition = Vector3.ParseString(line.SpawnPosition),
		}
	end
end


function Jobs:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS Jobs(" ..
		"Id INTEGER NOT NULL PRIMARY KEY," ..
		"MinimumLevel INTEGER NOT NULL," ..
		"Salary INTEGER NOT NULL," ..
		"Difficulty INTEGER NOT NULL," ..
		"SpawnPosition Varchar(30) NOT NULL," ..
		"IdJobCategory INTEGER NOT NULL)")
		
	SQL:Execute("CREATE TABLE IF NOT EXISTS JobsUnlocks(" ..
		"IdJob INTEGER NOT NULL," ..
		"IdUnlock INTEGER NOT NULL," ..
		"MinimumLevel INTEGER NOT NULL," ..
		"PRIMARY KEY(IdJob, IdUnlock))")
		
	SQL:Execute("CREATE TABLE IF NOT EXISTS JobsExperience(" ..
		"IdJob INTEGER NOT NULL," ..
		"Level INTEGER NOT NULL," ..
		"Experience INTEGER NOT NULL," ..
		"PRIMARY KEY(IdJob, Level))")
		
	SQL:Execute("CREATE TABLE IF NOT EXISTS PlayerJobs(" ..
		"IdPlayer VARCHAR(20) NOT NULL," ..
		"IdJob INTEGER NOT NULL," ..
		"Level INTEGER NOT NULL," ..
		"Experience INTEGER NOT NULL," ..
		"PRIMARY KEY(IdPlayer, IdJob))")
end

Jobs = Jobs()