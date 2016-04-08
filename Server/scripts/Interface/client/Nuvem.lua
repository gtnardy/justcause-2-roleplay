class 'Nuvem'

function Nuvem:__init(args)
	
	if (args.altura)  then
	
		self.altura = args.altura
	else
		self.altura = 10
	end	

	self.imagem = Image.Create(AssetLocation.Game, "pda_clouds_dif.dds")
	self.imagem:SetSize(self.imagem:GetSize() * self.altura)
	self.imagem:SetAlpha(0.3)
	self.size = self.imagem:GetSize()

	
	if (args.posicao)  then
		self.posicao = args.posicao
		
	else
		self.posicao = Vector3(0, 0, 0)
	end	
	self.posicaoInicial = self.posicao
	
end

function Nuvem:GetPosicao()
	
	return self.posicao
	
end

function Nuvem:Render(pos, zoom)

	self.imagem:SetAlpha((1 - self.altura / 15 * math.pow(zoom, 1.5)) / 4)
	self.imagem:SetSize(self.size * zoom)
	self.imagem:SetPosition(pos - self.imagem:GetSize() / 2)
	self.imagem:Draw()
	self.posicao = self.posicao + (Vector3(-0.25, 0, 0.25) * self.altura)
	
	if (pos.y > Render.Height + self.imagem:GetSize().y / 2) then
		self.posicao = self.posicaoInicial
	end
end
