class 'Jobs'

function Jobs:__init()
	Network:Subscribe("UpdateJobData", self, self.UpdateJobData)
	Network:Subscribe("UpdateJobUnlocks", self, self.UpdateJobUnlocks)
end


function Jobs:UpdateJobData(args)
	local jobsList = JobsList()
	
	local jobName = "nil"
	local jobDetailedDescription = "nil"
	
	local jobData = jobsList[LocalPlayer:GetJob()]
	
	if jobData then
		jobName = jobData.name
		jobDetailedDescription = jobData.detailed_description
	end
	
	LocalPlayer:SetValue("JobName", jobName)
	LocalPlayer:SetValue("JobDetailedDescription", jobDetailedDescription)
end


function Jobs:UpdateJobUnlocks(args)
	local jobsUnlockList = JobsUnlockList()
	local jobUnlocks = jobsUnlockList[LocalPlayer:GetJob()]
	
	LocalPlayer:SetValue("JobUnlocksList", jobUnlocks)
end


Jobs = Jobs()