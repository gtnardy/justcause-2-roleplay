function Player:GetCustomName()
	local name = self:GetValue("Name")
	return name and name or self:GetName()
end

function Player:GetLevel()
	local level = self:GetValue("Level")
	return level and level or 1
end

function Player:GetExperience()
	local experience = self:GetValue("Experience")
	return experience and experience or 0
end

function Player:GetMaxExperience()
	local maxExperience = self:GetValue("MaxExperience")
	return maxExperience and maxExperience or 1
end

function Player:GetJob()
	local idJob = self:GetValue("IdJob")
	return idJob and idJob or 1
end

function Player:GetJobLevel()
	local jobLevel = self:GetValue("JobLevel")
	return jobLevel and jobLevel or 0
end

function Player:GetJobExperience()
	local experience = self:GetValue("JobExperience")
	return experience and experience or 0
end

function Player:GetJobUnlocks()
	local unlocks = self:GetValue("JobUnlocks")
	return unlocks and unlocks or {}
end

function Player:GetJobMaxExperience()
	local maxExperience = self:GetValue("JobExperienceNecessary")
	return maxExperience and maxExperience or 1
end

function Player:GetCompany()
	local company = self:GetValue("IdCompany")
	return company and company or nil
end

function Player:GetWorking()
	local working = self:GetValue("Working")
	return working and working or nil
end

function Player:GetLicenses()
	local licenses = self:GetValue("Licenses")
	return licenses and licenses or {}
end

function Player:GetLifeInsurance()
	local li = self:GetValue("LifeInsurance")
	return li and li or false
end