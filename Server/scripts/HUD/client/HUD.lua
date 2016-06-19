class 'HUD'

function HUD:__init()
	
	self.escalaHUD = 1
	CONFORTOHUD = Vector2(80, 45)
	
	self.spots = {}
	
	self.spotsNear = {}
	self.lastUpdatePosition = nil
	self.images = {}
	
	self.waypointsScreen = {}
	
	self.Velocimetro = nil
	self.Armometro = nil
	self.Minimapa = nil
	self.HealthBar = nil
	self.Status = nil
	self.Menu = nil
	self.Alert = nil
	self.InformationAlert = nil
	self.NotificationAlert = nil
	self.Checkpoint = nil
	self.Nametags = nil
	self.Objective = nil
	self.Weapons = nil
	self.Dinheiro = nil
	self.Experiencia = nil
	
	self.Languages = Languages()
	self:SetLanguages()
	
	self.requestingAtualizarSpots = false
	self.timer = Timer()
	Events:Subscribe("PostTick", self, self.PostTick)	
	
	Events:Subscribe("Render", self, self.Render) 
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad) 
	Events:Subscribe("GameLoad", self, self.RequestAtualizarSpots) 
	
	Network:Subscribe("AtualizarSpots", self, self.AtualizarSpots)
end


function HUD:RequestAtualizarSpots()
	self.requestingAtualizarSpots = true
	Network:Send("RequestAtualizarSpots")
end


function HUD:AtualizarSpots(args)
	self.requestingAtualizarSpots = false
	if args.spots then
	
		self.Menu.ScreenJob.Map.spots = {}
	
		self.spots = {}
		self:AddSpot(SpotObjective())
		self:AddSpot(SpotPlayer())
		self:AddSpot(SpotWaypoint())
		
		for i = 1, #args.spots do
			local spot = args.spots[i]
			local image = nil
			if (spot.Spot) then
				image = self:CreateImage(spot.Spot)
			end
			
			local spotData = Spot({
				id = spot.Id, 
				name = spot.Name, 
				position = Vector3.ParseString(spot.Position), 
				image = image, 
				description = self.Languages[spot.Spot.."_DESCRIPTION"], 
				spotType = spot.Spot,
				radius = tonumber(spot.Radius),
				company = spot.IdCompany and {
					id = tonumber(spot.IdCompany), 
					production = tonumber(spot.Production),
					value = tonumber(spot.Value), 
					isFactory = not (tonumber(spot.IsFactory) == 0),
					owner = spot.IdOwner and {id = spot.IdOwner, name = spot.Owner} or nil
				} or nil,
			})
			
			table.insert(self.spots, spotData)
		end
	end
	
	self.Menu.ScreenJob:SetSpots(self.spots)
	self.Menu.ScreenMap:SetSpots(self.spots)
end


function HUD:CreateImage(name)
	if not self.images[name] then
		self.images[name] = Image.Create(AssetLocation.Resource, name)
	end
	return self.images[name]
	-- local image = Image.Create(AssetLocation.Disk, name..".png")
	-- if image:GetFailed() then
		-- image = Image.Create(AssetLocation.Resource, name)
	-- end
end


function HUD:PostTick()

	if (self.timer:GetSeconds() > 2) then
		if (not self.lastUpdatePosition or Vector3.Distance(self.lastUpdatePosition, LocalPlayer:GetPosition()) >= 200) then
			self.lastUpdatePosition = LocalPlayer:GetPosition()
			self.spotsNear = {}
			for i, spot in ipairs(self.spots) do
			
				if Vector3.Distance(spot:GetPosition(), self.lastUpdatePosition) < 1700 then
					table.insert(self.spotsNear, spot)
				end
			end
			
			self.Minimapa.spotsNear = self.spotsNear
			self.Checkpoint.spotsNear = self.spotsNear
		end
		self.timer:Restart()
	end
end


function HUD:AddSpot(spot)
	
	table.insert(self.spots, spot)
	
	--self.Minimapa.spots = self.spots
end


function HUD:AddWaypointScreen(waypoint)
	
	table.insert(self.waypointsScreen, waypoint)
end


function HUD:ModuleLoad()

	self.Minimapa = Minimapa()
	self.HealthBar = HealthBar()
	self.Status = Status()
	self.BloodScreen = BloodScreen()
	self.Menu = Menu()
	self.Alert = Alert()
	self.InformationAlert = InformationAlert()
	self.NotificationAlert = NotificationAlert()
	self.Checkpoint = Checkpoint()
	self.Nametags = Nametags()
	self.Objective = Objective()
	self.Weapons = Weapons()
	self.Dinheiro = Dinheiro()
	self.Experiencia = Experiencia()
	
	self:AddSpot(SpotPlayer())
	self:AddSpot(SpotWaypoint())
	
	self:AddWaypointScreen(WaypointScreenMap())
	
	self:AtualizarPosicoes()
	
	self:RequestAtualizarSpots()
