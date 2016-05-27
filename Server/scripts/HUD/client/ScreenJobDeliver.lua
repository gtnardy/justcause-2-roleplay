class 'ScreenJobDeliver'

function ScreenJobDeliver:__init()
	
	self:SetLanguages()
	
	self.deliveries = {}
	
	Events:Subscribe("UpdateDeliveries", self, self.UpdateDeliveries)
end


function ScreenJobDeliver:UpdateDeliveries(deliveries)
	self.deliveries = deliveries
end


function ScreenJobDeliver:GetSpots(spots)
	local returnSpots = {}
	for _, spot in pairs(spots) do
		if (not spot.id) or spot.company then
			table.insert(returnSpots, spot)
		end
	end
	return returnSpots
end


function ScreenJobDeliver:Render()
	for _, delivery in pairs(self.deliveries) do
		Render:DrawText(Render.Size / 2 , "delivery1", Color.White)
	end
end


function ScreenJobDeliver:SetLanguages()
	self.Languages = Languages()
end