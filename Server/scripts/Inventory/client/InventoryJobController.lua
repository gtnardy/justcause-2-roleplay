class 'InventoryJobController'

function InventoryJobController:__init()
	self:SetLanguages()

	self.taxiRequests = {}
	
	Events:Subscribe("TaxiRequests", self, self.TaxiRequests)
end


function InventoryJobController:TaxiRequests(args)
	self.taxiRequests = args
end


function InventoryJobController:GetContextMenuListForJob(job)
	if job == 2 then
		return self:GetTaxiDriver()
	else
	
	end
end


function InventoryJobController:GetTaxiDriver()
	local listTaxiDriver = ContextMenuList({subtitle = string.upper(LocalPlayer:GetJobName())})
	listTaxiDriver.subtitleNumeric = false
	
	local itemQueue = ContextMenuItem({text = self.Languages.TEXT_QUEUE, enabled = true, legend = self.Languages.TEXT_QUEUE_DESCRIPTION, textRight = ""})
	local listQueue = ContextMenuList({subtitle = self.Languages.TEXT_QUEUE})
	
	for _, request in pairs(self.taxiRequests) do
		local itemRequest = ContextMenuItem({text = request.player:GetCustomName(),
			enabled = true,
			legend = self.Languages.TEXT_ACCEPT_REQUEST,
			textRight = Vector3.Distance(LocalPlayer:GetPosition(), request.player:GetPosition()) .. " m",
			data = {player = request.player}
		})
		
		listQueue:AddItem(itemRequest)
		itemRequest.pressEvent = function() Inventory:AcceptTaxi(itemRequest) end
	end

	itemQueue.list = listQueue
	
	listTaxiDriver:AddItem(itemQueue)
	return listTaxiDriver
end


function InventoryJobController:SetLanguages()
	self.Languages = Languages()

	self.Languages:SetLanguage("TEXT_ACCEPT_REQUEST", {["en"] = "Accept the request", ["pt"] = "Aceitar o pedido"})
	self.Languages:SetLanguage("TEXT_QUEUE", {["en"] = "Taxi Requests", ["pt"] = "Pedidos de Taxi"})
	self.Languages:SetLanguage("TEXT_QUEUE_DESCRIPTION", {["en"] = "See all the taxi requests", ["pt"] = "Ver todos os pedidos de taxi"})
end
