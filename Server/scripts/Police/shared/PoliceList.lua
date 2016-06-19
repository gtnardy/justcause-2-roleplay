class 'PoliceList'

function PoliceList:__init()
	
	self:SetLanguages()
	
	self.traficTickets = {
		[1] = {value = 1000, },
	}
	
	self.wantedStars = {
		[1] = {value = 1000, },
	}
	
	self.prisionLocation = Vector3(0, 0, 0)
	self.weaponLicensePrice = 5000
	self.weaponLicenseMinimumLevel = 5
end


function PoliceList:GetTrafficTicket(id)
	if self.traficTickets[id] then
		self.traficTickets[id].name = self.Languages["TRAFICTICKET_"..tostring(id)]
		return self.traficTickets[id]
	end
end


function PoliceList:GetWantedStar(id)
	if self.wantedStars[id] then
		self.wantedStars[id].name = self.Languages["WANTEDSTAR_"..tostring(id)]
		return self.wantedStars[id]
	end
end


function PoliceList:SetLanguages()
	
	self.Languages = Languages()
	self.Languages:SetLanguage("TRAFICTICKET_1", {["en"] = "Speeding", ["pt"] = "Excesso de Velocidade"})
	
	self.Languages:SetLanguage("WANTEDSTAR_1", {["en"] = "Speeding", ["pt"] = "Excesso de Velocidade"})
end
