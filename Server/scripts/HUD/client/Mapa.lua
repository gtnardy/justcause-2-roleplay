class("Mapa")(Tela)

function Mapa:__init()
	
	self.nome = "Mapa"

	self.mapaImagem = Image.Create(AssetLocation.Resource, "JCMap")

	self.imageSize = Vector2(5000, 5000)
	self.tamanhoMapa = Vector2(32768, 32768)
	self.proporcao = self.tamanhoMapa.x / self.imageSize.x--self.mapaImagem:GetSize().x
	
	self.spots = {}
	
	self.zoom = 1
	self.mapaPosition = Vector2(0, 0)
	
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("MouseDown", self, self.MouseDown)
	Events:Subscribe("MouseUp", self, self.MouseUp)
	Events:Subscribe("MouseScroll", self, self.MouseScroll)
	
end


function Mapa:Render()

	self.mapaImagem:SetAlpha(0.9)
	if self.arrastando then
		self.mapaPosition = self.mapaPosition + (Mouse:GetPosition() - self.arrastando.posicaoInicialMouse) / self.zoom
		self.arrastando.posicaoInicialMouse = Mouse:GetPosition()

		local maxi = 2200-- / self.zoom
		self.mapaPosition = Vector2(math.min(maxi, math.max(-maxi, self.mapaPosition.x)), math.min(maxi, math.max(-maxi, self.mapaPosition.y))) 
	end
	
	Render:FillArea(Vector2(0, 0), Render.Size, Color(1, 39, 51))
	self.mapaImagem:SetPosition(Render.Size / 2 - self.mapaImagem:GetSize() / 2 + self.mapaPosition * self.zoom)
	
	self.mapaImagem:Draw()

	self:RenderSpots()
	
	-- Render:DrawText(Render.Size / 2, tostring(self.mapaPosition) .. " " .. tostring(self.zoom) .. " " .. tostring(self.mapaImagem:GetPosition()) .. " " .. tostring(Render.Size ), Color(255, 255, 255))
	-- Render:DrawText(Render.Size / 3, tostring(self:Vector3ToMapa(Vector3(0, 0, 0))), Color(255, 255, 255))
end


function Mapa:MouseDown(args)
	if not self.active then return end
	
	if args.button == 1 then -- Left Click
		Mouse:SetCursor(CursorType.Hand)
		self.arrastando = {posicaoInicialMouse = Mouse:GetPosition(), posicaoInicialMapa = self.mapaPosition}
		return
	end
end


function Mapa:MouseUp(args)
	if not self.active then return end
	
	if args.button == 1 then -- Left Click
	
		Mouse:SetCursor(CursorType.Arrow)
		self.arrastando = false
	else
		if args.button == 3 then -- Middle Click
			self:WaypointAt(Mouse:GetPosition())
		end
	end
	
end


function Mapa:MouseScroll(args)
	if not self.active then return end
	
	self:Zoom(args.delta)
end


function Mapa:KeyUp(args)
	if not self.active then return end
	
	if args.key == VirtualKey.Space then
		self:CenterMapa()
	end
end


function Mapa:Zoom(delta)
	self.zoom = math.min(1.3, math.max(0.2, self.zoom + delta / 30))
	self:UpdateMapa()
end


function Mapa:UpdateMapa()
	self.mapaImagem:SetSize(self.imageSize * self.zoom)
	self.proporcao = self.tamanhoMapa.x / math.ceil(self.mapaImagem:GetSize().x)
end


function Mapa:RenderSpots()
	for i = #self.spots, 1, -1 do
		
		local spot = self.spots[i]
		if (spot) then 			
			local pos = spot:GetPosition()
			
			local posMapa = self:Vector3ToMapa(pos)

			spot:Render(posMapa, math.sqrt(self.zoom, 2), 0.9)
		end
	end
end


function Mapa:Vector3ToMapa(position)
	position = Vector2(position.x, position.z) + self.tamanhoMapa / 2
	
	local posicaoFinal = position / self.proporcao + self.mapaImagem:GetPosition()
	
	return posicaoFinal	
end


function Mapa:MapaToVector3(position)
	position = Vector3(position.x, 0, position.y)
	return (position * self.proporcao) * self.zoom
end


function Mapa:CenterMapa()
	local position = LocalPlayer:GetPosition()
	position = Vector2(position.x, position.z)
	self.zoom = 1
	self:UpdateMapa()
	self.mapaPosition = -(position / self.proporcao)
end


function Mapa:WaypointAt(mousePosition)
	mousePosition = mousePosition - self.mapaImagem:GetSize() / 2 + self.mapaPosition * self.zoom
	Waypoint:SetPosition(self:MapaToVector3(mousePosition))
end


function Mapa:SetActive(bool)
	self.active = bool
	if bool then
		self:CenterMapa()
	end
	Chat:SetEnabled(not bool)
end