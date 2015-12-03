class 'HUD'

function HUD:__init()

	Events:Subscribe("Render", self, self.Render) 
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad) 
	
	Network:Subscribe("AtualizarSpots", self, self.AtualizarSpots) 

	self.raioHUD = 65
	self.bordaHUD = Vector2(60, 40)
	
	self:AtualizarPosicoes()
	
	self.spots = {}
	
	self.Velocimetro = nil
	self.Armometro = nil
	self.Minimapa = nil
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
				image = Image.Create(AssetLocation.Resource, spot.Spot)
			end
			table.insert(self.spots, Spot({name = spot.Nome, position = self:StringToVector3(spot.Posicao), image = image}))
		end
	end
	self.Minimapa.spots = self.spots
end


function HUD:AddSpot(spot)
	
	table.insert(self.spots, spot)
	self.Minimapa.spots = self.spots
end


function HUD:ModuleLoad()

	self.Velocimetro = Velocimetro()
	self.Armometro = Armometro()
	self.Minimapa = Minimapa()
	
	self:AddSpot(SpotPlayer())
	self:AddSpot(SpotWaypoint())
end


function HUD:AtualizarPosicoes()

	self.posicaoVelocimetro = Vector2(self.raioHUD + self.bordaHUD.x, Render.Height - self.raioHUD - self.bordaHUD.y)
	self.posicaoArmometro = Vector2(Render.Width - self.raioHUD - self.bordaHUD.x, Render.Height - self.raioHUD - self.bordaHUD.y)
	self.posicaoMinimapa = Vector2(self.bordaHUD.x, self.bordaHUD.y / 2)
end


function HUD:Render()
	
	-- Aim
	if LocalPlayer:GetUpperBodyState() ==  AnimationState.UbSAiming or LocalPlayer:GetBaseState() == AnimationState.SIdleFixedMg or LocalPlayer:GetBaseState() == AnimationState.SIdleVehicleMg then
		Render:FillCircle(Render.Size / 2, 2, Color(255, 255, 255, 150))
	end	
	self:AtualizarPosicoes()
	
	Render:SetFont(AssetLocation.SystemFont, "Impact")
	
	Game:FireEvent("gui.minimap.hide")
	Game:FireEvent("gui.hud.hide")
	
	if self.Velocimetro and LocalPlayer:InVehicle() then
		self.Velocimetro:Render(self.posicaoVelocimetro, self.raioHUD)
	end
	
	if self.Armometro and IsValid(LocalPlayer:GetEquippedWeapon().id) and LocalPlayer:GetEquippedWeapon().id != 0 then
		self.Armometro:Render(self.posicaoArmometro, self.raioHUD)
	end
	
	if self.Minimapa then
		self.Minimapa:Render(self.posicaoMinimapa, Vector2(self.raioHUD, self.raioHUD / 1.2)*2.5)
	end
end


function HUD:StringToVector3(str)

	local v = tostring(str):split(", ")
	return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
end


hud = HUD()