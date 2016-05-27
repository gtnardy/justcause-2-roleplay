class("ScreenJob")(Tela)

function ScreenJob:__init()
	
	self:SetLanguages()
	
	self.spots = {}
	self.module = nil
	self:UpdateModule()
	self.nome = self.Languages.LABEL_JOB
	self.Map = Map()
	self.Map.notFade = true
	self.Map.centerAtPlayer = false
	self.Map.defaultZoom = 0.2
	
	Events:Subscribe("NetworkObjectValueChange", self, self.NetworkObjectValueChange)
end


function ScreenJob:NetworkObjectValueChange(args)
	if (args.object.__type == "Player" or args.object.__type == "LocalPlayer") and args.key == "IdJob" then
		self:UpdateModule()
	end
end



function ScreenJob:UpdateModule()
	local idJob = LocalPlayer:GetJob()
	if idJob == 3 then
		self.module = ScreenJobDeliver()
	end
end


function ScreenJob:SetSpots(spots)
	if self.module then
		self.Map.spots = self.module:GetSpots(spots)
	end
end


function ScreenJob:Render()
	self.Map:Render()
	if self.module then
		self.module:Render()
	end
end


function ScreenJob:SetActive(bool)
	self.Map:SetActive(bool)
end


function ScreenJob:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("LABEL_JOB", {["en"] = "Job", ["pt"] = "Emprego"})
end