class 'Minimapa'

function Minimapa:__init()

	self.active = true
	
	self.posicaoMinimapa = Vector2(10, 10)
	self.tamanhoMinimapa = Vector2(Render.Height / 3.5, Render.Height / 4)

	self.tamanhoMapa = 32768
	
	self.posicaoImagem = Vector2(0, 0)
	
	self.imagensTipo = {}
	self.imagensTipo[1] = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAHLSURBVHjaxJa/TsMwEIc/u6VFLaggkOiAgKUTqFMGxMpQhvIgfjYWJJYuvAETKxtiQQIB4o9QUGqWS3SENAkB0pNOsd3kvp6dy/0M383I1crYqrUi88BUXeO1b8H1vKF8QY1NDtiLR+IfahxpqMmAtcQXxVsCtgXAqYBC4F08FE+gzQxYB+gCy8CSzFsqy1nASIK/AS/AM/AqvyfQZgasB6wCa8CEanYE3KuEEqiVSQzsCqwPTJxzeO9/5M455I/2JVZX7VAC68gNe8AI8M45X9Wcc/FLNJKYfWE04nPsATvA/m9hGdB9id0DmkbSXQLWgU3g3Hufe0CDYQDA1eVF7n3GGIBD4Aa4A16semkWBF4Klh7nWEvVs7GqLKw+2KLM4uwGw4AwDPMea+ga1sC8L8kX2GAYMBgGCXQ3OMjdWR3bltmTNEyv60zLmK0KqwotleEsmIZOTk9KZWiANrACbABbwFm6LMpuV7pMpCyOgWvgFni01Gw21c982UyKij6jV/o0cCot5K8tUioAq3pZ3Dz/2kKlAHztH++5tCddGttAAIyrQhVsLLG2JXYbMOafJcYD8CQ6JwQiU4OIetMiqnaZOFchXIvU/xwAtrgPIlSenlYAAAAASUVORK5CYII=")
	self.imagensTipo[2] = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAGmSURBVHjaxJZNT8JAEIafXQoYwKDRAwcTvHnx6IGzHvBg4u/Yn8eNi/wP7h41xojE1JT1Mq1DaaHlo7zJpNtC3qczu9sdw6qMXK2MrXq2SR5YqGv8bMVc39dU1NXYrAF7iUjiV40jDTUZsIbEiURDwHYDcCGgEPiRCCUSaJABawFt4BToyH1DZZkHjMR8DsyAL+Bbfk+gQQasC5wDF8CY7fQIvKuEEqiVmxjYFlgPGDvn8N6XCucc8qI98WqrCiWwlvzhFhgC3jnnt5VzLl5EQ/HsCaMWz2MXuAYGu8IyoAPx7gKBkXQ7wCVwBbx4/791bp7vMydpOppsnEhjDMAD8Aq8ATOrFk1d4GvNi4BSaqj9bKzaFlZP7B5V03tY78PcL4kua954TQWWvIMirzgdTRLz9Lisgl1qVTDDJdmyxnmrtqhs0ZLusErLA/epIHWe+bIl1RnnlHvJ26bOs+gASUWqC8Cqsyw+PPetUHUAvvKP91GOJwM0gTOgD9wBT9tCFexJvPri3QSMOXCL8QF8Sp8TApGpoIma6yaq8jbxqI1wJa3+3wC9xfoJP4GIbwAAAABJRU5ErkJggg==")
	self.imagensTipo[3] = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAGoSURBVHjaxJbPTsJAEIe/XUoxgEGjBw4m+AAePRCuHvDAiyxPyMUjb+JRY4xIDKasB6bNAIVuGyyTTLrb3fy+zv7pjGHfjDyttK16V2QeWKtn+m5PXPcbypuqbY6AvXgi/qvaiYaaHFgsfiEeC9gWANcCWgE/4ivxDBrlwNpAB7gEutKPVZSHgImIL4EF8AV8y3gGjXJgPeAauAFmVLNn4F0FlEGtdFJgR2B9YOacw3tfyp1zyIf2RaujViiDtWXCAzAGvHPOVzXnXHqIxqLZF0Yj3ccecA8MQ2DpqQyEDkW7B0RGwu0Ct8Ad8LLRPGzGbM5O4Lwn4BV4AxZWHZqmwE9tsbrPxqprYfXGntAa+g5roCnxCytjW9qWmi0q9anGVDo82mxVWOhYJaAW1NHodijUVoWlNp/PS0GjnXyWuxnH9mg0GmXjB4Bb2nYnnyVlYIFzE1UFYFUuS5Nn8BIH7ttKVQDeqsjS5Ml0Oi2MpChypbFUCXh9lvRkgBZwBQyAR2BSFapgE9EaiHYLMOafS4wP4FMvq6mhiNJ76GsvE89aCNdS6v8NALNsuZ/vvj3QAAAAAElFTkSuQmCC")
	self.imagensTipo[4] = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAHBSURBVHjaxJY7TsNAEIa/3ZiACCggkEgBgQNQUqSngCIcZFMkXXIGSs5CQ8NlIhokECAgQiB7aSbWxNjxQ2BGGnkf1v/t7uxjDD/NyNdK2aq2PPNApL7zth/iut5QvqLKZgnYi4fiX6ocaqhJgTXF18SbArY5wEhAn8CH+Kd4DA1SYOtAC9gENqTeVLPMAoYiPgPegFfgXfpjaJACawPbwA5wQzU7Bx7VhGKolcoc2BJYB7hxzuG9L+XOOWSgHdFqqRWKYevywzFwBnjnnK9qzrn5JjoTzY4wGvM4toEjoFcEdjAc+4PhuCi0J9ptIDAy3Q1gF9gHbr33mcHpjiYL9enVZea/xhiAU+AOeADerNo0KwLPhU2vLmNQcgAp1lTn2Vh1LKwO7C9aQ59hA6wCW8Ae0AWuf3lJL4ApcA8827LD1YBlsCyz1Gy1A4MiuzJvCcvE1VaJXZm+LKBXXmgWRfuS2jbxnoXLRt8dTRbEk/WMmYYqC6Dw1ZZ3o6TBsq62KPF4MhgMUgXTRLPalcZMPcDRvzxP+no7BE6AflWogvVF61C0VwFj/jjFeAJe9LKaGpIoHUNfe5r4r4lwLan+9wD4Q8yyI3I22wAAAABJRU5ErkJggg==")
	self.imagensTipo[5] = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAIySURBVHjaxJbNbtNAEMd/69gubQoBwSEHpPIAySERQj0Woaoc+iL7hpUQ4twc6IFX4AiCKk6amjjLobPWZP2RBEH4SyPveq357Xg/ZgxVGXlG0o7Uu01ywEo9/buKc93vKEtU27SAnVgh9ku1Cw01NbBU7JFYKuBoA3AloBxYiOViJTSugR0BXeAxcCz9VEXZBCzE+RzIgCkwk/ESGtfAesAz4DlwxZ/pPfBdBVRCI+l4YFdgfeDKWotzbiez1iIT7YuvrvpDJexIPhgAF4Cz1romXY8G7no0aBy31vpNdCE++8Lo+HXsAa+AUw9b3d+7ZZY5VxQVUGhayyxzxWKhoafiuwfERsI9Bl4AL4GPzj3s4sl4CMCbz1/Ktu/r8fAbP26MAXgHfAW+AVmkNk0i8Iom42HpxPebYDVK1Xk2kToWkV7Yumg0tC2yQB19hjWw9ibRoBAawhqiXPMdtR2mOpBvN8EaoizVCixms8oG8c7DSfixYj5vBcZtg51ul8l4yOjDJ+InPUySsLq7q/wFl+csp9PGdd46Qq+b87eYJGEyHhIdHlbW2KQpN+dnW915rcDl7U/+tuIgn60lyzCacDPtkJRdmJ58PivWgElaewnsqEJVAcQql/nkqU6QabzW6ibQEHmuKgDXeHm3aVO2CDLG2uW9c3pqyxTbpicDHABPgRPgNXC5TaQbYJfi60R8Hzws0r8tMX4At1Ln5EBh9lBEzXURtfcy8b8Wwnsp9X8PAHNTLXg2Ez5bAAAAAElFTkSuQmCC")
	self.imagensTipo[6] = Image.Create(AssetLocation.Base64, "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")
	self.imagensTipo[7] = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAOXSURBVHjaxJZfaFtVHMc/9zZNytoSk24krsMqQpEowqqb64MgrbCoHYgiTsGHvGzcIIIPssFQhLoNfFAU6YNTKeKKo64Pq7XFbAwXWZvabKMV+m9OrFUR29U2TfonS38+7NzLaZq2a8HuBz/uOeee8/3cc8495/czWGmGepqqbGpt65kAS9rTblshrteLNC/WysYaYFGeU57VyjkdahSAuZWXKHcrsLkOcEmBFoF55YvKHairAGwbUAqUA2Wq7tZmuRowp8QzwCyQAtLqvQN1FYB5AR9QAXSxOQsDk9qEHKipKjawVMGCQJdlWYjIhtyyLNSHBpVWqbZCDmyb6vAIsB8Qy7Jks2ZZlv0T7VeaQcUosvfRC9wP7MuHnT5xRMZHB9eF/HVjRL56761C0H1K22svsRvwA9VAHeAMavv4uERCXklNTUry/LcykuxeAbp+NSF9sXOSSc1IJOSVr98/5rxTwDql7VcsPMAO4GG12c6A6N5dcumbL2Vhbk4iIa8MJi6JiMjJ18LSeLBeRESG+y5LJOSV+fSs9HS0yuGaYD4wrLR3AB5TOxamvrG21TzdwPBPccp8FTy090m6288wkuzmRn8fF1o+pfqxWsr92+mPx9hd9xyuYne+RJF+hvVzWPAmuXaxkz3hF5idmmSoN07tgZdJnm/nVjZL/auHuH4tQermBKHapxiIx8guLhS6Kpdpe4AA8CjQoC/p2Y8anT3s7WyTod4fV+zh6NUe6elolczMtERCXjl94kj+kjYo7YBirQ4UEWl+5w0ZGxpw6v3xmByuCcqh3QHp7Wxz2sdHB+WLt19fNrYQ0FDAe1TDfUD77b6FrfFgPXOzMxS7PdzKZjnenli1r2EYAAeAMeBv4F/XRu6rmZv/8OtAkmMtMcp9FRx9poaJ8d/YvqvqjjXMjQCT358D4OKZz+lq/gSAROfZDV2yZl48k7U6X2g5hS+wk3sfqMYf2Emg6kF+aG2+k6DsaJt58Sy32qjfh3/mz1+GWMikSU9PkUlNM59JM/HHGKNXetYC5rQsAFOLZXbwLGjfffYhxZ4SXjl6En+wEn+wkpfefJeS0jI6Tn2wFnBRywDEpc3MDp5Eo1GampqWjfIFK9kTfp4nnn0Rs+j2vyayxMiVy4VuF6LRqF3MaAF46a6EJ/0sVgGP2xfAZqAarEFpVSltD2AY/3OKMQVM68tqbEESpe+hbHmaeFcT4S1J9f8bAKH3CBFji/0fAAAAAElFTkSuQmCC")
	
	self.image = Image.Create(AssetLocation.Base64, Base64().getMapa())
	self.image:SetSize(self.image:GetSize() * 1.2)
	--self.image:SetAlpha(0.5)
	self.spotsVisiveis = {}
	self.spots = {}

	
	self:AddSpot(PlayerSpot())
	self:AddSpot(WaypointSpot())

	self.timer = Timer()
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("PostRender", self, self.Render)
	

