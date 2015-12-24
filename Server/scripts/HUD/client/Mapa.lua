class("Mapa")(Tela)

function Mapa:__init()
	
	self.nome = "Mapa"

	self.mapaImagem = Image.Create(AssetLocation.Resource, "JCMap")


	self.tamanhoMapa = Vector2(32768, 32768)
	self.proporcao = self.tamanhoMapa.x / 5000--self.mapaImagem:GetSize().x
	
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
		self.mapaPosition = (Mouse:GetPosition() / self.zoom - (self.arrastando.posicaoInicialMouse / self.zoom - self.arrastando.posicaoInicialMapa))
	end
	
	Render:FillArea(Vector2(0, 0), Render.Size, Color(5, 37, 48))
	self.mapaImagem:SetPosition(self.mapaPosition - self.mapaImagem:GetSize() / 2)
	
	local transform2 = Transform2()
	transform2:Translate(Render.Size / 2)
	transform2:Scale(self.zoom)
	Render:SetTransform(transform2)
	
	self.mapaImagem:Draw()
	
	Render:ResetTransform()
	
	self:RenderSpots()
	
	Render:DrawText(Render.Size / 2, tostring(self.mapaPosition) .. " " .. tostring(self.zoom) .. " " .. tostring(self.mapaImagem:GetPosition()) .. " " .. tostring(Render.Size ), Color(255, 255, 255))
	Render:DrawText(Render.Size / 3, tostring(self:Vector3ToMapa(Vector3(0, 0, 0))), Color(255, 255, 255))
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
end


function Mapa:RenderSpots()
	local transform2 = Transform2()
	transform2:Translate(Render.Size / 2)
	Render:SetTransform(transform2)
	for i = #self.spots, 1, -1 do
		
		local spot = self.spots[i]
		if (spot) then 			
			local pos = spot:GetPosition()
			
			local posMapa = self:Vector3ToMapa(pos)

			spot:Render(posMapa, 0.9)
		end
	end
	
	Render:ResetTransform()
end


function Mapa:Vector3ToMapa(position)
	position = Vector2(position.x, position.z)
	return (position / self.proporcao + self.mapaPosition) * self.zoom
end


function Mapa:MapaToVector3(position)

	position = Vector3(position.x, 0, position.y)
	return (position * self.proporcao) * self.zoom
end


function Mapa:CenterMapa()
	local position = LocalPlayer:GetPosition()
	position = Vector2(position.x, position.z)
	self.mapaPosition = -(position / self.proporcao) * self.zoom
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