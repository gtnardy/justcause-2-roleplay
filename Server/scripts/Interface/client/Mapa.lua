class 'Mapa'

function Mapa:__init()
	
	self.tamanhoMapa = 32768

	self.imagemMouseBotaoMeio = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAABAAAAAcCAYAAABoMT8aAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAANXSURBVHjanJDPSyNnHMafvJndiVMzs2uDiToq2oQQ0xxiRWwbXSzYQ7y126IHMT0sy1Z797AF6a1dkHqQQsF/oFQCFqpEL/1BqImDJAgtYTQuyeSXs/5KNplkM5neFmN3uquf4/s838/L92tYXl5Ga2srCoUC8vm8g2XZ+1ar1WO323lFUSz1ep0wDCNLkiSlUqlEOBz+eXJyMjY1NYVCoQCK4zgUi0UoivJ1IBD4xul0wmQyAQAaAOoN4DaBEwBUVUUikXi8vb39QyQS+ZJlWRi2trYgCEKv3+8/8ng8uEzk7yQURcGY19X0nk6nsbS09P7g4OBfRJIk0DT9wO12N5V2/9yG/O2HUJfHEN36CdqljOd5DAwMPMpkMiD5fB59fX0fEUJeFmoAqtEf4atn4SMylPD3KKOZ3t7eD0RRBEmlUresVuu7l8MGAI4140UrULoNvH33DsgVgcVisTMM009xHDcGwHw5JADUahEMAAMBXlTLTSsAQFtbG0RRvEdOT089PT09TeEtAM8sY/hDBP55ClQ674G+IuB5HsPDw+9QDMPwnZ2dTaEBwHufzOM3vIWMWoPv04cwXhEYjUaYzeYeymazWfEKOAr4+PMvoDQAluCVtLS0dBBCyF3ocJbLoZRJ68WgKOoOaW9v1xW8jlKpRJNiscjdVGCz2UykWq0a9QqqqkJVVV2BpmlGimEYRa9A0zSMRl0/ZFmuUcfHxyd6BYvF8r8rnJycKKRarT676Q1Yli2TeDx+Wi6XbyTI5/MyOTs7k/f39689nM1mEY/Hs8RkMqWPjo6uLYjFYlAURSKqqsYPDw+vLTg4OACAJBkaGgpHIhH5uoJoNKqOjIyEiNfr1RKJxO+CILzxsCRJEARBcLvdBXJ+fg6O456srq6+sWBlZQUul+uJz+cD1tbWsL6+DofD8evOzo72OkRR1Lq6umKbm5vY3d0FYVkWdrsdc3Nzn83MzBwnk0ndny8uLjA7O1uZn5/3d3d3I5fLgdTrdSSTSUxMTDyfnp4eDAQC0WAw+J/hcDgMv9+fGB0d9S4sLEg0TcPlcsGwsbEBg8GAWq2Gjo4OhEIhBIPBr/r7+++Pj487Go0G2dvbOwyFQr84nc7vFhcXVZ7nUalUoGka/h0Aqu96bgCcf84AAAAASUVORK5CYII=")
	self.imagemMouseScroll = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAABAAAAAcCAYAAABoMT8aAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAOQSURBVHjanI/PSyNnHMafeWeWiSGZUTdrYjImJWs2jakVt2Kl6BYLXpRSxG3Rg2suC91qbz14aEEWSqF78mB78j+oBCxUCULowgaMBknw0hCNbYwxPxpjYsyMycz00EU2bNKu+7k+z/P5vi+1vLwMnU6HTCaDdDrt4DjuodFo7O2y2sx39n4wq6pCMn2LqVwue5JIJKKBQOCXiYmJ8PT0NDKZDBie51EqlSCK4ncej+ep0+mERqMBUIDyxyEoCqA+G70L6CHLMqLR6LdbW1s/B4PBrziOA7FYLCiXy7apqamnfX19L8cA0Ios9z6OWScAPQCApmm4XC5MTk4+8fv9Q4lEAiSZTIJl2cdutxuv8mL/GH+G/Sj+FcbzyDFUVb3OBEFAT0/Pk5OTEzDpdBpOp/MTQsh1QZQkKNUKXF98D71OhxeKiPNiCa08d92x2WwfBYNBkEQicctoNL736nVFltFGFaB/8A1w/0vcpouAIte90GAwdGu1WjvD8/yD60++hBAaKtsGFKL/CtlWqBRVJ2hvb0csFvuYOTs767VarXUhy7JIFIHSTx9AEATkP/0d93R1NyAIAgYHB+8yWq1WMJvNdSFFAR/22pEy34N0i8W779wBw9S/gKZp6PV6K2MymYxowG06ixZtGbJchJ7OAHi91tLS0kkIIW2NBIpUhVRVUFMoKFK1UQUMw7QyHR0dDQWEE6A88kOWayCc0FBwcXHBMqVSiUcTJKYdNVSbxTCZTBpGkiS6WUGt5KHWagC4xrmq0oxWqxWbCViWBU039SOXy10x2Ww236xgMBjwX+TzeZFIkvQ33hKO4y5JJBI5u7y8fCtBOp3OkUKhkNvf37/xOJVKIRKJpIhGozk+Ojq6sSAcDkMUxSSRZTlyeHh4Y8HBwQEAxMnAwEAgGAzmbirY2dmRh4aGfKS/v1+NRqPPQ6HQG4+TySRCoVDI7XZnyPn5OXief7a6uvrGgpWVFbhcrmfDw8PA2toa1tfX4XA4ftve3lb/j1gsploslvDm5iZ2d3dBOI5Dd3c35ufnP5+dnc3G4/Gml4vFIubm5ioLCwvjXV1dOD09BanVaojH4xgbGyvPzMzc93g8O16v97VxIBDA+Ph4dGRkpH9xcTHJsixcLheojY0NUBSFq6srdHZ2wufzwev1fm232x+Ojo46FEUhe3t7hz6f71en0/nj0tKSLAgCKpUKVFXFPwMAvO2P5oESgUEAAAAASUVORK5CYII=")

	--self.imagemVillage:SetSize(	self.imagemVillage:GetSize() * 1.2)
	self.image = Image.Create(AssetLocation.Base64, Base64().getMapa())
	--"map.jpg")

	self.nuvens = {}
	table.insert(self.nuvens, Nuvem({posicao = Vector3(8000, 0, -54000), altura = 11}))
	table.insert(self.nuvens, Nuvem({posicao = Vector3(16000, 0, -36000), altura = 13}))
	table.insert(self.nuvens, Nuvem({posicao = Vector3(20000, 0, -48000), altura = 11}))
	table.insert(self.nuvens, Nuvem({posicao = Vector3(-6000, 0, -34000), altura = 14}))
	table.insert(self.nuvens, Nuvem({posicao = Vector3(10000, 0, -19000), altura = 13}))
	table.insert(self.nuvens, Nuvem({posicao = Vector3(-2000, 0, -30000), altura = 14}))
	table.insert(self.nuvens, Nuvem({posicao = Vector3(32000, 0, -24000), altura = 14}))

	self.posicaoAnteriorMouse = Vector2(0,0)
	self.positionVariante = Vector2(0,0)
	self.spots = {}
	
	self.waypointActive = false
	
	self.zoom = 1
	self.size = self.image:GetSize()
	self.position = Vector2(0, 0)
	self.image:SetSize(self.size * self.zoom)
	self:Centralizar(LocalPlayer:GetPosition())

	self.active = false
	self.mouseDown = false
	

	self:AddSpot(PlayerSpot())
	self:AddSpot(WaypointSpot())

	--Events:Subscribe("PostRender", self, self.Render)
	Events:Subscribe("MouseScroll", self, self.MouseScroll)
	Events:Subscribe("MouseUp", self, self.MouseUp)
	Events:Subscribe("MouseDown", self, self.MouseDown)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	