end


function Minimapa:PostTick(spot) 

	if (self.timer:GetSeconds() > 8) then

		self.spotsVisiveis = {}
		
		for i, spot in pairs(self.spots) do
			if (spot) then
				local pos = spot:GetPosicao()
				if (spot:GetTipo() == -2 or spot:GetTipo() == -5 or Vector3.Distance(LocalPlayer:GetPosition(), pos) < 1000) then
				
					table.insert(self.spotsVisiveis, spot)
				end
			else
				self.spots[i] = nil
			end
				
		end
		self.timer:Restart()
	end
end


function Minimapa:GetActive()
	
	return self.active
end


function Minimapa:SetActive(b) 

	self.active = b

end


function Minimapa:AddSpot(spot) 

	table.insert(self.spots, spot)
	return #self.spots
end


function Minimapa:DeleteSpot(id) 

	self.spots[id] = nil

end


function Minimapa:Render()

	Game:FireEvent("gui.minimap.hide")
	Game:FireEvent("gui.pda.disable")
	
	if (self.active and Game:GetState() == GUIState.Game) then
	
		self.posicaoMinimapa = Vector2(Render.Width * 0.0125, Render.Height * 0.015)--Vector2(Render.Width / 100, Render.Height / 100)
		self.tamanhoMinimapa = self.posicaoMinimapa +  Vector2(Render.Height * 0.10465, Render.Height * 0.10465) * 2--Vector2(Render.Height / 4, Render.Height / 4.25)
		
		local posicaoP = self:Vector3ToMapa(LocalPlayer:GetPosition())
		
		Render:FillArea(self.posicaoMinimapa + Vector2(0, self.tamanhoMinimapa.y + 5), Vector2(self.tamanhoMinimapa.x, 12), Color(0, 0, 0, 100))
		local tamBarraHealth = Vector2(math.max(0, self.tamanhoMinimapa.x * LocalPlayer:GetHealth() - 10), 6)

		Render:FillArea(self.posicaoMinimapa + Vector2(5, self.tamanhoMinimapa.y + 8), tamBarraHealth, Color(120, 215, 121))
		
		Render:SetClip(true, self.posicaoMinimapa, self.tamanhoMinimapa)
			
		transformMapa = Transform2()
		transformMapa:Translate(self.posicaoMinimapa + self.tamanhoMinimapa / 2)
		transformMapa:Rotate(Camera:GetAngle().yaw)

		Render:SetTransform(transformMapa)
		
		--self.image:SetPosition(- self.image:GetSize() / 2 + self.posicaoImagem)
		local posicaoMinimapa = - posicaoP
		self.image:SetPosition(posicaoMinimapa)
		self.image:Draw()
		
		Render:ResetTransform()
		Render:SetClip(false)
		
		for i = #self.spotsVisiveis, 1, -1 do
			
			spot = self.spotsVisiveis[i]
			if (spot) then 
				local pos = spot:GetPosicao()

				local posMinimapa = self:Vector3ToMinimapa(pos)

				spot:Render(posMinimapa, 1, Camera:GetAngle().yaw)
			
			end
		end		
		
		for player in Client:GetStreamedPlayers() do

			local posMinimapa = self:Vector3ToMinimapa(player:GetPosition())
			
			self:DrawPlayer(player, posMinimapa)--, 1, Camera:GetAngle().yaw)

		end
		
	end
	
	Render:ResetTransform()
	Render:SetClip(false)
