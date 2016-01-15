class 'HUD'

function HUD:__init()
	
	self.escalaHUD = 1
	self.confortoHUD = Vector2(80, 25)

	self:AtualizarPosicoes()
	
	self.spots = {}
	
	self.Velocimetro = nil
	self.Armometro = nil
	self.Minimapa = nil
	self.Status = nil
	self.Fome = nil
	self.Menu = nil

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
				image = Image.Create(AssetLocation.Resource, spot.Spot)
			end
			table.insert(self.spots, Spot({name = spot.Nome, position = self:StringToVector3(spot.Posicao), image = image, description = spot.TipoDescricao}))
		end
	end
	
	self.Minimapa.spots = self.spots
	self.Menu.mapa.spots = self.spots
end


function HUD:AddSpot(spot)
	
	table.insert(self.spots, spot)
	
	--self.Minimapa.spots = self.spots
end


function HUD:ModuleLoad()

	self.Minimapa = Minimapa()
	self.Status = Status()
	self.Fome = Fome()
	self.Menu = Menu()
	
	self:AddSpot(SpotPlayer())
	self:AddSpot(SpotWaypoint())
end


function HUD:AtualizarPosicoes()
	self.tamanhoMinimapa = Vector2(200, 150) * self.escalaHUD
	self.posicaoMinimapa = Vector2(self.confortoHUD.x, Render.Height - self.confortoHUD.y - self.tamanhoMinimapa.y - 10)
end


function HUD:Render()
	
	-- Crosshair
	if LocalPlayer:GetUpperBodyState() ==  AnimationState.UbSAiming or LocalPlayer:GetBaseState() == AnimationState.SIdleFixedMg or LocalPlayer:GetBaseState() == AnimationState.SIdleVehicleMg then
		Render:FillCircle(Render.Size / 2, 2, Color(255, 255, 255, 125))
	end	
	self:AtualizarPosicoes()
	
	--Render:SetFont(AssetLocation.SystemFont, "Impact")
	
	Game:FireEvent("gui.minimap.hide")
	Game:FireEvent("gui.hud.hide")
	
	if self.Menu:GetActive() then return end

	if self.Minimapa then
		Render:FillArea(self.posicaoMinimapa - Vector2(2, 2), self.tamanhoMinimapa + Vector2(4, 4), Color(0, 0, 0, 100))
		self.Minimapa:Render(self.posicaoMinimapa, self.tamanhoMinimapa)
	end
	
	if self.Status then
		self.Status:Render(self.posicaoMinimapa + Vector2(0, self.tamanhoMinimapa.y + 6), Vector2(self.tamanhoMinimapa.x + 4, 10))
	end
	
	if self.Fome then
		self.Fome:Render(self.posicaoMinimapa, Vector2(self.tamanhoMinimapa.x, 9))
	end
end


function HUD:StringToVector3(str)

	local v = tostring(str):split(", ")
	return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
end


hud = HUD()