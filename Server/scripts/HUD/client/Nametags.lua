class 'Nametags'

function Nametags:__init()

	self.textSize = 16
end


function Nametags:Render()
	for player in Client:GetStreamedPlayers() do
		if IsValid(player) then
			self:RenderNametag(player)
		end
	end
end


function Nametags:RenderNametag(player)

	local playerPosition = player:GetBonePosition("ragdoll_Head") + Vector3(0, 0.5, 0)
	local screenPosition, onScreen = Render:WorldToScreen(playerPosition) 
	if not onScreen then return end
	
	local playerName = player:GetCustomName()
	local playerColor = player:GetColor()
	playerColor.a = 200
	local distance = Vector3.Distance(LocalPlayer:GetPosition(), playerPosition)
	local scale = 1.0 - ( distance ) /  700 
	screenPosition.x = screenPosition.x - Render:GetTextWidth(playerName, self.textSize, scale) / 2

	
	Render:DrawText(screenPosition + Vector2.One, playerName, Color(0, 0, 0, 200), self.textSize, scale)
	Render:DrawText(screenPosition, playerName, playerColor, self.textSize, scale)
end