end


function Minimapa:DrawPlayer(player, posMinimapa)

    local color = player:GetColor()
    Render:FillCircle(posMinimapa, 4, color)

end


function Minimapa:DrawTextFundo(pos, txt, color, size, espacamentoL, espacamentoS)
	
	Render:FillArea(pos - Vector2(espacamentoL, espacamentoS), Render:GetTextSize(txt, size) + Vector2(2 * espacamentoL, 1.25 * espacamentoS), Color(0, 0, 0, 150))
	color.a = 240
	self:DrawTextGrande(pos, txt, color, size)

end


function Minimapa:DrawTextGrande(pos, txt, color, size)

	Render:DrawText(pos - Vector2(1,0), txt, color, size)
	Render:DrawText(pos, txt, color, size)
	
end


function Minimapa:DrawTextSombreado(pos, txt, color, size)

	self:DrawTextGrande(pos - Vector2(1,0), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos - Vector2(0,1), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos - Vector2(1,1), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos + Vector2(1,1), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos + Vector2(0,1), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos + Vector2(1,0), txt, Color(0,0,0, 100), size)
	self:DrawTextGrande(pos, txt, color, size)
	
end


function Minimapa:ScreenToMap(posScreen)

	local tamMapa = 16384
	local prop = tamMapa / self.image:GetSize().x
	
	local posMapa = posScreen - self.image:GetPosition()
	
	local posicaofinal = (tamMapa * 2 * posMapa) / self.image:GetSize().x --*-1
	posicaofinal = posicaofinal - Vector2(tamMapa, tamMapa)

	return posicaofinal

