class("ScreenMapa")(Tela)

function ScreenMapa:__init()

	self:SetLanguages()

	self.nome = self.Languages.LABEL_MAP
	
	self.mouseMImagem = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAABAAAAAcCAYAAABoMT8aAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAANXSURBVHjanJDPSyNnHMafvJndiVMzs2uDiToq2oQQ0xxiRWwbXSzYQ7y126IHMT0sy1Z797AF6a1dkHqQQsF/oFQCFqpEL/1BqImDJAgtYTQuyeSXs/5KNplkM5neFmN3uquf4/s838/L92tYXl5Ga2srCoUC8vm8g2XZ+1ar1WO323lFUSz1ep0wDCNLkiSlUqlEOBz+eXJyMjY1NYVCoQCK4zgUi0UoivJ1IBD4xul0wmQyAQAaAOoN4DaBEwBUVUUikXi8vb39QyQS+ZJlWRi2trYgCEKv3+8/8ng8uEzk7yQURcGY19X0nk6nsbS09P7g4OBfRJIk0DT9wO12N5V2/9yG/O2HUJfHEN36CdqljOd5DAwMPMpkMiD5fB59fX0fEUJeFmoAqtEf4atn4SMylPD3KKOZ3t7eD0RRBEmlUresVuu7l8MGAI4140UrULoNvH33DsgVgcVisTMM009xHDcGwHw5JADUahEMAAMBXlTLTSsAQFtbG0RRvEdOT089PT09TeEtAM8sY/hDBP55ClQ674G+IuB5HsPDw+9QDMPwnZ2dTaEBwHufzOM3vIWMWoPv04cwXhEYjUaYzeYeymazWfEKOAr4+PMvoDQAluCVtLS0dBBCyF3ocJbLoZRJ68WgKOoOaW9v1xW8jlKpRJNiscjdVGCz2UykWq0a9QqqqkJVVV2BpmlGimEYRa9A0zSMRl0/ZFmuUcfHxyd6BYvF8r8rnJycKKRarT676Q1Yli2TeDx+Wi6XbyTI5/MyOTs7k/f39689nM1mEY/Hs8RkMqWPjo6uLYjFYlAURSKqqsYPDw+vLTg4OACAJBkaGgpHIhH5uoJoNKqOjIyEiNfr1RKJxO+CILzxsCRJEARBcLvdBXJ+fg6O456srq6+sWBlZQUul+uJz+cD1tbWsL6+DofD8evOzo72OkRR1Lq6umKbm5vY3d0FYVkWdrsdc3Nzn83MzBwnk0ndny8uLjA7O1uZn5/3d3d3I5fLgdTrdSSTSUxMTDyfnp4eDAQC0WAw+J/hcDgMv9+fGB0d9S4sLEg0TcPlcsGwsbEBg8GAWq2Gjo4OhEIhBIPBr/r7+++Pj487Go0G2dvbOwyFQr84nc7vFhcXVZ7nUalUoGka/h0Aqu96bgCcf84AAAAASUVORK5CYII=")
	self.mouseSImagem = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAABAAAAAcCAYAAABoMT8aAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAOQSURBVHjanI/PSyNnHMafeWeWiSGZUTdrYjImJWs2jakVt2Kl6BYLXpRSxG3Rg2suC91qbz14aEEWSqF78mB78j+oBCxUCULowgaMBknw0hCNbYwxPxpjYsyMycz00EU2bNKu+7k+z/P5vi+1vLwMnU6HTCaDdDrt4DjuodFo7O2y2sx39n4wq6pCMn2LqVwue5JIJKKBQOCXiYmJ8PT0NDKZDBie51EqlSCK4ncej+ep0+mERqMBUIDyxyEoCqA+G70L6CHLMqLR6LdbW1s/B4PBrziOA7FYLCiXy7apqamnfX19L8cA0Ios9z6OWScAPQCApmm4XC5MTk4+8fv9Q4lEAiSZTIJl2cdutxuv8mL/GH+G/Sj+FcbzyDFUVb3OBEFAT0/Pk5OTEzDpdBpOp/MTQsh1QZQkKNUKXF98D71OhxeKiPNiCa08d92x2WwfBYNBkEQicctoNL736nVFltFGFaB/8A1w/0vcpouAIte90GAwdGu1WjvD8/yD60++hBAaKtsGFKL/CtlWqBRVJ2hvb0csFvuYOTs767VarXUhy7JIFIHSTx9AEATkP/0d93R1NyAIAgYHB+8yWq1WMJvNdSFFAR/22pEy34N0i8W779wBw9S/gKZp6PV6K2MymYxowG06ixZtGbJchJ7OAHi91tLS0kkIIW2NBIpUhVRVUFMoKFK1UQUMw7QyHR0dDQWEE6A88kOWayCc0FBwcXHBMqVSiUcTJKYdNVSbxTCZTBpGkiS6WUGt5KHWagC4xrmq0oxWqxWbCViWBU039SOXy10x2Ww236xgMBjwX+TzeZFIkvQ33hKO4y5JJBI5u7y8fCtBOp3OkUKhkNvf37/xOJVKIRKJpIhGozk+Ojq6sSAcDkMUxSSRZTlyeHh4Y8HBwQEAxMnAwEAgGAzmbirY2dmRh4aGfKS/v1+NRqPPQ6HQG4+TySRCoVDI7XZnyPn5OXief7a6uvrGgpWVFbhcrmfDw8PA2toa1tfX4XA4ftve3lb/j1gsploslvDm5iZ2d3dBOI5Dd3c35ufnP5+dnc3G4/Gml4vFIubm5ioLCwvjXV1dOD09BanVaojH4xgbGyvPzMzc93g8O16v97VxIBDA+Ph4dGRkpH9xcTHJsixcLheojY0NUBSFq6srdHZ2wufzwev1fm232x+Ojo46FEUhe3t7hz6f71en0/nj0tKSLAgCKpUKVFXFPwMAvO2P5oESgUEAAAAASUVORK5CYII=")
	self.mapaImagem = Image.Create(AssetLocation.Resource, "JCMap")

	self.imageSize = Vector2(5000, 5000)
	self.tamanhoMapa = Vector2(32768, 32768)
	self.proporcao = self.tamanhoMapa.x / self.imageSize.x--self.mapaImagem:GetSize().x
	
	self.spots = {}
	
	self.spotHover = nil
	self.spotHoverSize = 20
	
	self.zoom = 1
	self.mapaPosition = Vector2(0, 0)
	
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("MouseDown", self, self.MouseDown)
	Events:Subscribe("MouseUp", self, self.MouseUp)
	Events:Subscribe("MouseScroll", self, self.MouseScroll)