end


function HUD:AtualizarPosicoes()
	self.tamanhoMinimapa = Vector2(225, 150) * self.escalaHUD
	self.posicaoMinimapa = Vector2(CONFORTOHUD.x, Render.Height - CONFORTOHUD.y - self.tamanhoMinimapa.y - 10)
	self.posicaoCurrentSpots = CONFORTOHUD
	self.NotificationAlert.width = self.tamanhoMinimapa.x - 16
end


function HUD:Render()
	self:AtualizarPosicoes()
	
	Game:FireEvent("gui.minimap.hide")
	Game:FireEvent("gui.hud.hide")
	
	if Game:GetHUDHidden() then return end
	
	Render:SetFont(AssetLocation.Disk, "Archivo.ttf")
	
	if self.BloodScreen then
		self.BloodScreen:Render()
	end
	
	if self.Menu:GetActive() then
		self.Menu:Render()
	end
	
	local positionUpperRight = Vector2(Render.Width - CONFORTOHUD.x, CONFORTOHUD.y)
	if self.Dinheiro then
		self.Dinheiro:Render(positionUpperRight)
	end
	
	if self.Weapons then
		self.Weapons:Render(Vector2(Render.Width - CONFORTOHUD.x, CONFORTOHUD.y + 30), Vector2(160, 24), self.Languages)
	end
	
	positionUpperRight.x = positionUpperRight.x - 30
	
	if self.Experiencia then
		self.Experiencia:Render(positionUpperRight )
	end
	
	if self.Menu:GetActive() then return end
	
	if self.Minimapa then
		Render:FillArea(self.posicaoMinimapa - Vector2(2, 8), self.tamanhoMinimapa + Vector2(4, 4), Color(0, 0, 0, 100))
		self.Minimapa:Render(self.posicaoMinimapa - Vector2(0, 6), self.tamanhoMinimapa)
	end
	
	if self.HealthBar then
		self.HealthBar:Render(self.posicaoMinimapa + Vector2(0, self.tamanhoMinimapa.y), Vector2(self.tamanhoMinimapa.x + 4, 11))
	end
	
	if self.Alert then
		self:RenderAlert()
	end
	
	local statusHeight = Render.Height - CONFORTOHUD.y
	self:RenderWaypointsScreen()
	if Game:GetGUIState() != GUIState.ContextMenu then
		if Game:GetGUIState() != GUIState.ConfirmationScreen then
			if self.InformationAlert and self.InformationAlert:HasMessage() then
				self.InformationAlert:Render(CONFORTOHUD)
			elseif self.Checkpoint then
				self.Checkpoint:Render(self.posicaoCurrentSpots)
			end
		end
	else
		statusHeight = statusHeight - 40
	end
	
	if self.Status then
		self.Status:Render(Vector2(Render.Width - CONFORTOHUD.x - 160, statusHeight), Vector2(160, 24), self.Languages)
	end
	
	if self.NotificationAlert then
		self.NotificationAlert:Render(self.posicaoMinimapa - Vector2(2, 15))
	end
	
	if self.Nametags then
		--self.Nametags:Render()
	end
	
	if self.Objective then
		self.Objective:Render(Vector2(Render.Width / 2, Render.Height - CONFORTOHUD.y))
	end
end


function HUD:RenderWaypointsScreen()

	for _, waypointScreen in pairs(self.waypointsScreen) do
		waypointScreen:Render(CONFORTOHUD)
	end
end


function HUD:RenderAlert()

	local message = nil
	
	if self.Status then
		if (self.Status.Sede and self.Status.Sede <= 0) then
			message = string.upper(self.Languages.PLAYER_DYING_THIRST)
		elseif (self.Status.Fome and self.Status.Fome <= 0) then
			message = string.upper(self.Languages.PLAYER_STARVING)
		elseif (LocalPlayer:InVehicle() and LocalPlayer:GetVehicle():GetDriver() == LocalPlayer and self.Status.Combustivel and self.Status.Combustivel <= 0) then
			message = string.upper(self.Languages.PLAYER_OUT_FUEL)
		end
	end
	
	if LocalPlayer:GetValue("DrivingSchool") and not LocalPlayer:InVehicle() then
		message = string.upper(self.Languages.TEXT_BACK_VEHICLE)
	end
	
	if message then
		local position = Render.Size / 2 - Render:GetTextSize(message, 20) / 2 + Vector2(0, 150)
		self.Alert:Render(position, message, Color.White, 20)
	end
end


