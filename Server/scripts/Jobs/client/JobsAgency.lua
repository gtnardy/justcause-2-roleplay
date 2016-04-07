class 'JobsAgency'

function JobsAgency:__init()
	
	self.active = false
	self.atJobAgency = false
	self.ContextMenu = nil
	self.ConfirmationScreenBoolean = ConfirmationScreenBoolean({text = ""})
	self.categoriesJobs = {}
	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("LocalPlayerExitSpot", self, self.LocalPlayerExitSpot)
	Events:Subscribe("LocalPlayerEnterSpot", self, self.LocalPlayerEnterSpot)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Network:Subscribe("UpdateData", self, self.UpdateData)
end


function JobsAgency:UpdateData(args)
	self.categoriesJobs = args.categoriesJobs
end


function JobsAgency:SetActive(bool)
	self.active = bool
	if bool then
		self:ConfigureContextMenu()
		self.active = self.ContextMenu:SetActive(true)
	else
		if self.ContextMenu then
			self.ContextMenu:SetActive(false)
		end
		self.ContextMenu = nil
	end
end


function JobsAgency:Render()
	if self.active and self.ContextMenu and not self.ContextMenu.active then
		self:SetActive(false)
	end
end


function JobsAgency:ConfigureContextMenu()

	if self.ContextMenu then
		self.ContextMenu:SetActive(false)
	end
	
	self.ContextMenu = ContextMenu({subtitle = string.upper(self.Languages.TEXT_JOBSAGENCY)})

	local jobCategoriesList = JobCategoriesList()
	local jobsList = JobsList()
	
	for idCategory, jobs in pairs(self.categoriesJobs) do
	
		local categoryData = jobCategoriesList[idCategory]
		
		local itemCategory = ContextMenuItem({
			text = categoryData.name,
			legend = self.Languages.TEXT_ACCESS_CATEGORY .. " " .. categoryData.name .. ".",
			enabled = true,			
		})
		self.ContextMenu.list:AddItem(itemCategory)
		
		itemCategory.list = ContextMenuList({subtitle =  string.upper(categoryData.name)})
		
		for idJob, job in pairs(jobs) do
		
			local jobData = jobsList[idJob]
			
			local itemJob = ContextMenuItem({
				text = jobData.name,
				textRight = self.Languages.TEXT_ACRONYM_LEVEL .. ". " .. tostring(job.minimumLevel),
				legend = jobData.description,
				textLegendNotActive = self.Languages.PLAYER_INSUFICIENT_LEVEL,
				statistics = {
					{text = self.Languages.TEXT_SALARY, value = job.salary},
					{text = self.Languages.TEXT_DIFFICULTY, value = job.difficulty},
				},
				enabled = LocalPlayer:GetLevel() >= job.minimumLevel
			})
			
			itemCategory.list:AddItem(itemJob)
			
			itemJob.pressEvent = function()
				JobsAgency:ChangeJob(itemJob, idJob, idCategory, job, jobData)
			end
		end
	end
	
end


function JobsAgency:ChangeJob(itemJob, idJob, idCategory, job, jobData)
	if LocalPlayer:GetLevel() < job.minimumLevel then
		itemJob.legend:SetTempText(self.Languages.PLAYER_INSUFICIENT_LEVEL)
		return
	end
	
	self.ConfirmationScreenBoolean.text = self.Languages.TEXT_CONFIRMATION_CHANGE_JOB .. " " .. jobData.name .. "?"
	self.ConfirmationScreenBoolean.confirmEvent = function()
		self:TeleportJob(idJob, idCategory)
	end
	
	self:SetActive(false)
	self.ConfirmationScreenBoolean:SetActive(true)
	
	Network:Send("ChangeJob", {idJob = idJob})
end


function JobsAgency:TeleportJob(idJob, idCategory)
	Network:Send("TeleportJob", {idJob = idJob, idCategory = idCategory})
end


function JobsAgency:KeyUp(args)
	if args.key == string.byte("F") then
		if self.atJobAgency then
			self:SetActive(not self.active)
		elseif self.active then
			self:SetActive(false)
		end
	end
end


function JobsAgency:LocalPlayerInput(args)
	if (self.active or self.ConfirmationScreenBoolean.active) and (args.input < Action.LookUp or args.input > Action.LookRight) then
		return false
	end
end


function JobsAgency:LocalPlayerEnterSpot(args)
	if args.spotType == "JOBSAGENCY_SPOT" then
		self.atJobAgency = true
		Events:Fire("AddInformationAlert", {id = "PLAYER_ENTER_JOBSAGENCY", message = self.Languages.PLAYER_ENTER_JOBSAGENCY, priority = true})
	end
end


function JobsAgency:LocalPlayerExitSpot(args)
	if args.spotType == "JOBSAGENCY_SPOT" then
		self.atJobAgency = false
		Events:Fire("RemoveInformationAlert", {id = "PLAYER_ENTER_JOBSAGENCY"})
	end
end


function JobsAgency:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_ENTER_JOBSAGENCY", {["en"] = "Press F to access the Jobs Agency.", ["pt"] = "Pressione F para acessar a Agência de Empregos."})
	self.Languages:SetLanguage("TEXT_JOBSAGENCY", {["en"] = "Jobs Agency", ["pt"] = "Agência de Empregos"})
	self.Languages:SetLanguage("TEXT_ACCESS_CATEGORY", {["en"] = "Access category", ["pt"] = "Acessar categoria"})
	self.Languages:SetLanguage("TEXT_SALARY", {["en"] = "Salary", ["pt"] = "Salário"})
	self.Languages:SetLanguage("TEXT_DIFFICULTY", {["en"] = "Difficulty", ["pt"] = "Dificuldade"})
	self.Languages:SetLanguage("TEXT_ACRONYM_LEVEL", {["en"] = "Lv", ["pt"] = "Nv"})
	self.Languages:SetLanguage("PLAYER_INSUFICIENT_LEVEL", {["en"] = "You do not have the required level!", ["pt"] = "Você não possui o nível minimo necessário!"})
	self.Languages:SetLanguage("TEXT_CONFIRMATION_CHANGE_JOB", {["en"] = "Are you sure you want to switch to employment", ["pt"] = "Você tem certeza que deseja mudar para o emprego"})
end


function JobsAgency:ModuleLoad()
	self:SetLanguages()
end


JobsAgency = JobsAgency()