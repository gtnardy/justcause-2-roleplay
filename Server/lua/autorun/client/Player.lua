function Player:GetJobName()
	local jobName = self:GetValue("JobName")
	return jobName and jobName or "nil"
end

function Player:GetJobDetailedDescription()
	local jobDetailedDescription = self:GetValue("JobDetailedDescription")
	return jobDetailedDescription and jobDetailedDescription or "nil"
end

function Player:GetJobUnlocksList()
	local unlocks = self:GetValue("JobUnlocksList")
	return unlocks and unlocks or {}
end