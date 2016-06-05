class 'ScreenJobDeliver'

function ScreenJobDeliver:__init()

	self:SetLanguages()
	
	self.ScreenJob = nil
	
	self.deliveries = {}
	self.deliverySelected = 1
	self.activeDelivery = nil
	self.mouseAt = nil
	
	self.IMAGE_TUTORIAL_LEFT = Image.Create(AssetLocation.Resource, "TUTORIAL_LEFT")
	self.IMAGE_TUTORIAL_RIGHT = Image.Create(AssetLocation.Resource, "TUTORIAL_RIGHT")
	self.IMAGE_TUTORIAL_UP = Image.Create(AssetLocation.Resource, "TUTORIAL_UP")
	self.IMAGE_TUTORIAL_DOWN = Image.Create(AssetLocation.Resource, "TUTORIAL_DOWN")
	
	Events:Subscribe("UpdateDeliveries", self, self.UpdateDeliveries)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("MouseUp", self, self.MouseUp)
	
	Events:Fire("RequestDeliveries")
end


function ScreenJobDeliver:UpdateDeliveries(deliveries)
	self.deliveries = deliveries
	self.deliverySelected = 1
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


function ScreenJobDeliver:KeyUp(args)
	if not self.ScreenJob.Map.active then return end
	
	if args.key == VirtualKey.Left then
		if self.deliverySelected > 1 then
			self.deliverySelected = self.deliverySelected - 1
		end
	elseif args.key == VirtualKey.Right then
		if self.deliverySelected < #self.deliveries then
			self.deliverySelected = self.deliverySelected + 1
		end
	elseif args.key == VirtualKey.Return then
		if self.activeDelivery == self.deliverySelected then
			self.activeDelivery = nil
			Events:Fire("RemoveObjective")
		else
			self.activeDelivery = self.deliverySelected
			self:SelectDeliver(self.deliverySelected)
		end
	end
end


function ScreenJobDeliver:MouseUp(args)
	if (not self.ScreenJob.Map.active) or (not self.mouseAt) then return end
	self.deliverySelected = self.mouseAt
end



function ScreenJobDeliver:SelectDeliver(index)
	local delivery = self.deliveries[self.deliverySelected]
	if not delivery.enabled then return end
	
	Events:Fire("SetObjective", {
		texts = {
			{text = self.Languages.TEXT_GOTO .. " ", color = Color.White},
			{text = self.Languages.TEXT_SHIPMENT, color = GREEN},
			{text = ".", color = Color.White},
		},
		removeOnEnter = true,
		color = GREEN,
		name = tostring(delivery.from.name),
		position = delivery.from.position,
	})
	--Events:Fire("ToogleMenu")
end


