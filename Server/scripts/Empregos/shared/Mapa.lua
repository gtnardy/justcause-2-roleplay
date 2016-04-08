class 'Mapa'

function Mapa:__init(args)
	

	self.mapaImagem = Image.Create(AssetLocation.Disk, "map.jpg")
	self.mapaImagem:SetSize(self.mapaImagem:GetSize() * 0.42)
	if args then
		if args.posicao then
			self:SetPosition(args.posicao)
		else
			self:SetPosition(Vector2(0, 0))
		end
	end
	
end

-- render
function Mapa:Draw()

	self.mapaImagem:Draw()

end


function Mapa:SetPosition(pos)

	self.mapaImagem:SetPosition(pos)

end


function Mapa:GetPosition()

	return self.mapaImagem:GetPosition()

end


function Mapa:SetSize(v)

	self.mapaImagem:SetSize(Vector2(v.y, v.y))

end

function Mapa:GetSize()

	return self.mapaImagem:GetSize()

end


function Mapa:Vector3ParaMapa(vector3)

	local centroImagem = self:GetPosition() + self:GetSize() / 2

	local prop = 16384 / self:GetSize().x
	
	local posx = vector3.x
	local posz = vector3.z
	
	if posx > 0 then
		posx = posx / prop / 2 + centroImagem.x
	else
		posx = centroImagem.x - (self:GetSize().x / 2 - (self:GetSize().x / 2 - (math.abs(posx) / prop / 2)))
	end			
				
	if posz > 0 then
		posz = posz / prop / 2 + centroImagem.y
	else
		posz = centroImagem.y - centroImagem.y + centroImagem.y - (math.abs(posz) / prop / 2)
	end
	
	return Vector2(posx, posz)
	
	
end
