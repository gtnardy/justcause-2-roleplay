class 'Spot'

function Spot:__init(args)

	if (args.posicao)  then
		self.posicao = args.posicao
	else
		self.posicao = Vector3(0,0, 0)
	end	
	
	if (args.idVeiculo)  then
		self.idVeiculo = args.idVeiculo
		self.veiculo = Vehicle.GetById(self.idVeiculo)
	end
	
	if (args.id)  then
		self.id = args.id
	else
		self.id = 0
	end	
	
	if (args.nome)  then
		self.nome = args.nome
	else
		self.nome = ""
	end	
	
	if (args.descricao)  then
		self.descricao = args.descricao
	else
		self.descricao = ""
	end	
	
	if (args.tipo)  then
		self.tipo = args.tipo
	else
		self.tipo = 0
	end
	
	if (args.imagem)  then
		self.imagem = args.imagem
		self.size = self.imagem:GetSize()
	end
	

	
	self.selecionavel = true
end

function Spot:IsRotacionavel()

	return true
	
end

function Spot:IsSelecionavel()

	return self.selecionavel
	
end

function Spot:IsSelecionavel()

	return self.selecionavel
	
end

function Spot:GetTipo()

	return self.tipo
	
end

function Spot:GetDescricao()

	return self.descricao
	
end

function Spot:GetNome()

	return self.nome
	
end

function Spot:GetPosicao()
	
	if IsValid(self.veiculo) then
		self.posicao = self.veiculo:GetPosition()
	else

		if self.idVeiculo and IsValid(Vehicle.GetById(self.idVeiculo)) then
			self.veiculo = Vehicle.GetById(self.idVeiculo)
			return self:GetPosicao()
		end	

		self.veiculo = nil
	end
	
	return self.posicao
	
end


function Spot:Render(pos, zoom)
	
	if (self.imagem) then
		self.imagem:SetSize(self.size * zoom)
		self.imagem:SetPosition(pos - self.imagem:GetSize() / 2)
		self.imagem:Draw()
	end
end




class 'WaypointSpot'

function WaypointSpot:__init()
	
	self.nome = "WAYPOINT"
	self.imagem = Image.Create(AssetLocation.Game, "hud_icon_waypoint_dif.dds")	
	self.size = self.imagem:GetSize()
end

function WaypointSpot:IsRotacionavel()

	return true
	
end

function WaypointSpot:IsSelecionavel()

	return false
	
end

function WaypointSpot:GetDescricao()

	return nil
	
end

function WaypointSpot:GetNome()

	return self.nome
	
end

function WaypointSpot:GetTipo()

	return -2
	
end

function WaypointSpot:GetPosicao()

	self.posicao = Waypoint:GetPosition()
	return self.posicao
	
end

function WaypointSpot:Render(pos, zoom)

	if (Waypoint:GetPosition() and Waypoint:GetPosition() != Vector3(0, 200, 0) and Waypoint:GetPosition() != Vector3(0, 0, 0)) then
		self.imagem:SetSize(self.size * zoom)
		self.imagem:SetPosition(pos - self.imagem:GetSize() / 2)
		self.imagem:Draw()
	end
	
end


class 'PlayerSpot'

