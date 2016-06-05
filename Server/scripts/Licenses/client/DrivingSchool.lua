class ("DrivingSchool")(EstablishmentModule)

function DrivingSchool:__init()
	self:ConfigureEstablishmentModule()
	self:SetLanguages()
	
	self.enterEstablishmentMessage = self.Languages.PLAYER_ENTER_DRIVINGSCHOOL
	self.spotType = "DRIVINGSCHOOL_SPOT"
	
	self.testing = false
	
	self.licenses = {"A", "B", "C", "D", "E", "F"}
	self.VehicleList = VehicleList()
	
	self.timer = Timer()
	
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("PostTick", self, self.PostTick)
end


function DrivingSchool:ModuleLoad()
	self.RoutesList = RoutesList()
end


function DrivingSchool:Render()
	if not self.testing then return end

	Render:SetFont(AssetLocation.Disk, "Archivo.ttf")
	
	local size = Vector2(200, 25)
	local pos = Vector2(310, Render.Height - 71)
	
	local textTimeRemaining = tostring(self.testing.routeTime)
	self:RenderRetangle(pos, size, self.Languages.LABEL_TIME, textTimeRemaining)
	
	local textCheckpointsRemaining = tostring(self.testing.actualCheckpoint) .. "/" .. tostring(#self.testing.checkpoints)
	self:RenderRetangle(pos, size, "Checkpoints", textCheckpointsRemaining)
	
	local textLicense = self.Languages.TEXT_LICENSE .. ": " .. tostring(self.testing.license)
	self:RenderRetangle(pos, size, textLicense, "")
	
	-- Checkpoints
	if Vector3.Distance(LocalPlayer:GetPosition(), self.testing.checkpoints[self.testing.actualCheckpoint]) < 10 then
		self:NextCheckpoint()
	end
end


function DrivingSchool:RenderRetangle(position, size, text, value)
	local margin = Vector2(5, 5)
	local textSize = 14
	
	Render:FillArea(position, size, Color(0, 0, 0, 100))
	Render:DrawText(position + margin, text, Color.White, textSize)
	Render:DrawText(position + Vector2(size.x - margin.x - Render:GetTextWidth(value, textSize), margin.y), value, Color.White, textSize)
	position.y = position.y - size.y - 2
end


function DrivingSchool:NextCheckpoint()
	if self.testing.checkpoints[self.testing.actualCheckpoint + 1] then
		self.testing.actualCheckpoint = self.testing.actualCheckpoint + 1
		Waypoint:SetPosition(self.testing.checkpoints[self.testing.actualCheckpoint])
	else
		self:FinishTest()
	end
end


function DrivingSchool:ConfigureContextMenu()
	if self.ContextMenu then
		self.ContextMenu:SetActive(false)
	end
	self.ContextMenu = ContextMenu({subtitle = self.Languages.TEXT_DRIVING_SCHOOL})
	self.ContextMenu.list.subtitleNumeric = false
	
	local licensesAcquired = LocalPlayer:GetLicenses()
	
	for _, license in pairs(self.licenses) do
		local acquired = licensesAcquired[license]
		
		local itemLicense = ContextMenuItem({
			text = self.Languages.TEXT_LICENSE .. " " .. license,
			textRight = acquired and nil or "R$ " .. self.VehicleList:GetPrice(license),
			legend = acquired and self.Languages.LICENSE_ACQUIRED or self.Languages.DESCRIPTION_LICENSE .. " " .. self.Languages["VEHICLE_LICENSE_" .. license] .. ".\n" .. self.Languages.DESCRIPTION_LICENSE_2,
			enabled = not acquired,
		})
		
		itemLicense.pressEvent = function()
			if itemLicense.enabled then
				self:StartTest(license)
			end
		end
		
		self.ContextMenu.list:AddItem(itemLicense)
	end
end


function DrivingSchool:PostTick()
	if not self.testing then return end
	if self.timer:GetSeconds() > 1 then
		if self.testing.started then
			self.testing.routeTime = self.testing.routeTime - 1
			if self.testing.routeTime <= 0 then
				self:FailedTest()
			end
		elseif LocalPlayer:InVehicle() then
			self.testing.started = true
		end
		self.timer:Restart()
	end
end


function DrivingSchool:StartTest(license)
	local licensesAcquired = LocalPlayer:GetLicenses()
	if licensesAcquired[license] then
		Events:Fire("AddNotificationAlert", {message = self.Languages.LICENSE_ACQUIRED})
		return
	end
	
	self:SetActive(false)
	
	local routes = self.RoutesList:GetRoute(license)
	self.testing = routes
	self.testing.started = false
	self.testing.license = license
	self.testing.actualCheckpoint = 1
	Waypoint:SetPosition(self.testing.checkpoints[1])
	Network:Send("StartTest", {modelId = routes.modelId, startingPosition = routes.startingPosition, startingAngle = routes.startingAngle})
	Events:Fire("AddNotificationAlert", {message = self.Languages.TEST_STARTED})
end


function DrivingSchool:FailedTest()
	Network:Send("FailedTest")
	Events:Fire("AddNotificationAlert", {message = self.Languages.TEST_FAILED})
	self.testing = false
	Waypoint:Remove()
end


function DrivingSchool:FinishTest()	
	Network:Send("FinishTest", {license = self.testing.license})
	Events:Fire("AddNotificationAlert", {message = string.gsub(self.Languages.TEST_COMPLETED), "{VALUE}", tostring(self.testing.license)})
	self.testing = false
	Waypoint:Remove()
end


function DrivingSchool:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_DO_NOT_LICENSED", {["en"] = "You are not licensed to drive this vehicle. Go to a driving school.", ["pt"] = "Você não possui habilitação para dirigir este veículo, procure uma auto-escola."})
	self.Languages:SetLanguage("PLAYER_ENTER_DRIVINGSCHOOL", {["en"] = "Press F to access the Driving School.", ["pt"] = "Pressione F para acessar a Auto-Escola."})
	self.Languages:SetLanguage("TEXT_DRIVING_SCHOOL", {["en"] = "Driving School", ["pt"] = "Auto-Escola"})
	self.Languages:SetLanguage("TEXT_LICENSE", {["en"] = "License", ["pt"] = "Habilitação"})
	self.Languages:SetLanguage("DESCRIPTION_LICENSE", {["en"] = "This License allows you to drive", ["pt"] = "Esta Habilitação permite você dirigir"})
	self.Languages:SetLanguage("DESCRIPTION_LICENSE_2", {["en"] = "Start the test to acquired the license.", ["pt"] = "Iniciar o teste para obter a Habilitação."})
	self.Languages:SetLanguage("LICENSE_ACQUIRED", {["en"] = "You already have this license.", ["pt"] = "Você já possui essa Habilitação."})
	self.Languages:SetLanguage("VEHICLE_LICENSE_A", {["en"] = "Motorcycles", ["pt"] = "Motos"})
	self.Languages:SetLanguage("VEHICLE_LICENSE_B", {["en"] = "Cars", ["pt"] = "Carros"})
	self.Languages:SetLanguage("VEHICLE_LICENSE_C", {["en"] = "Airplanes", ["pt"] = "Aviões"})
	self.Languages:SetLanguage("VEHICLE_LICENSE_D", {["en"] = "Bus and Trucks", ["pt"] = "Onibus e Caminhões"})
	self.Languages:SetLanguage("VEHICLE_LICENSE_E", {["en"] = "Helicopters", ["pt"] = "Helicopteros"})
	self.Languages:SetLanguage("VEHICLE_LICENSE_F", {["en"] = "Boats", ["pt"] = "Barcos"})
	self.Languages:SetLanguage("LABEL_TIME", {["en"] = "Time", ["pt"] = "Tempo"})
	self.Languages:SetLanguage("TEST_FAILED", {["en"] = "You failed in the test. You can try again at any time.", ["pt"] = "Você falhou no teste. Você ainda pode tentar fazê-lo a qualquer momento."})
	self.Languages:SetLanguage("TEST_COMPLETED", {["en"] = "You completed the test successfully and now own the license {VALUE}.", ["pt"] = "Você completou o teste com sucesso e agora possui a habilitação {VALUE}."})
	self.Languages:SetLanguage("TEST_STARTED", {["en"] = "The test is starting. Follow the checkpoints before the time reaches 0. Good luck.", ["pt"] = "O teste está iniciando, percorra todos os checkpoints antes do tempo chegar em 0. Boa sorte."})
	
end


DrivingSchool = DrivingSchool()