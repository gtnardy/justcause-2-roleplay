class 'Licenses'

function Licenses:__init()
	self:SetLanguages()
	
	self.VehicleList = VehicleList()
	
	Events:Subscribe("LocalPlayerEnterVehicle", self, self.LocalPlayerEnterVehicle)
end


function Licenses:LocalPlayerEnterVehicle(args)
	if not args.is_driver then return end
	if LocalPlayer:GetValue("DrivingSchool") then return end
	
	local licenses = LocalPlayer:GetLicenses()
	local modelId = args.vehicle:GetModelId()
	local vehicleType = self.VehicleList:GetVehicleType(modelId)
	local licenseVehicleNecessary = self.VehicleList:GetLicenseType(vehicleType)
	
	if ((vehicleType == 1 or vehicleType == 2) and LocalPlayer:GetLevel() < 5) then
		Events:Fire("AddNotificationAlert", {message = self.Languages.PLAYER_DO_NOT_LICENSED_YET})
	elseif not licenses[licenseVehicleNecessary] then
		Events:Fire("AddNotificationAlert", {message = self.Languages.PLAYER_DO_NOT_LICENSED})
		Network:Send("EjectPlayer")
	end
end


function Licenses:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_DO_NOT_LICENSED", {["en"] = "You are not licensed to drive this vehicle. Go to a driving school.", ["pt"] = "Você não possui habilitação para dirigir este veículo, procure uma auto-escola."})
	self.Languages:SetLanguage("PLAYER_DO_NOT_LICENSED_YET", {["en"] = "Alert! You are not licensed to drive this vehicle, but you can drive because you level is below 5, go to a driving school faster you can.", ["pt"] = "Atenção! Você não possui habilitação para dirigir este veículo, porém como seu nível está abaixo de 5 você poderá, procure uma auto-escola o mais rápido possível."})
end


Licenses = Licenses()