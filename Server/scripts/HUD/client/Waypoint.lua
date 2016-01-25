class 'WaypointScreen'

function WaypointScreen:__init(args)

	self.name = string.upper(args.name)
	self.position = args.position
	self.color = args.color
end


function WaypointScreen:Render(margin)

	margin = margin + Vector2(20, 20)
	DrawImage(WorldToScreen(self.position, margin), margin, self.color, nil, self.name)
end


class 'WaypointScreenMap'

function WaypointScreenMap:__init()

	self.name = "WaypointScreen"
end


function WaypointScreenMap:Render(margin)
	local pos, bool = Waypoint:GetPosition()
	if not bool then return end
	
	margin = margin + Vector2(20, 20)

	local distance = tostring(math.ceil(Vector3.Distance(pos, LocalPlayer:GetPosition()))) .. " m"
	DrawImage(WorldToScreen(pos, margin), margin,  Color(255, 255, 0), distance, "WAYPOINT")
end


function DrawImage(position, margin, color, distance, name)
	Render:SetFont(AssetLocation.Disk, "Archivo.ttf")
	local t2 = Transform2()
	t2:Translate(position)
	local rotated = false
	
	if (position.x >= Render.Width - margin.x) then
		t2:Rotate(1.5)
		rotated = 1
	elseif (position.x <= margin.x) then
		t2:Rotate(4.8)
		rotated = 3
	elseif (position.y >= Render.Height - margin.y) then
		t2:Rotate(3.1)
		rotated = 2
	elseif (position.y <= margin.y) then
		t2:Rotate(0)
		rotated = 0
	end
	
	if name and not rotated then
		local namePosition = position - Vector2(15 + Render:GetTextWidth(name, 13), 6)
		Render:DrawText(namePosition + Vector2(1, 1), name, Color(0, 0, 0, 100), 13)
		Render:DrawText(namePosition, name, Color.White, 13)
	end
	
	if distance then
		local distancePosition = position + Vector2(15, -5)
		if rotated == 1 then
			distancePosition = position + Vector2(-15 - Render:GetTextWidth(distance, 12), -5)
		end
		Render:DrawText(distancePosition + Vector2(1, 1), distance, Color(0, 0, 0, 100), 12)
		Render:DrawText(distancePosition, distance, Color.White, 12)
	end
	
	Render:SetTransform(t2)
	
	if rotated then
		Render:FillTriangle(Vector2(-6, -14), Vector2(0, -21), Vector2(6, -14), Color(0, 0, 0, 50))
		Render:FillTriangle(Vector2(-5, -15), Vector2(0, -20), Vector2(5, -15), Color.White)
	end
	
	Render:DrawCircle(Vector2(0, 0), 11, Color(0, 0, 0, 50))
	Render:DrawCircle(Vector2(0, 0), 10, color)
	Render:DrawCircle(Vector2(0, 0), 9, color)
	Render:FillCircle(Vector2(0, 0), 7, Color(0, 0, 0, 50))
	Render:FillCircle(Vector2(0, 0), 6, color)
	
	Render:ResetTransform()
end


function WorldToScreen(v3position, margin)

	local screenPosition, boo = Render:WorldToScreen(v3position)
	if not boo then
	
		local posOposta = (LocalPlayer:GetPosition() - v3position) * 2 + LocalPlayer:GetPosition()
		screenPosition = Render:WorldToScreen(posOposta)
		screenPosition.x = Render.Width - screenPosition.x
		screenPosition.y = margin.y
	end
	
	screenPosition = Vector2(math.min(math.max(screenPosition.x, margin.x), Render.Width - margin.x), math.min(math.max(screenPosition.y, margin.y), Render.Height - margin.y))
	
	return screenPosition
	
end