end


function ScreenMapa:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("LABEL_MAP", {["en"] = "Map", ["pt"] = "Mapa"})
end


function ScreenMapa:Render()

	self.mapaImagem:SetAlpha(0.7)
	if self.arrastando then
		self.mapaPosition = self.mapaPosition + (Mouse:GetPosition() - self.arrastando.posicaoInicialMouse) / self.zoom
		self.arrastando.posicaoInicialMouse = Mouse:GetPosition()

		local maxi = 2200
		self.mapaPosition = Vector2(math.min(maxi, math.max(-maxi, self.mapaPosition.x)), math.min(maxi, math.max(-maxi, self.mapaPosition.y))) 
	end
	
	Render:FillArea(Vector2(0, 0), Render.Size, Color(1, 39, 51))
	self.mapaImagem:SetPosition(Render.Size / 2 - self.mapaImagem:GetSize() / 2 + self.mapaPosition * self.zoom)
	
	self.mapaImagem:Draw()

	self:RenderSpots()
	
	self:RenderSpotHover()
	
	self:RenderHUD()
end


function ScreenMapa:RenderSpotHover()
	if not self.spotHover then return end
	local pos = Render.Size / 2 + Vector2(0, 100)

	
	local title = string.upper(self.spotHover.name)
	Render:FillArea(pos - Vector2(Render:GetTextWidth(title, self.spotHoverSize) / 2 + 6, 3), Render:GetTextSize(title, self.spotHoverSize) + Vector2(13, 6), Color(0, 0, 0, 150))
	Render:DrawText(pos - Vector2(Render:GetTextWidth(title, self.spotHoverSize) / 2, 0), title, Color(248, 204, 64), self.spotHoverSize)
	
	if self.spotHover.description then
		pos = pos + Vector2(0, Render:GetTextHeight(title, self.spotHoverSize) + 10)
		local description = self.spotHover.description
		Render:FillArea(pos - Vector2(Render:GetTextWidth(description, self.spotHoverSize - 4) / 2 + 6, 3), Render:GetTextSize(description, self.spotHoverSize - 4) + Vector2(13, 6), Color(0, 0, 0, 150))
		Render:DrawText(pos - Vector2(Render:GetTextWidth(description, self.spotHoverSize - 4) / 2, 0), description, Color(255, 255, 255), self.spotHoverSize - 4)
	end
end


