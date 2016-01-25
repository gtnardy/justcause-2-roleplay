class 'Checkpoint'

function Checkpoint:__init()


	self.currentSpots = {}
	self.spotsNear = {}
	
	self.actualSpot = nil
	
	self.timer = Timer()
	self.timerRender = Timer()
	
	Events:Subscribe("PostTick", self, self.PostTick)
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
	Events:Fire(eventName, {id = spot.id, position = spot.position, radius = spot.radius, spotType = spot.spotType, name = spot.name, description = spot.description})
	self.currentSpots[spot.id] = entered and spot or nil
	self.timerRender:Restart()
end
