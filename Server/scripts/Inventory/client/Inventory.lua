class 'Inventory'

function Inventory:__init()

	self.ContextMenu = nil
	self.active = false
	self.GPS = {}
	self.InventoryItems = {}
	self.FeedingList = {}
	
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Network:Subscribe("UpdateData", self, self.UpdateData)
	Events:Subscribe("UpdateFeedingList", self, self.UpdateFeedingList)
end


function Inventory:UpdateFeedingList(list)
	self.FeedingList = list
end


function Inventory:UpdateData(args)
	if args.GPS then
		self.GPS = args.GPS
	end
	
	if args.inventoryItems then
		self.InventoryItems = args.inventoryItems
	end
end


function Inventory:ConfigureContextMenu()
	if self.ContextMenu then
		self.ContextMenu:SetActive(false)
	end
	self.ContextMenu = ContextMenu({
		subtitle = string.upper(self.Languages.LABEL_MENU),
		headerBackgroundColor = LocalPlayer:GetColor(),
		headerText = LocalPlayer:GetCustomName()
	})
	
	self.ContextMenu.list.subtitleNumeric = false
	
	-- GPS
	local itemGPS = ContextMenuItem({
		text = "GPS",
		legend = self.Languages.TEXT_ACCESS_GPS,
		enabled = true,
	})
	local listGPS = ContextMenuList({subtitle = "GPS"})
	listGPS.subtitleNumeric = false
	itemGPS.list = listGPS
	
	local itemGPSRemove = ContextMenuItem({
			text = self.Languages.GPS_NONE,
			enabled = true,
			legend = self.Languages.GPS_REMOVE,
	})
	itemGPSRemove.pressEvent = function() Waypoint:Remove() self:SetActive(false) end
	listGPS:AddItem(itemGPSRemove)
	
	for _, location in pairs(self.GPS) do
		local data = {positions = location.positions}
		local locationItem = ContextMenuItem({
			text = location.name,
			enabled = true,
			data = data,
			legend = self.Languages.GPS_SET_TO .. " " .. location.name .. "."
		})
		locationItem.pressEvent = function() Inventory:PressGPS(locationItem) end
		listGPS:AddItem(locationItem)
	end
	self.ContextMenu.list:AddItem(itemGPS)
	
	-- Inventory
	local itemInventory = ContextMenuItem({
		text = self.Languages.TEXT_INVENTORY,
		legend = self.Languages.TEXT_ACCESS_INVENTORY,
		enabled = true,
	})
	
	local listInventory = ContextMenuList({subtitle = string.upper(self.Languages.TEXT_INVENTORY)})
	itemInventory.list = listInventory
	
	for _, item in pairs(self.InventoryItems) do
		local foodData = self.FeedingList[item.id]
		if not foodData then foodData = {name = "Item not found", hunger = 0, thirst = 0} end

		local inventoryItem = ContextMenuItem({
			text = foodData.name,
			textRight = "x" .. tostring(item.quantity),
			enabled = true,
			data = {id = item.id, quantity = item.quantity, hunger = foodData.hunger, thirst = foodData.thirst},
			legend = self.Languages.TEXT_CONSUME .. " 1 " .. foodData.name .. ".",
			statistics = {
				{text = self.Languages.TEXT_HUNGER, value = foodData.hunger},
				{text = self.Languages.TEXT_THIRST, value = foodData.thirst},
			},
		})
		inventoryItem.pressEvent = function() Inventory:Consume(listInventory, inventoryItem) end
		listInventory:AddItem(inventoryItem)
	end
	
	self.ContextMenu.list:AddItem(itemInventory)
end


function Inventory:PressGPS(item)
	local positions = item.data.positions
	Waypoint:SetPosition(self:GetNearGPS(positions))
	item.legend:SetTempText(self.Languages.ITEM_SELECTED)
	self:SetActive(false)
end


function Inventory:Consume(list, item)
	item.data.quantity = item.data.quantity - 1
	if item.data.quantity <= 0 then
		item.enabled = false--list:RemoveItem(item)
		item.legend:SetText(self.Languages.ITEM_INVENTORY_EMPTY .. " " .. item.text .. ".")
	end
	item.textRight = "x" .. tostring(item.data.quantity)
	Network:Send("ConsumeFood", item.data)
end


function Inventory:GetNearGPS(positions)
	local nearGPS = nil
	
	for _, position in pairs(positions) do
		local dist = Vector3.Distance(LocalPlayer:GetPosition(), position)
		if not nearGPS or nearGPS.dist > dist then
			nearGPS = {dist = dist, position = position}
		end
	end
	
	return nearGPS.position
end


function Inventory:KeyUp(args)
	if args.key == string.byte("I") then
		self:SetActive(not self.active)
	end
end


function Inventory:SetActive(bool)
	self.active = bool
	if bool then
		self:ConfigureContextMenu()
		self.active = self.ContextMenu:SetActive(true)
	else
		if self.ContextMenu then
			self.ContextMenu:SetActive(false)
			self.ContextMenu = nil
		end
	end
end


function Inventory:ModuleLoad()
	self:SetLanguages()
end


function Inventory:SetLanguages()
	self.Languages = Languages()

	self.Languages:SetLanguage("LABEL_MENU", {["en"] = "Interaction Menu", ["pt"] = "Menu de Interação"})
	self.Languages:SetLanguage("ITEM_SELECTED", {["en"] = "Your GPS has been updated.", ["pt"] = "Seu GPS foi atualizado."})
	self.Languages:SetLanguage("GPS_SET_TO", {["en"] = "Set your GPS to nearest", ["pt"] = "Setar seu GPS para"})
	self.Languages:SetLanguage("GPS_NONE", {["en"] = "None", ["pt"] = "Nenhum"})
	self.Languages:SetLanguage("GPS_REMOVE", {["en"] = "Remve the GPS.", ["pt"] = "Remover o GPS."})
	self.Languages:SetLanguage("TEXT_INVENTORY", {["en"] = "Inventory", ["pt"] = "Inventário"})
	self.Languages:SetLanguage("TEXT_ACCESS_GPS", {["en"] = "Access the GPS.", ["pt"] = "Acessar o GPS."})
	self.Languages:SetLanguage("TEXT_ACCESS_INVENTORY", {["en"] = "Access the Inventory.", ["pt"] = "Acessar o Inventário."})
	self.Languages:SetLanguage("TEXT_CONSUME", {["en"] = "Consume", ["pt"] = "Consumir"})
	self.Languages:SetLanguage("ITEM_INVENTORY_EMPTY", {["en"] = "You no longer have any", ["pt"] = "Você não possui mais nenhum"})
	self.Languages:SetLanguage("TEXT_HUNGER", {["en"] = "Hunger", ["pt"] = "Fome"})
	self.Languages:SetLanguage("TEXT_THIRST", {["en"] = "Thirst", ["pt"] = "Sede"})
	self.Languages:SetLanguage("TEXT_BROWSE", {["en"] = "Browse", ["pt"] = "Navegar"})
	self.Languages:SetLanguage("TEXT_SELECT", {["en"] = "Select", ["pt"] = "Selecionar"})
end


Inventory = Inventory()