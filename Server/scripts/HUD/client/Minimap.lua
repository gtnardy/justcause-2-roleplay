class 'Minimapa'

function Minimapa:__init()
	
	self.mapaImagem = Image.Create(AssetLocation.Resource, "JCMap")

	self.imageSize = Vector2(5000, 5000)
	self.tamanhoMapa = Vector2(32768, 32768)
	self.proporcao = self.tamanhoMapa.x / self.imageSize.x --self.mapaImagem:GetSize().x
	
	self.zoom = 1
	
	self.spotsNear = {}
end


function Minimapa:Render(posicao, tamanho)

	Render:FillArea(posicao, tamanho, Color(5, 37, 48, 120))
	self.mapaImagem:SetAlpha(0.4)
	self.mapaImagem:SetSize(self.imageSize * self.zoom)
	self.mapaImagem:SetPosition(self:GetMinimapPosition(posicao, tamanho))
	
	local transformMapa = Transform2()
	transformMapa:Translate(posicao + tamanho / 2)
	transformMapa:Rotate(Camera:GetAngle().yaw)
	Render:SetTransform(transformMapa)
	
	Render:SetClip(true, posicao, tamanho)
	self.mapaImagem:Draw()
	
	Render:ResetTransform()
	
	self:RenderStreamablePlayers(posicao, tamanho)
	
	self:RenderSpots(posicao, tamanho)
	Render:SetClip(false)
end


function Minimapa:RenderSpots(posicao, tamanho)

	for i = #self.spotsNear, 1, -1 do
			
		local spot = self.spotsNear[i]
		if (spot) then 			
			local pos = spot:GetPosition()
			if not pos then break end
			
			local posMinimapa = self:Vector3ToMinimap(pos, posicao, tamanho, spot.fixed)

			spot:RenderMinimap(posMinimapa, 1, self.mapaImagem:GetAlpha() * 1.5)
		end
	end
	
end


function Minimapa:RenderStreamablePlayers(posicao, tamanho)
	for player, _ in Client:GetStreamedPlayers() do
		local posMinimapa = self:Vector3ToMinimap(player:GetPosition(), posicao, tamanho)
		Render:FillCircle(posMinimapa, 3, player:GetColor())		
	end
end


function Minimapa:GetMinimapPosition(posicao, tamanho)
	local posPlayer = LocalPlayer:GetPosition()
	local posPlayerV2Bruta = Vector2(posPlayer.x, posPlayer.z) + self.tamanhoMapa / 2
	
	return -(self.mapaImagem:GetSize().x * posPlayerV2Bruta / self.tamanhoMapa.x)
end


function Minimapa:Vector3ToMinimap(posicao, posicaoMinimapa, tamanhoMinimapa, fixed)

	posicao = Vector2(math.ceil(posicao.x) + self.tamanhoMapa.x / 2, math.ceil(posicao.z) + self.tamanhoMapa.y / 2)

	local posicaoFinal = posicao / self.proporcao + self.mapaImagem:GetPosition()

	posicaoFinal = -Angle(Camera:GetAngle().yaw, 0, 0) * Vector3(posicaoFinal.x, 0, posicaoFinal.y)
	posicaoFinal = Vector2(posicaoFinal.x, posicaoFinal.z) + tamanhoMinimapa / 2 + posicaoMinimapa
	
	if fixed then
		posicaoFinal = Vector2(math.max(posicaoMinimapa.x, math.min(posicaoMinimapa.x + tamanhoMinimapa.x, posicaoFinal.x)), math.max(posicaoMinimapa.y, math.min(posicaoMinimapa.y + tamanhoMinimapa.y, posicaoFinal.y)))
	end
	return posicaoFinal
end