function PlayerSpot:__init()
	
	self.nome = "VOCE"
	self.imagem = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAABYAAAAfCAYAAADjuz3zAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAQPSURBVHja1FZNaBtHGH0zWslaLHmzluRQ1SFVZIKNQMaCCNNAkwoZH0ppLOuSg91D02st1yamh0pxA86lPxR66KE+FB9yipNAE2JikjakpjRQg4KRt20qimUlcVd1HCJp/SN9PXilSopi1wEfOvDtYea9N29nv++bZUSE/RjCbgDG2JGOjo7+gYGBjwFgamrqfCKRuEREf+xIJKIXBgCjyWQaCQaDKukjGAyqJpNpBIBxJy7fxfAht9s9FggETKWJQCBgcrvdYwAOvZRjAEaLxVLlttK1xWLZ0fVOwnIoFMoQEWmaVnS5XKrL5VI1TSsSEYVCoQwA+WWO4iOfzydqmoZIJKIkk8mvk8nkV5FIRNE0DT6fTwRwZk9HAaDf4/E8o2Ke8rlVAqBUrCn53CpRMU8ej+cZgP56GkJNahkYY+cPHnT0h8PhRkADsAH/Md9RxpgCAP5jvqPABgAgHA43qurKBOf8MBF9SUSFuo455+OCICix6ChR8RFRcZWomKZ8Lkn53GM9kkTFtL72iGLRURIEQeGcf/DcxwPAOOd9siwpsehwmUTFNFFhiaiwTFTMb0dheXuumC5vHosOkyxLCue8DwAjIv3BWENjY2N6dORM87nYh6WDAUCYmbkDNZNJbW5sYrtijLDbbK29vW+UMQBwbvxzfPrZN39ns1knEa0DABNFcSwWHSIqJCtiia5emSS/v3PFbG6YqQy/v3Pl6pVJ/W3+5cSiQySK4vv6jjA4nc747VsXq0A3rk+VRWszyWxumPT7O1duXJ+q4ty+dZGcTmccgJEDgM3W3HbyRHcVWc1kUvH44rymrffWfmRNW38vHl+cVzOZVCXn5Ilu2GzNbQA4B2A89c5bYq2r0pmWRGtzvxZTGrqWlQMwAS9uynvt1zqeOID16cvXsrUAo8m4q0g9zPTl73IAchxAYWlp6d7vD/6sArQ47K1eb3uXKJona8miaJ70etu7Whz21sr55fRjpFKpnwFsCES0JQjCnbt3773Z5j5cBvX0HMfm1pZj/JMv3hZFc1VmeL3tXbHosKOn53jVhvfvLyKbzf5ARIVSgYiSJD38ae6S1N7urgLfvPkjVv5SqwqkxWFvrRVdXHyA7tf719bW1l4lomy5pA0Gw2lJalISC7M1hbJ7JBZmSZKaFIPBcLpU0tWtThAGZVnak3hiYZZkWVIEQRiiQrL+DcIYM3POB2VZmvkv4rroDOf8XcaYederiXN+ymq1zl2YOEvzv1x7TvC3X7+nCxNnyWq1znHOeyqdlk3WKwDGGANgEkVx0G63hw4caHol1BcUt/N0Nv/kydOHqqpO5/P5bwFsUh0RtlNlMcbMAJr03ujRpxf07vWUCkkN/LX63P36xeLYp/H/E/5nAE9JspR7oSMlAAAAAElFTkSuQmCC")
	-- self.imagem:SetAlpha(0.7)
	self.size = self.imagem:GetSize()
end

function PlayerSpot:IsRotacionavel()

	return false
	
end

function PlayerSpot:GetTipo()

	return -1
	
end

function PlayerSpot:IsSelecionavel()

	return false
	
end

function PlayerSpot:GetDescricao()

	return nil
	
end

function PlayerSpot:GetNome()

	return self.nome
	
end

function PlayerSpot:GetPosicao()

	self.posicao = LocalPlayer:GetPosition()
	return self.posicao
	
end

function PlayerSpot:Render(pos, zoom, angle)
	if not angle then angle = 0 end
	self.imagem:SetSize(self.size * zoom)
	local pos = pos
	
	t2 = Transform2()
	t2:Translate(pos)		
	t2:Rotate(-LocalPlayer:GetAngle().yaw + angle)
	
	Render:SetTransform(t2)
	
	self.imagem:SetPosition( - Vector2(self.imagem:GetSize().x / 2, self.imagem:GetSize().y / 2))
	self.imagem:Draw()
	
	Render:ResetTransform()
	
end