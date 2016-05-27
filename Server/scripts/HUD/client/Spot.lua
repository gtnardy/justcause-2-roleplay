class 'Spot'

function Spot:__init(args)
	
	self.id = args.id
	self.name = args.name
	self.image = args.image
	self.position = args.position
	self.fixed = args.fixed
	self.description = args.description
	self.spotType = args.spotType
	self.radius = args.radius
	self.company = args.company
	
	if self.image then
		self.imageSize = self.image:GetSize()
	end
end


function Spot:Render(position, zoom, alpha)
	
	if self.image then
	
		self.image:SetSize(self.imageSize * math.sqrt(zoom, 2))
		self.image:SetPosition(position - self.image:GetSize() / 2)
		if alpha then
			self.image:SetAlpha(alpha)
		end
		self.image:Draw()
	end
end


function Spot:RenderMinimap(positionMinimap, zoom, alpha)
	
	self:Render(positionMinimap, zoom, alpha)
end


function Spot:GetPosition()

	return self.position
end



class 'SpotPlayer'

function SpotPlayer:__init()

	self.name = "VOCÊ"
	self.image = Image.Create(AssetLocation.Resource, "PLAYER_SPOT")
	self.fixed = false
	
	self.imageSize = self.image:GetSize()
end


function SpotPlayer:Render(position, zoom)
	local t2 = Transform2()
	t2:Translate(position)		
	t2:Rotate(-LocalPlayer:GetAngle().yaw)
	Render:SetTransform(t2)
	
	self.image:SetPosition( - Vector2(self.image:GetSize().x / 2, self.image:GetSize().y / 2))
	self.image:Draw()
	
	Render:ResetTransform()
end


function SpotPlayer:RenderMinimap(positionMinimap, zoom, alpha)
	
	local t2 = Transform2()
	t2:Translate(positionMinimap)		
	t2:Rotate(-LocalPlayer:GetAngle().yaw + Camera:GetAngle().yaw)
	Render:SetTransform(t2)
	
	self.image:SetPosition( - Vector2(self.image:GetSize().x / 2, self.image:GetSize().y / 2))
	self.image:Draw()
	
	Render:ResetTransform()
end


function SpotPlayer:GetPosition()

	return LocalPlayer:GetPosition()
end


class 'SpotWaypoint'

function SpotWaypoint:__init()

	self.name = "WAYPOINT"
	self.image = Image.Create(AssetLocation.Resource, "WAYPOINT_SPOT")
	self.fixed = true
	
	self.imageSize = self.image:GetSize()
end


function SpotWaypoint:Render(position, zoom, alpha)
	
	local pos, bool = Waypoint:GetPosition()
	if not bool then return end
	
	self.image:SetSize(self.imageSize * math.sqrt(zoom, 2))
	self.image:SetPosition(position - self.image:GetSize() / 2)
	self.image:SetAlpha(0.9)
	self.image:Draw()
end


function SpotWaypoint:RenderMinimap(positionMinimap, zoom, alpha)
	
	self:Render(positionMinimap, zoom, alpha)
end


function SpotWaypoint:GetPosition()

	return Waypoint:GetPosition()
end