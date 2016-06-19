class 'PoliceDepartment'

function PoliceDepartment:__init()
	
	self.PoliceList = PoliceList()
	
	self:SetLanguages()
	
	self.timer = Timer()
	
	Events:Subscribe("PostTick", self, self.PostTick)
end


function PoliceDepartment:PostTick()
	if self.timer:GetSeconds() > 5 then
		self.timer:Restart()
		
		if LocalPlayer:GetArrested() then
			if Vector3.Distance(LocalPlayer:GetPosition(), self.PoliceList.prisionLocation) > 10 then
				Network:Send("EscapedPrision")
				Events:Fire("AddNotificationAlert", {message = self.Languages.DO_NOT_ESCAPE})
			end
		end
	end
end


function PoliceDepartment:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("DO_NOT_ESCAPE", {["en"] = "Do not to try to escape from prision.", ["pt"] = "Não tente fugir da prisão."})
end


PoliceDepartment = PoliceDepartment()