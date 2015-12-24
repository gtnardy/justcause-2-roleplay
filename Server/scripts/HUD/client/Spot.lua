class 'Spot'

function Spot:__init(args)

	self.name = args.name
	self.image = args.image
	self.position = args.position
	self.fixed = args.fixed
end


function Spot:Render(positionMinimap, alpha)
	
	if self.image then
		self.image:SetPosition(positionMinimap - self.image:GetSize() / 2)
		if alpha then
			self.image:SetAlpha(alpha)
		end
		self.image:Draw()
	end
end


function Spot:RenderMinimap(positionMinimap, alpha)
	
	self:Render(positionMinimap, alpha)
end


function Spot:GetPosition()

	return self.position
end



class 'SpotPlayer'

function SpotPlayer:__init()

	self.name = "VOCÊ"
	self.image = Image.Create(AssetLocation.Resource, "Player_Spot")
	self.fixed = false
end


function SpotPlayer:Render(position)
	
	local t2 = Transform2()
	t2:Translate(Render.Size / 2 + position - self.image:GetSize() / 2)
	t2:Rotate(-LocalPlayer:GetAngle().yaw + Camera:GetAngle().yaw)
	Render:SetTransform(t2)
		
	self.image:SetPosition(-self.image:GetSize() / 2)
	self.image:Draw()
	Render:ResetTransform()
end


function SpotPlayer:RenderMinimap(positionMinimap)
	
	local t2 = Transform2()
	t2:Translate(positionMinimap)		
	t2:Rotate(-LocalPlayer:GetAngle().yaw + Camera:GetAngle().yaw)
	Render:SetTransform(t2)
	
	self.image:SetPosition(- self.image:GetSize() / 2)
	self.image:Draw()
	
	Render:ResetTransform()
end


function SpotPlayer:GetPosition()

	return LocalPlayer:GetPosition()
end


class 'SpotWaypoint'

function SpotWaypoint:__init()

	self.name = "WAYPOINT"
	self.image = Image.Create(AssetLocation.Resource, "Waypoint_Spot")
	self.fixed = true
end


function SpotWaypoint:Render(positionMinimap, alpha)
	
	local pos, bool = Waypoint:GetPosition()
	if not bool then return end
	self.image:SetPosition(positionMinimap - self.image:GetSize() / 2)
	self.image:SetAlpha(0.9)
	self.image:Draw()
end


function SpotWaypoint:RenderMinimap(positionMinimap, alpha)

	self:Render(positionMinimap, alpha)
end


function SpotWaypoint:GetPosition()

	return Waypoint:GetPosition()
end