end


function Mapa:Centralizar(posicao) 

	self.zoom = 1
	self.positionVariante = -(Render.Size / 2 - self.image:GetSize() / 2)
	self:AtualizarPosition()

	local posMapa = self:Vector3ToScreen(posicao)

	self.positionVariante = (self.positionVariante - posMapa + Render.Size / 2)
	
end


function Mapa:AddSpot(spot) 

	table.insert(self.spots, spot)
	return #self.spots

end


function Mapa:DeleteSpot(id) 

	self.spots[id] = nil

end


function Mapa:KeyUp(args)
	
	if (args.key == 32) then
		self:Centralizar(LocalPlayer:GetPosition())
		
	end

end


function Mapa:GetActive()

	return self.active

end


function Mapa:SetActive(boo)

	self.active = boo
	self:Centralizar(LocalPlayer:GetPosition())

end


function Mapa:MouseDown(args)

	if (not self.active) then return end
	if (args.button == 1) then
		self.mouseDown = true
		self.posicaoAnteriorMouse = Mouse:GetPosition()
	end

end


function Mapa:MouseUp(args)

	if (not self.active) then return end
	
	if (args.button == 1) then
		self.mouseDown = false
	end
	
	if (args.button == 3) then
		
		self.waypointActive = not(self.waypointActive)
		if (self.waypointActive) then
			local pos = self:ScreenToMap(Mouse:GetPosition())
			
			if (self.spotSelecionado and self.spotSelecionado:IsSelecionavel()) then

				Waypoint:SetPosition(self.spotSelecionado:GetPosicao())

			else
				Waypoint:SetPosition(Vector3(pos.x, Physics:GetTerrainHeight(Vector2(pos.x, pos.y)), pos.y))
			end
		else
			Waypoint:SetPosition(Vector3(0, 200, 0))
			Waypoint:Remove()
		end
	end
	
