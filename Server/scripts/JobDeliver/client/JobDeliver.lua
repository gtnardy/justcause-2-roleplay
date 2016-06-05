class 'JobDeliver'

function JobDeliver:__init()
	
	self:SetLanguages()
	self.delivering = false
	self.deliveries = {}
	self.deliveriesReceived = {}
	
	self.JobDeliverList = JobDeliverList()
	
	Network:Subscribe("StartService", self, self.StartService)
	Network:Subscribe("UpdateData", self, self.UpdateData)
	Events:Subscribe("RequestDeliveries", self, self.RequestDeliveries)
	Events:Subscribe("RequestDelivery", self, self.RequestDelivery)
	Events:Subscribe("StartingDelivery", self, self.Start)
	Events:Subscribe("DoingDelivery", self, self.Done)
	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("NetworkObjectValueChange", self, self.NetworkObjectValueChange)
end


function JobDeliver:NetworkObjectValueChange(args)
	if (args.object.__type == "Player" or args.object.__type == "LocalPlayer") and args.key == "JobUnlocks" then
		self:UpdateData({deliveries = self.deliveriesReceived})
	end
end


function JobDeliver:UpdateData(args)
	self.deliveriesReceived = args.deliveries
	local deliveries = {}
	local unlocks = LocalPlayer:GetJobUnlocks()
	
	for _, delivery in pairs(args.deliveries) do
		local unlockType = self.JobDeliverList:GetUnlocksType(delivery.from.typeEstablishment)
		delivery.enabled = (unlocks[unlockType] and unlocks[unlockType].unlocked)
		if delivery.enabled then
			table.insert(deliveries, 1, delivery)	
		else
			table.insert(deliveries, delivery)
		end
	end
	
	self.deliveries = deliveries
	self:RequestDeliveries()
end


function JobDeliver:RequestDeliveries()
	Events:Fire("UpdateDeliveries", self.deliveries)
end


function JobDeliver:RequestDelivery(args)
	local data = {from = {}, to = nil}
	for _, delivery in pairs(self.deliveries) do
		if delivery.from.id == args.id then
			table.insert(data.from, delivery)
		end
		if delivery.to.id == args.id then
			if self.delivering and self.delivering.to.id == args.id then
				data.deliveringToThis = true
			end
			data.to = delivery
		end
	end
	Events:Fire("RequestDelivery_RETURN", data)
end


function JobDeliver:Render()
	if not self.delivering then return end
	if Game:GetHUDHidden() then return end

	Render:SetFont(AssetLocation.Disk, "Archivo.ttf")

	local size = Vector2(200, 25)
	local pos = Vector2(310, Render.Height - 71)
	
	local textPaymentValue = "R$ ".. tostring(self.payment)
	self:RenderRetangle(pos, size, self.Languages.LABEL_PAYMENT, textPaymentValue)
	
	local textEstablishment = tostring(self.delivering.to.name)
	self:RenderRetangle(pos, size, textEstablishment, "")
end


function JobDeliver:RenderRetangle(position, size, text, value)
	local margin = Vector2(5, 5)
	local textSize = 14
	
	Render:FillArea(position, size, Color(0, 0, 0, 100))
	Render:DrawText(position + margin, text, Color.White, textSize)
	Render:DrawText(position + Vector2(size.x - margin.x - Render:GetTextWidth(value, textSize), margin.y), value, Color.White, textSize)
	position.y = position.y - size.y - 2
end


function JobDeliver:Done()
	if self.delivering then
		if Vector3.Distance(LocalPlayer:GetPosition(), self.delivering.to.position) < 10 then
			Network:Send("DoneService", self.delivering)
			Events:Fire("RemoveObjective")
			self.delivering = false
			Events:Fire("AddNotificationAlert", {message = self.Languages.PLAYER_DONE_SERVICE})
		end
	end
end


function JobDeliver:Start(args)
	if self:CanDrive() then
		Network:Send("StartService", {id = args.id})
	end
end


function JobDeliver:CanDrive()
	local unlocks = LocalPlayer:GetJobUnlocks()
	if not LocalPlayer:InVehicle() then 
		Events:Fire("AddNotificationAlert", {message = self.Languages.PLAYER_NOT_IN_VEHICLE})
		return false
	end
	
	local modelId = LocalPlayer:GetVehicle():GetModelId()
	local vehicleUnlock = self.JobDeliverList:GetVehicleUnlock(modelId)
	
	if not (unlocks[vehicleUnlock] and unlocks[vehicleUnlock].unlocked) then
		Events:Fire("AddNotificationAlert", {message = self.Languages.PLAYER_CANT_DELIVER_THIS_VEHICLE})	
		return false
	end
		
	return true
end


function JobDeliver:StartService(args)
	local delivery = self.deliveries[args.id]
	self.delivering = delivery
	
	Events:Fire("SetObjective", {
		texts = {
			{text = self.Languages.TEXT_GO_TO .. " ", color = Color.White},
			{text = self.Languages.TEXT_UNLOADING, color = Color(52, 152, 219)},
			{text = ".", color = Color.White},
		},
		color = Color(52, 152, 219),
		name = tostring(delivery.to.name),
		position = delivery.to.position,
	})
	Waypoint:SetPosition(delivery.to.position)
	Events:Fire("AddNotificationAlert", {message = self.Languages.PLAYER_START_SERVICE})
end


function JobDeliver:ModuleUnload()
	if self.delivering then
		Events:Fire("RemoveObjective")
	end
end


function JobDeliver:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_START_SERVICE", {["en"] = "Start.", ["pt"] = "Iniciou."})
	self.Languages:SetLanguage("PLAYER_DONE_SERVICE", {["en"] = "Done", ["pt"] = "Finalizou"})
	self.Languages:SetLanguage("LABEL_PAYMENT", {["en"] = "Payment", ["pt"] = "Pagamento"})
	self.Languages:SetLanguage("TEXT_GO_TO", {["en"] = "Go to the", ["pt"] = "Vá para o"})
	self.Languages:SetLanguage("TEXT_UNLOADING", {["en"] = "unloading point", ["pt"] = "ponto de descarregamento"})
	self.Languages:SetLanguage("PLAYER_CANT_DELIVER_THIS_VEHICLE", {["en"] = "You cant drive this vehicle because you not unlocked it.", ["pt"] = "Você não pode trabalhar nesse veículo pois não o liberou ainda."})
	self.Languages:SetLanguage("PLAYER_NOT_IN_VEHICLE", {["en"] = "You are not in a vehicle.", ["pt"] = "Você não está em um veículo."})
end


JobDeliver = JobDeliver()