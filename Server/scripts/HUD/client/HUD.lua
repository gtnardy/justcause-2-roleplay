class 'HUD'

function HUD:__init()
	
	self.escalaHUD = 1
	self.confortoHUD = Vector2(80, 45)
	
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
	
	self.timer = Timer()
	
	Events:Subscribe("PostTick", self, self.PostTick)	
	
	Events:Subscribe("Render", self, self.Render) 
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad) 
	
	Network:Subscribe("AtualizarSpots", self, self.AtualizarSpots)
end


function HUD:AtualizarSpots(args)
	
	if args.spots then
		self.spots = {}
		self:AddSpot(SpotPlayer())
		self:AddSpot(SpotWaypoint())
		for i = 1, #args.spots do
			local spot = args.spots[i]
			local image = nil
			if (spot.Spot) then
				image = self:CreateImage(spot.Spot)
			end
			table.insert(self.spots, Spot({id = spot.Id, name = spot.Name, position = self:StringToVector3(spot.Position), image = image, description = spot.DescriptionType, spotType = spot.Spot, radius = tonumber(spot.Radius)}))
		end
	end
	
	self.Menu.mapa.spots = self.spots
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
end


function HUD:AtualizarPosicoes()
	self.tamanhoMinimapa = Vector2(225, 150) * self.escalaHUD
	self.posicaoMinimapa = Vector2(self.confortoHUD.x, Render.Height - self.confortoHUD.y - self.tamanhoMinimapa.y - 10)
	self.posicaoCurrentSpots = self.confortoHUD
	self.NotificationAlert.width = self.tamanhoMinimapa.x
end


function HUD:Render()

	self:AtualizarPosicoes()
	
	Game:FireEvent("gui.minimap.hide")
	Game:FireEvent("gui.hud.hide")
	
	Render:SetFont(AssetLocation.Disk, "Archivo.ttf")
	
	if self.BloodScreen then
		self.BloodScreen:Render()
	end
	
	if self.Menu:GetActive() then return end
	
	if self.Minimapa then
		Render:FillArea(self.posicaoMinimapa - Vector2(2, 8), self.tamanhoMinimapa + Vector2(4, 4), Color(0, 0, 0, 100))
		self.Minimapa:Render(self.posicaoMinimapa - Vector2(0, 6), self.tamanhoMinimapa)
	end
	
	if self.HealthBar then
		self.HealthBar:Render(self.posicaoMinimapa + Vector2(0, self.tamanhoMinimapa.y), Vector2(self.tamanhoMinimapa.x + 4, 11))
	end
	
	if self.Status then
		self.Status:Render(Vector2(Render.Width - self.confortoHUD.x - 160, Render.Height - self.confortoHUD.y), Vector2(160, 24), self.Languages)
	end
	
	if self.Alert then
		self:RenderAlert()
	end
	
	self:RenderWaypointsScreen()
	if Game:GetGUIState() != GUIState.ContextMenu then
		if self.InformationAlert and self.InformationAlert:HasMessage() then
			self.InformationAlert:Render(self.confortoHUD)
		elseif self.Checkpoint then
			self.Checkpoint:Render(self.posicaoCurrentSpots)
		end
	end
	
	if self.NotificationAlert then
		self.NotificationAlert:Render(self.posicaoMinimapa - Vector2(2, 15))
	end
	
	if self.Nametags then
		self.Nametags:Render()
	end
	
	if self.Objective then
		self.Objective:Render()
	end
	
	local positionUpperRight = Vector2(Render.Width - self.confortoHUD.x, self.confortoHUD.y)
	if self.Dinheiro then
		self.Dinheiro:Render(positionUpperRight)
	end
	
	positionUpperRight.x = positionUpperRight.x - 30
	
	if self.Experiencia then
		self.Experiencia:Render(positionUpperRight )
	end
end


function HUD:RenderWaypointsScreen()

	for _, waypointScreen in pairs(self.waypointsScreen) do
		waypointScreen:Render(self.confortoHUD)
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
	
	if message then
		local position = Render.Size / 2 - Render:GetTextSize(message, 20) / 2 + Vector2(0, 150)
		self.Alert:Render(position, message, Color.White, 20)
	end
end


function HUD:StringToVector3(str)

	local v = tostring(str):split(", ")
	return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
end


function HUD:SetLanguages()
	self.Languages:SetLanguage("PLAYER_STARVING", {["en"] = "You are starving!", ["pt"] = "Você está morrendo de Fome!"})
	self.Languages:SetLanguage("PLAYER_DYING_THIRST", {["en"] = "You are dying of thirst!", ["pt"] = "Você está morrendo de Sede!"})
	self.Languages:SetLanguage("PLAYER_OUT_FUEL", {["en"] = "You are out of fuel!", ["pt"] = "Você está sem combustível!"})
	self.Languages:SetLanguage("LABEL_HUNGER", {["en"] = "Hunger", ["pt"] = "Fome"})
	self.Languages:SetLanguage("LABEL_THIRST", {["en"] = "Thirst", ["pt"] = "Sede"})
	self.Languages:SetLanguage("LABEL_FUEL", {["en"] = "Fuel", ["pt"] = "Combustivel"})
end


hud = HUD()