end


function Mapa:Render()

	if (Game:GetState() == GUIState.Game) then
		--if (self.active) then
			Render:SetClip(true, Vector2(0, 0), Render.Size)
			if (self.mouseDown) then
			
				self.positionVariante = self.positionVariante + (Mouse:GetPosition() - self.posicaoAnteriorMouse) / self.zoom
				self.posicaoAnteriorMouse = Mouse:GetPosition()
			end
			
			self.positionVariante.x = math.min(1600, math.max(-1600, self.positionVariante.x))
			self.positionVariante.y = math.min(1600, math.max(-1600, self.positionVariante.y))
			
			Render:FillArea(Vector2(0, 0), Render.Size, Color(0, 41, 57))

			self:AtualizarPosition()
			
			self.image:Draw()
			
		
			self.spotSelecionado = nil
			
			for i = #self.spots, 1, -1 do
				spot = self.spots[i]
				if (spot) then
					local podeRenderizar = true
					if (spot:GetTipo() == 9) then
					
						if (self.zoom < 1.2) then
							podeRenderizar = false
						end
					else
					
						if (spot:GetTipo() == -3) then
						
							if (self.zoom < 0.8) then
								podeRenderizar = false
							end
						
						end					
					end

					
					if (podeRenderizar) then
						local zoom = math.sqrt(self.zoom, 2)
						
						local posScreen = self:Vector3ToScreen(spot:GetPosicao())
						
						if (posScreen.x < Render.Width and posScreen.y < Render.Height and posScreen.x > 0 and posScreen.y > 0) then
					
							if (spot:GetTipo() == -1 or spot:GetTipo() == -2) then
								spot:Render(posScreen, zoom)
							else
								if (self.zoom > 0.3 or spot:GetTipo() == -4 or spot:GetTipo() == -5) then
									spot:Render(posScreen, zoom)

									local posMouse = Mouse:GetPosition()
										
									if (self:isIntersecting(posScreen, posMouse, 10 / math.max(self.zoom, 1))) then
										self.spotSelecionado = spot
									end
								
								end
							end
						end
						
					end

				end

			end
			
			for i, nuvem in ipairs(self.nuvens) do
				local posScreen = self:Vector3ToScreen(nuvem:GetPosicao())
				nuvem:Render(posScreen, self.zoom)
				-- nuvem:Render(self.zoom, self.positionVariante)
				
			end
			
			if (self.spotSelecionado) then
				
				self:RenderSpotInfo(self.spotSelecionado)
			
			end
			
			if self.active then
				local posicaoGuia = Vector2(Render.Width - 50, Render.Height / 3)
				local text = "WAYPOINT"
				
				Render:FillArea(posicaoGuia - Vector2(80 + Render:GetTextWidth(text, 15), 10), Render:GetTextSize(text, 15) + Vector2(80, 20), Color(0, 0, 0, 100))
				self:DrawTextGrande(posicaoGuia - Vector2(80 + Render:GetTextWidth(text, 15), 10) + Vector2(10, Render:GetTextHeight(text, 15) / 2 + 3), text, Color(255,255,255), 15)
				
				self.imagemMouseBotaoMeio:SetPosition(posicaoGuia - Vector2(35, Render:GetTextHeight(text, 15) / 2))
				self.imagemMouseBotaoMeio:Draw()		

				local text = "ZOOM"
				
				posicaoGuia = posicaoGuia+ Vector2(0, 37)
				Render:FillArea(posicaoGuia - Vector2(80 + Render:GetTextWidth(text, 15), 10), Render:GetTextSize(text, 15) + Vector2(80, 20), Color(0, 0, 0, 100))
				self:DrawTextGrande(posicaoGuia - Vector2(80 + Render:GetTextWidth(text, 15), 10) + Vector2(10, Render:GetTextHeight(text, 15) / 2 + 3), text, Color(255,255,255), 15)
				
				self.imagemMouseScroll:SetPosition(posicaoGuia - Vector2(35, Render:GetTextHeight(text, 15) / 2))
				self.imagemMouseScroll:Draw()	
				
				
				local pos = LocalPlayer:GetPosition()
				local textPositionX = "X: " .. math.ceil(pos.x * 10) / 10 
				local textPositionY = "Y: " .. math.ceil(pos.y * 10) / 10
				local size = 16

				self:DrawTextSombreado(Render.Size - Vector2(200, 100), textPositionY, Color(255,255,255), size)
				self:DrawTextSombreado(Render.Size - Vector2(280, 100), textPositionX, Color(255,255,255), size)
			end
			
			
		--end
	end

