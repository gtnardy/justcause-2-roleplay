class 'JobsAgency'

function JobsAgency:__init()
	
	self.active = false
	self.atJobAgency = false
	self.ContextMenu = nil
	
	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("LocalPlayerExitSpot", self, self.LocalPlayerExitSpot)
	Events:Subscribe("LocalPlayerEnterSpot", self, self.LocalPlayerEnterSpot)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("KeyUp", self, self.KeyUp)
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
	self.ContextMenu = ContextMenu({subtitle = self.Languages.TEXT_JOBSAGENCY})
	
	local jobsList = JobsList()
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
	if self.active and (args.input < Action.LookUp or args.input > Action.LookRight) then
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
end


function JobsAgency:ModuleLoad()
	self:SetLanguages()
end


JobsAgency = JobsAgency()