function ScreenJobDeliver:Render()

	local positionDeliveries = Vector2(80, Render.Height - 220)
	
	-- Deliveries
	-- Background
	Render:FillArea(positionDeliveries, Vector2(Render.Width - 160, 130), Color(0, 0, 0, 75))
	-- Title
	Render:DrawShadowedText(positionDeliveries + Vector2(15, 10), string.upper(self.Languages.LABEL_DELIVERIES), Color.White, 26)
	
	positionDeliveries = positionDeliveries + Vector2(15, 40)

	local boxSize = Vector2(120, 75)
	local textSize = 14
	local mouseAt = nil
	for _, delivery in pairs(self.deliveries) do

		Render:FillArea(positionDeliveries, boxSize, Color(0, 0, 0, 75))
		local alpha = delivery.enabled and 255 or 150
		
		if self.deliverySelected == _ or self.mouseAt == _ or self.activeDelivery == _ then
			-- Box
			local border = self.mouseAt == _ and Color.White or self.activeDelivery == _ and GREEN or YELLOW
			Render:FillArea(positionDeliveries, Vector2(boxSize.x, 1), border)
			Render:FillArea(positionDeliveries, Vector2(1, boxSize.y), border)
			Render:FillArea(positionDeliveries + Vector2(0, boxSize.y), Vector2(boxSize.x, 1), border)
			Render:FillArea(positionDeliveries + Vector2(boxSize.x, 0), Vector2(1, boxSize.y), border)
		end
		
		-- Box
		-- Payment
		local payment = "R$" .. tostring(delivery.payment)
		Render:DrawShadowedText(positionDeliveries + Vector2(boxSize.x / 2 - Render:GetTextWidth(payment, textSize) / 2, 5), payment, GREEN, textSize)
		
		-- Distance
		local labelDistance = self.Languages.LABEL_DISTANCE .. ": "
		local distance = ">" .. tostring(delivery.distance) .. "m"
		Render:DrawShadowedText(positionDeliveries + Vector2(boxSize.x / 2 - Render:GetTextWidth(labelDistance .. distance, textSize) / 2, 25), labelDistance, Color.White, textSize)
		Render:DrawShadowedText(positionDeliveries + Vector2(boxSize.x / 2 - Render:GetTextWidth(labelDistance .. distance, textSize) / 2 + Render:GetTextWidth(labelDistance, textSize), 25), distance, YELLOW, textSize)
		
		if delivery.enabled then
			-- Remaining
			local remaining = tostring(delivery.deliveries)
			Render:DrawShadowedText(positionDeliveries + Vector2(boxSize.x / 2 - Render:GetTextWidth(remaining, 22) / 2, 45), remaining, YELLOW, 22)
		else
			Render:DrawShadowedText(positionDeliveries + Vector2(boxSize.x / 2 - Render:GetTextWidth(string.upper(self.Languages.LABEL_LOCKED), 18) / 2, 45), string.upper(self.Languages.LABEL_LOCKED), RED, 18)
		end
		
		-- GetMouseAt
		if Vector2.Distance(Mouse:GetPosition(), positionDeliveries + boxSize / 2) <= 60 then
			mouseAt = _
		end			
		
		positionDeliveries.x = positionDeliveries.x + 130
	end
	self.mouseAt = mouseAt
	
	self:DrawInformation(self.mouseAt and self.mouseAt or self.deliverySelected)
end


