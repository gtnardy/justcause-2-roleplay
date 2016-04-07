class 'Jobs'

function Jobs:__init()

	self.categoriesJobs = {}
	
	Network:Subscribe("ChangeJob", self, self.ChangeJob)
	Network:Subscribe("TeleportJob", self, self.TeleportJob)
	
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
end


function Jobs:ChangeJob(args, player)
	local command = SQL:Query("Update Player SET IdJob = ? WHERE Id = ?")
	command:Bind(1, args.idJob)
	command:Bind(2, player:GetSteamId().id)
	command:Execute()
	player:SetNetworkValue("IdJob", args.idJob)
end


function Jobs:TeleportJob(args, player)
	local jobData = self.categoriesJobs[args.idCategory][args.idJob]
	player:SetPosition(jobData.spawnPosition)
end


function Jobs:ClientModuleLoad(args)
	Network:Send(args.player, "UpdateData", {categoriesJobs = self.categoriesJobs})
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
end

Jobs = Jobs()