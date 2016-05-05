function Player:GetCustomName()
	local name = self:GetValue("Name")
	return name and name or self:GetName()
end

function Player:GetLevel()
	local level = self:GetValue("Level")
	return level and level or 1
end

function Player:GetJob()
	local idJob = self:GetValue("IdJob")
	return idJob and idJob or 1
end

function Player:GetJobName()
	local jobName = self:GetValue("JobName")
	return jobName and jobName or "nil"
end