function ScreenJobDeliver:DrawInformation(index)
	
	local delivery = self.deliveries[index]
	if not delivery then return end
	
	-- Map
	local toPosition = self.ScreenJob.Map:Vector3ToMapa(delivery.to.position)
	local fromPosition = self.ScreenJob.Map:Vector3ToMapa(delivery.from.position)
	Render:DrawCircle(fromPosition, 13, Color.Black)
	Render:DrawCircle(fromPosition, 16, Color.Black)
	Render:DrawCircle(fromPosition, 15, GREEN)
	Render:DrawCircle(fromPosition, 14, GREEN)
	
	Render:DrawCircle(toPosition, 16, Color.Black)
	Render:DrawCircle(toPosition, 13, Color.Black)
	Render:DrawCircle(toPosition, 15, BLUE)
	Render:DrawCircle(toPosition, 14, BLUE)		

	-- Information
	local positionInformation = Vector2(Render.Width - 380, 150)
	
	-- Background
	Render:FillArea(positionInformation, Vector2(300, Render.Height - 380), Color(0, 0, 0, 75))
	
	-- Title
	positionInformation = positionInformation + Vector2(20, 25)
	Render:DrawShadowedText(positionInformation, string.upper(self.Languages.LABEL_DELIVERY_INFORMATIONS), Color.White, 32)
	positionInformation.y = positionInformation.y + 30

	-- Enabled
	local unlocked = self.Languages.LABEL_LOCKED
	local unlockedColor = RED
	if delivery.enabled then
		unlocked = self.Languages.LABEL_UNLOCKED
		unlockedColor = GREEN
	end
	Render:DrawShadowedText(positionInformation, unlocked, unlockedColor, 16)
	positionInformation.y = positionInformation.y + 35	
	
	-- From
	Render:DrawShadowedText(positionInformation, self.Languages.LABEL_FROM .. ": ", Color.White, 16)
	Render:DrawShadowedText(positionInformation + Vector2(Render:GetTextWidth(self.Languages.LABEL_FROM .. ": ", 16), 0), tostring(delivery.from.name), GREEN, 16)
	positionInformation.y = positionInformation.y + 15
	
	-- To
	Render:DrawShadowedText(positionInformation, self.Languages.LABEL_TO .. ": ", Color.White, 16)
	Render:DrawShadowedText(positionInformation + Vector2(Render:GetTextWidth(self.Languages.LABEL_TO .. ": ", 16), 0), tostring(delivery.to.name), BLUE, 16)
	positionInformation.y = positionInformation.y + 30
	
	-- Distance
	Render:DrawShadowedText(positionInformation, self.Languages.LABEL_STRAIGHT_DISTANCE .. ": ", Color.White, 16)
	Render:DrawShadowedText(positionInformation + Vector2(Render:GetTextWidth(self.Languages.LABEL_STRAIGHT_DISTANCE .. ": ", 16), 0), tostring(delivery.distance) .. "m", YELLOW, 16)
	positionInformation.y = positionInformation.y + 15
	
	-- Payment
	Render:DrawShadowedText(positionInformation, self.Languages.LABEL_PAYMENT .. ": ", Color.White, 16)
	Render:DrawShadowedText(positionInformation + Vector2(Render:GetTextWidth(self.Languages.LABEL_PAYMENT .. ": ", 16), 0), "R$" .. tostring(delivery.payment), YELLOW, 16)
	positionInformation.y = positionInformation.y + 15
	
	-- Deliveries Remaining
	Render:DrawShadowedText(positionInformation, self.Languages.LABEL_DELIVERIES_REMAINING .. ": ", Color.White, 16)
	Render:DrawShadowedText(positionInformation + Vector2(Render:GetTextWidth(self.Languages.LABEL_DELIVERIES_REMAINING .. ": ", 16), 0), tostring(delivery.deliveries), YELLOW, 16)
	positionInformation.y = positionInformation.y + 15
	
	-- Requirements
	if (not delivery.enabled) then
		positionInformation.y = Render.Height - 270 
		Render:FillArea(positionInformation, Vector2(260, 2), Color(255, 255, 255, 150))
		positionInformation.y = positionInformation.y + 10
		Render:DrawShadowedText(positionInformation, self.Languages.LABEL_UNLOCK_NECESSARY, RED, 16)
	end	
end


function ScreenJobDeliver:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("LABEL_TO", {["en"] = "To", ["pt"] = "Para"})
	self.Languages:SetLanguage("LABEL_FROM", {["en"] = "From", ["pt"] = "De"})
	self.Languages:SetLanguage("LABEL_PAYMENT", {["en"] = "Payment", ["pt"] = "Pagamento"})
	self.Languages:SetLanguage("LABEL_DISTANCE", {["en"] = "Distance", ["pt"] = "Distância"})
	self.Languages:SetLanguage("LABEL_STRAIGHT_DISTANCE", {["en"] = "Distance (straight line)", ["pt"] = "Distância (linha reta)"})
	self.Languages:SetLanguage("TEXT_GOTO", {["en"] = "Go to the", ["pt"] = "Vá para o"})
	self.Languages:SetLanguage("TEXT_SHIPMENT", {["en"] = "shipment", ["pt"] = "carregamento"})
	self.Languages:SetLanguage("LABEL_DELIVERY_INFORMATIONS", {["en"] = "Informations", ["pt"] = "Informações"})
	self.Languages:SetLanguage("LABEL_DELIVERIES", {["en"] = "Deliveries", ["pt"] = "Entregas"})
	self.Languages:SetLanguage("LABEL_DELIVERIES_REMAINING", {["en"] = "Deliveries remaining", ["pt"] = "Entregas restantes"})
	self.Languages:SetLanguage("LABEL_LOCKED", {["en"] = "Locked", ["pt"] = "Bloqueado"})
	self.Languages:SetLanguage("LABEL_UNLOCKED", {["en"] = "Unlocked", ["pt"] = "Desbloqueado"})
	self.Languages:SetLanguage("LABEL_UNLOCK_NECESSARY", {["en"] = "You did not unlocked this delivery yet.", ["pt"] = "Você não liberou essa entrega."})
end