function ScreenMapa:RenderHUD()
	local pos = Vector2(Render.Width - CONFORTOHUD.x, Render.Height / 3)
	local text = "WAYPOINT"
	local textSize = 16
	
	Render:FillArea(pos - Vector2(50 + Render:GetTextWidth(text, textSize) + 10, 10), Render:GetTextSize(text, textSize) + Vector2(60, 20), Color(0, 0, 0, 150))
	Render:DrawText(pos - Vector2(50 + Render:GetTextWidth(text, textSize), 0), text, Color(255,255,255), textSize)
		
	self.mouseMImagem:SetPosition(pos - Vector2(25, Render:GetTextHeight(text, textSize) / 2 - 2))
	self.mouseMImagem:Draw()
	
	text = "ZOOM"
	pos = pos + Vector2(0, Render:GetTextHeight(text, textSize) + 25)
	Render:FillArea(pos - Vector2(50 + Render:GetTextWidth(text, textSize) + 10, 10), Render:GetTextSize(text, textSize) + Vector2(60, 20), Color(0, 0, 0, 150))
	Render:DrawText(pos - Vector2(50 + Render:GetTextWidth(text, textSize), 0), text, Color(255,255,255), textSize)
		
	self.mouseSImagem:SetPosition(pos - Vector2(25, Render:GetTextHeight(text, textSize) / 2 - 2))
	self.mouseSImagem:Draw()
end


function ScreenMapa:MouseDown(args)
	if not self.active then return end
	
	if args.button == 1 then -- Left Click
		Mouse:SetCursor(CursorType.Hand)
		self.arrastando = {posicaoInicialMouse = Mouse:GetPosition(), posicaoInicialMapa = self.mapaPosition}
		return
	end
end


function ScreenMapa:MouseUp(args)
	if not self.active then return end
	
	if args.button == 1 then -- Left Click
	
		Mouse:SetCursor(CursorType.Arrow)
		self.arrastando = false
	else
		if args.button == 3 then -- Middle Click
			local way, isset = Waypoint:GetPosition()

			if isset then
				Waypoint:Remove()
			else
				self:WaypointAt(Mouse:GetPosition())
			end
		end
	end
	
end


function ScreenMapa:MouseScroll(args)
	if not self.active then return end
	
	self:Zoom(args.delta)
end


function ScreenMapa:KeyUp(args)
	if not self.active then return end
	
	if args.key == VirtualKey.Space then
		self:CenterMapa()
	end
end


function ScreenMapa:Zoom(delta)
	self.zoom = math.min(1.3, math.max(0.2, self.zoom + delta / 30))
	self:UpdateMapa()
end


function ScreenMapa:UpdateMapa()
	self.mapaImagem:SetSize(self.imageSize * self.zoom)
	self.proporcao = self.tamanhoMapa.x / math.ceil(self.mapaImagem:GetSize().x)
end


function ScreenMapa:RenderSpots()

	self.spotHover = nil
	for i = #self.spots, 1, -1 do
		
		local spot = self.spots[i]
		if (spot) then 			
			local pos = spot:GetPosition()
			
			local posMapa = self:Vector3ToMapa(pos)
			local radius = tonumber(spot.radius)
			if not radius or (1000 - (self.zoom * 1800)  <= radius) then
				
				spot:Render(posMapa, math.sqrt(self.zoom, 2), 0.9)
				self:CheckSpotHover(spot, posMapa)
			end
		end
	end
end


function ScreenMapa:CheckSpotHover(spot, posMapa)
	if Vector2.Distance(posMapa, Mouse:GetPosition()) <= 10 then
		self.spotHover = spot
	end

end


function ScreenMapa:Vector3ToMapa(position)
	position = Vector2(position.x, position.z) + self.tamanhoMapa / 2
	
	local posicaoFinal = position / self.proporcao + self.mapaImagem:GetPosition()
	
	return posicaoFinal	
end


function ScreenMapa:CenterMapa()
	local position = LocalPlayer:GetPosition()
	position = Vector2(position.x, position.z)
	self.zoom = 1
	self:UpdateMapa()
	self.mapaPosition = -(position / self.proporcao)
end


function ScreenMapa:WaypointAt(mousePosition)
	if self.spotHover then
		Waypoint:SetPosition(self.spotHover:GetPosition())
	else
		local posicaofinal = ((self.tamanhoMapa.x * (mousePosition - self.mapaImagem:GetPosition())) / self.mapaImagem:GetSize().x) - self.tamanhoMapa / 2
		Waypoint:SetPosition(Vector3(posicaofinal.x, Physics:GetTerrainHeight(Vector2(posicaofinal.x, posicaofinal.y)), posicaofinal.y))
	end
end


function ScreenMapa:SetActive(bool)
	self.active = bool
	if bool then
		self:CenterMapa()
	end
end