end


function Mapa:RenderSpotInfo(spot)
	
	local nome = string.upper(spot:GetNome())
	local descricao = spot:GetDescricao()
	local tamNome = 20
	local tamTexto = 18
	
	if (nome and nome != "") then
		self:DrawTextFundo(Vector2(Render.Width / 2, Render.Height - Render.Height / 2.5) - Render:GetTextSize(nome, tamNome) / 2, nome, Color(248,204,64), tamNome, 8, 8)
	end
	
	if (descricao and string.len(descricao) > 0) then
		self:DrawTextFundo(Vector2(Render.Width / 2, Render.Height - Render.Height / 2.5 + Render:GetTextHeight(nome, tamNome) * 1.25) - Vector2(Render:GetTextWidth(descricao, tamTexto) / 2, 0), descricao, Color(255,255,255), tamTexto, 8, 8)
	end
	
end


function Mapa:DrawTextFundo(pos, txt, color, size, espacamentoL, espacamentoS)
	
	Render:FillArea(pos - Vector2(espacamentoL, espacamentoS), Render:GetTextSize(txt, size) + Vector2(2 * espacamentoL, 1.25 * espacamentoS), Color(0, 0, 0, 150))
	color.a = 240
	self:DrawTextGrande(pos, txt, color, size)

end


function Mapa:DrawTextGrande(pos, txt, color, size)

	Render:DrawText(pos - Vector2(1,0), txt, color, size)
	Render:DrawText(pos, txt, color, size)
	
end


function Mapa:DrawTextSombreado(pos, txt, color, size)

	self:DrawTextGrande(pos - Vector2(1,0), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos - Vector2(0,1), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos - Vector2(1,1), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos + Vector2(1,1), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos + Vector2(0,1), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos + Vector2(1,0), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos, txt, color, size)
	
end


function Mapa:isIntersecting(pos1, pos2, raio)

	if (pos1.x + raio >= pos2.x and pos1.y + raio >= pos2.y and pos1.x - raio <= pos2.x and pos1.y - raio <= pos2.y) then
		return true
	end
	
	return false
	
end


function Mapa:AtualizarPosition()
	
	self.image:SetSize(self.size * self.zoom)
	self.position = Render.Size / 2 - self.image:GetSize() / 2 + self.positionVariante * self.zoom
	self.image:SetPosition(self.position)
	--Chat:Print(tostring(self.position), Color(255,0,0))
end


function Mapa:MouseScroll(args)

	if (self.active) then
	
		self:Zoom(args.delta)

	end
end


function Mapa:Zoom(delta)

	self.zoom = math.min(1.3, math.max(0.3, self.zoom + delta / 20)) --math.min(math.max(1, self.zoom + args.delta), 200)

end


function Mapa:ScreenToMap(posScreen)

	local tamMapa = 16384
	local prop = tamMapa / self.image:GetSize().x
	
	local posMapa = posScreen - self.image:GetPosition()
	
	local posicaofinal = (tamMapa * 2 * posMapa) / self.image:GetSize().x --*-1
	posicaofinal = posicaofinal - Vector2(tamMapa, tamMapa)

	return posicaofinal

end


function Mapa:Vector3ToScreen(posicao)

	posicao = Vector2(math.ceil(posicao.x) + self.tamanhoMapa / 2, math.ceil(posicao.z) + self.tamanhoMapa / 2)

	local prop = self.tamanhoMapa / math.ceil(self.image:GetSize().x)

	local posicaoFinal = posicao / prop + self.image:GetPosition()
	
	return posicaoFinal

end
