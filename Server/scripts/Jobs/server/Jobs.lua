class 'Jobs'

function Jobs:__init()


	self.JobsList = JobsList()
	self.categoriesJobs = {}
	
	Network:Subscribe("ChangeJob", self, self.ChangeJob)
	Network:Subscribe("TeleportJob", self, self.TeleportJob)
	
	Events:Subscribe("EarnJobExperience", self, self.EarnJobExperience)
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
end


function Jobs:EarnJobExperience(args)
	local command = SQL:Command("UPDATE PlayerJobs SET Experience = Experience + ? WHERE IdPlayer = ? AND IdJob = ?")
	command:Bind(1, args.experience)
	command:Bind(2, args.player:GetSteamId().id)
	command:Bind(3, args.player:GetJob())
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
	self:PlayerJoin({player = player})
end


function Jobs:TeleportJob(args, player)
	local jobData = self.categoriesJobs[args.idCategory][args.idJob]
	player:SetPosition(jobData.spawnPosition)
end


function Jobs:ClientModuleLoad(args)
	Network:Send(args.player, "UpdateData", {categoriesJobs = self.categoriesJobs})
end


function Jobs:PlayerJoin(args)
	local jobName = self.JobsList[player:GetJob()]
	if jobName then jobName = jobName.name else "nil" end
	args.player:SetNetworkValue("JobName", jobName)
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
		
	SQL:Execute("CREATE TABLE IF NOT EXISTS PlayerJobs(" ..
		"IdPlayer VARCHAR(20) NOT NULL," ..
		"IdJob INTEGER NOT NULL," ..
		"Level INTEGER NOT NULL," ..
		"Experience INTEGER NOT NULL," ..
		"PRIMARY KEY(IdPlayer, IdJob))")
end

Jobs = Jobs()