end


function Minimapa:Vector3ToMinimapa(posicao)

	posicao = Vector2(math.ceil(posicao.x) + self.tamanhoMapa / 2, math.ceil(posicao.z) + self.tamanhoMapa / 2)

	local prop = self.tamanhoMapa / math.ceil(self.image:GetSize().x)

	local posicaoFinal = posicao / prop + self.image:GetPosition()

	local angulo = Angle(Camera:GetAngle().yaw, 0, 0)

	local vec3 = Vector3(posicaoFinal.x, 0, posicaoFinal.y)

	posicaoFinal = -angulo * vec3
	posicaoFinal = Vector2(posicaoFinal.x, posicaoFinal.z) + self.tamanhoMinimapa / 2 + self.posicaoMinimapa
	
	posicaoFinal = Vector2(math.min(self.tamanhoMinimapa.x + 14, posicaoFinal.x), math.min(self.tamanhoMinimapa.y + 6, posicaoFinal.y))
	posicaoFinal = Vector2(math.max(self.posicaoMinimapa.x, posicaoFinal.x), math.max(self.posicaoMinimapa.y, posicaoFinal.y))
			
	return posicaoFinal

end


function Minimapa:Vector3ToMapa(posicao)

	posicao = Vector2(math.ceil(posicao.x) + self.tamanhoMapa / 2, math.ceil(posicao.z) + self.tamanhoMapa / 2)

	local prop = self.tamanhoMapa / math.ceil(self.image:GetSize().x)

	local posicaoFinal = posicao / prop
	
	return posicaoFinal

end