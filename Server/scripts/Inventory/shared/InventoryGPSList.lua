class 'InventoryGPSList'

function InventoryGPSList:__init()
	self:SetLanguages()

	self["GPS"] = {
		[9] = self.Languages.GPS_GASSTATION,
		[10] = self.Languages.GPS_CLOTHINGSTORE,
		[11] = self.Languages.GPS_FOODSTORE,
		[12] = self.Languages.GPS_BANK,
		[13] = self.Languages.GPS_JOBSAGENCY,
		[16] = self.Languages.GPS_HOSPITAL,
		[17] = self.Languages.GPS_DRIVINGSCHOOL,
		[19] = self.Languages.GPS_POLICEDEPARTMENT,
	}
end


function InventoryGPSList:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("GPS_GASSTATION", {["en"] = "Gas Station", ["pt"] = "Posto de Combustível"})
	self.Languages:SetLanguage("GPS_CLOTHINGSTORE", {["en"] = "Clothing Store", ["pt"] = "Loja de Roupas"})
	self.Languages:SetLanguage("GPS_FOODSTORE", {["en"] = "Food Store", ["pt"] = "Loja de Alimentos"})
	self.Languages:SetLanguage("GPS_BANK", {["en"] = "Bank", ["pt"] = "Banco"})
	self.Languages:SetLanguage("GPS_JOBSAGENCY", {["en"] = "Job Agency", ["pt"] = "Agência de Empregos"})
	self.Languages:SetLanguage("GPS_HOSPITAL", {["en"] = "Hospital", ["pt"] = "Hospital"})
	self.Languages:SetLanguage("GPS_DRIVINGSCHOOL", {["en"] = "Driving School", ["pt"] = "Auto-Escola"})
	self.Languages:SetLanguage("GPS_POLICEDEPARTMENT", {["en"] = "Police Department", ["pt"] = "Departamento de Policia"})
end
