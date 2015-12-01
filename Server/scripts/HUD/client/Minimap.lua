class 'Minimapa'

function Minimapa:__init()
	
	self.mapaImagem = Image.Create(AssetLocation.Disk, "Map.jpg")
	self.mapaImagem:SetSize(self.mapaImagem:GetSize() * 1.5)
	self.tamanhoMapa = 32768
end


function Minimapa:Render(posicao, tamanho)

	Render:FillArea(posicao, tamanho, Color(5, 37, 48))	
	
	local posicaoImagem = self:Vector3ToMinimapa(LocalPlayer:GetPosition(), posicao, self.mapaImagem:GetSize().x)
	self.mapaImagem:SetPosition(posicao - posicaoImagem - posicao)
	
	local transformMapa = Transform2()
	transformMapa:Translate(posicao + tamanho / 2)
	transformMapa:Rotate(Camera:GetAngle().yaw)
	Render:SetTransform(transformMapa)
	
	Render:SetClip(true, posicao, tamanho)
	self.mapaImagem:Draw()
	
	Render:ResetTransform()
	Render:FillCircle(posicao + tamanho / 2, 3, Color(255, 0, 0))
end


function Minimapa:Vector3ToMinimapa(vec3, posicaoMinimapa, tamanhoMapa)
	
	local posBruta = Vector2(vec3.x, vec3.z) + Vector2(self.tamanhoMapa, self.tamanhoMapa) / 2
	
	local posMapa = posBruta * self.mapaImagem:GetSize().x / self.tamanhoMapa
	
	return posMapa
	
	
	
	
	-- local posicao = Vector2(math.ceil(vec3.x) + self.tamanhoMapa / 2, math.ceil(vec3.z) + self.tamanhoMapa / 2)

	-- local prop = self.tamanhoMapa / math.ceil(self.mapaImagem:GetSize().x)

	-- return posicao / prop
end