function HUD:SetLanguages()
	self.Languages:SetLanguage("TEXT_BACK_VEHICLE", {["en"] = "Back to the vehicle!", ["pt"] = "Volte para o veículo!"})
	self.Languages:SetLanguage("PLAYER_STARVING", {["en"] = "You are starving!", ["pt"] = "Você está morrendo de Fome!"})
	self.Languages:SetLanguage("PLAYER_DYING_THIRST", {["en"] = "You are dying of thirst!", ["pt"] = "Você está morrendo de Sede!"})
	self.Languages:SetLanguage("PLAYER_OUT_FUEL", {["en"] = "You are out of fuel!", ["pt"] = "Você está sem combustível!"})
	self.Languages:SetLanguage("LABEL_HUNGER", {["en"] = "Hunger", ["pt"] = "Fome"})
	self.Languages:SetLanguage("LABEL_OXYGEN", {["en"] = "Oxygen", ["pt"] = "Oxigênio"})
	self.Languages:SetLanguage("LABEL_THIRST", {["en"] = "Thirst", ["pt"] = "Sede"})
	self.Languages:SetLanguage("LABEL_FUEL", {["en"] = "Fuel", ["pt"] = "Combustivel"})
	
	self.Languages:SetLanguage("VILLAGE_SPOT_DESCRIPTION", {["en"] = "Village", ["pt"] = "Vila"})
	self.Languages:SetLanguage("CITY_SPOT_DESCRIPTION", {["en"] = "City", ["pt"] = "Cidade"})
	self.Languages:SetLanguage("AIRPORT_SPOT_DESCRIPTION", {["en"] = "Airport", ["pt"] = "Aeroporto"})
	self.Languages:SetLanguage("PORT_SPOT_DESCRIPTION", {["en"] = "Port", ["pt"] = "Porto"})
	self.Languages:SetLanguage("MILITARY_SPOT_DESCRIPTION", {["en"] = "Military Base", ["pt"] = "Base Militar"})
	self.Languages:SetLanguage("STRONGHOLD_SPOT_DESCRIPTION", {["en"] = "Stronghold", ["pt"] = "Fortaleza Militar"})
	self.Languages:SetLanguage("RADIO_SPOT_DESCRIPTION", {["en"] = "Radio", ["pt"] = "Posto Avançado"})
	self.Languages:SetLanguage("OIL_SPOT_DESCRIPTION", {["en"] = "Oil Rig", ["pt"] = "Plataforma Petrolífera"})
	self.Languages:SetLanguage("FUEL_SPOT_DESCRIPTION", {["en"] = "Gas Station", ["pt"] = "Posto de Combustível"})
	self.Languages:SetLanguage("CLOTHINGSTORE_SPOT_DESCRIPTION", {["en"] = "Clothing Store", ["pt"] = "Loja de Roupas"})
	self.Languages:SetLanguage("FOODSTORE_SPOT_DESCRIPTION", {["en"] = "Food Store", ["pt"] = "Loja de Alimentos"})
	self.Languages:SetLanguage("BANK_SPOT_DESCRIPTION", {["en"] = "Bank", ["pt"] = "Banco"})
	self.Languages:SetLanguage("JOBSAGENCY_SPOT_DESCRIPTION", {["en"] = "Job Agency", ["pt"] = "Agência de Empregos"})
	self.Languages:SetLanguage("CLOTHINGFACTORY_SPOT_DESCRIPTION", {["en"] = "Clothing Factory", ["pt"] = "Fábrica de Tecidos"})
	self.Languages:SetLanguage("FOODFACTORY_SPOT_DESCRIPTION", {["en"] = "Food Factory", ["pt"] = "Fábrica de Alimentos"})
	self.Languages:SetLanguage("DRIVINGSCHOOL_SPOT_DESCRIPTION", {["en"] = "Driving School", ["pt"] = "Auto-Escola"})
	self.Languages:SetLanguage("HOSPITAL_SPOT_DESCRIPTION", {["en"] = "Hospital", ["pt"] = "Hospital"})
	self.Languages:SetLanguage("FARM_SPOT_DESCRIPTION", {["en"] = "Farm", ["pt"] = "Fazenda"})
	self.Languages:SetLanguage("WEAPONSSTORE_SPOT_DESCRIPTION", {["en"] = "Weapons Store", ["pt"] = "Loja de Armas"})
	self.Languages:SetLanguage("POLICEDEPARTMENT_SPOT_DESCRIPTION", {["en"] = "Police Department", ["pt"] = "Departamento de Polícia"})
	self.Languages:SetLanguage("WEAPONSFACTORY_SPOT_DESCRIPTION", {["en"] = "Weapons Factory", ["pt"] = "Fábrica de Armas"})
	self.Languages:SetLanguage("SYNTHETICFABRICFACTORY_SPOT_DESCRIPTION", {["en"] = "Synthetic Fabric Factory", ["pt"] = "Fábrica de Tecidos Sinteticos"})
end


hud = HUD()