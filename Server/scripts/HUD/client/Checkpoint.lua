class 'Checkpoint'

function Checkpoint:__init()
	self.currentSpots = {}
	self.spotsNear = {}
	
	self.actualSpot = nil
	
	self.timer = Timer()
	self.timerRender = Timer()
	
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("GameRender", self, self.GameRender)
end


function Checkpoint:GameRender()
	local playerPosition = LocalPlayer:GetPosition()
	for _, spot in pairs(self.spotsNear) do
		local spotPosition = spot:GetPosition()
		if spot.radius and spot.radius < 50 and Vector3.Distance(playerPosition, spotPosition) < 100 then
			spotPosition.y = Physics:GetTerrainHeight(spotPosition) + 0.3
			self:RenderCircle(spotPosition, spot.radius, Color.Red)
			self:RenderWord(spotPosition, tostring(spot.name):sub(1, 1), Color.Red)
		end
	end
end


function Checkpoint:RenderWord(position, word, color)
	local t3 = Transform3()
	local textSize = Render:GetTextSize(word, TextSize.Default)
	t3:Translate(position)
	t3:Scale(0.1)
	t3:Translate(Vector3(-textSize.x / 2, 30, -textSize.y / 2))
	t3:Rotate(Angle(Camera:GetAngle().yaw, math.pi, 0))
	Render:SetTransform(t3)
	Render:DrawText(Vector3.Zero, word, Color.Red, TextSize.Default)
	Render:ResetTransform()
end


function Checkpoint:RenderCircle(position, radius, color)
	local t3 = Transform3()
	t3:Translate(position)
	t3:Rotate(Angle(0, -math.pi/2, 0))
	Render:SetTransform(t3)
	Render:DrawCircle(Vector3.Zero, radius, Color.Red)
	Render:ResetTransform()
end


function Checkpoint:PostTick()
	if self.timer:GetSeconds() > 1 then
		for id, spot in pairs(self.currentSpots) do
			if Vector3.Distance(spot.position, LocalPlayer:GetPosition()) > spot.radius then
				self:LocalPlayerTriggerSpot(spot, false)
			end			
		end
		
		for _, spot in pairs(self.spotsNear) do
			if (not self.currentSpots[spot.id] and spot.radius and Vector3.Distance(spot:GetPosition(), LocalPlayer:GetPosition()) < spot.radius) then
				self:LocalPlayerTriggerSpot(spot, true)
			end
		end
		self.timer:Restart()
	end
end


function Checkpoint:Render(posicao)

	for id, spot in pairs(self.currentSpots) do
		local seconds = self.timerRender:GetSeconds()
		if seconds > 10 then return end
		local alpha = seconds >= 9 and (10 - seconds) * 255 or 255
		Render:DrawText(posicao, string.upper(spot.name), Color(255, 255, 255, alpha), 16)
		break
	end
end


function Checkpoint:LocalPlayerTriggerSpot(spot, entered)
	if not spot then return end
	local eventName = entered and 'LocalPlayerEnterSpot' or 'LocalPlayerExitSpot'
	Events:Fire(eventName, {id = spot.id, position = spot.position, radius = spot.radius, spotType = spot.spotType, name = spot.name, description = spot.description, company = spot.company})
	self.currentSpots[spot.id] = entered and spot or nil
	self.timerRender:Restart()
end
