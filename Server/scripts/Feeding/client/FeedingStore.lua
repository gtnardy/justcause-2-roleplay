class 'FeedingStore'

function FeedingStore:__init()

	self.active = false
	self.atStore = false
	self.ContextMenu = nil
	
	self.FeedingStores = {}
	self.FeedingList = FeedingList()["FOOD"]
	
	Network:Subscribe("UpdateFeedingStores", self, self.UpdateFeedingStores)
	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("LocalPlayerExitSpot", self, self.LocalPlayerExitSpot)
	Events:Subscribe("LocalPlayerEnterSpot", self, self.LocalPlayerEnterSpot)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("KeyUp", self, self.KeyUp)
end


function FeedingStore:SetActive(bool)
	self.active = bool
	if bool then
		self:ConfigureContextMenu()
		self.active = self.ContextMenu:SetActive(true)
	elseif self.ContextMenu then
		self.ContextMenu:SetActive(false)
		self.ContextMenu = nil
	end
end


function FeedingStore:UpdateFeedingStores(args)
	self.FeedingStores = args.FeedingStores
end


function FeedingStore:ConfigureContextMenu()
	if self.ContextMenu then
		self.ContextMenu:SetActive(false)
	end
	self.ContextMenu = ContextMenu({subtitle = string.upper(self.Languages.LABEL_ITEMS)})

	for _, idFood in pairs(self.atStore.foods) do
		local foodData = self.FeedingList[idFood]

		local data = {
			id = idFood,
			value = foodData.value
		}
		
		local itemFood = ContextMenuItem({
			text = foodData.name,
			textRight = "R$ " .. foodData.value,
			data = data,
			legend = self.Languages.TEXT_BUY .. " " .. foodData.name .. " " .. self.Languages.TEXT_FOR .. " R$ " .. tostring(foodData.value) .. ".",
			enabled = true,
			statistics = {
				{text = self.Languages.TEXT_HUNGER, value = foodData.hunger},
				{text = self.Languages.TEXT_THIRST, value = foodData.thirst},
			},			
		})
		self.ContextMenu.list:AddItem(itemFood)

		itemFood.pressEvent = function()
			FeedingStore:BuyItem(itemFood.list, itemFood)
		end
	end
end


function FeedingStore:BuyItem(list, item)
	local data = item.data
	if LocalPlayer:GetMoney() < data.value then
		item.legend:SetTempText(self.Languages.PLAYER_INSUFFICIENT_MONEY)
		return
	end
	
	item.legend:SetTempText(self.Languages.PLAYER_ITEM_BOUGHT)
	Network:Send("BuyItem", data)
end


function FeedingStore:KeyUp(args)
	if args.key == string.byte("F") then
		if self.atStore then
			self:SetActive(not self.active)
		elseif self.active then
			self:SetActive(false)
		end
	end
end


function FeedingStore:LocalPlayerInput(args)
	if self.active and (args.input < Action.LookUp or args.input > Action.LookRight) then
		return false
	end
end


function FeedingStore:GetShop(args)
	--{id = spot.id, position = spot.position, radius = spot.radius, spotType = spot.spotType, name = spot.name, description = spot.description}
	args.foods = self.FeedingStores[args.id]
	return args
end


function FeedingStore:LocalPlayerEnterSpot(args)
	if args.spotType == "FOODSTORE_SPOT" then
		self.atStore = self:GetShop(args)
		Events:Fire("AddInformationAlert", {id = "PLAYER_ENTER_FEEDING_STORE", message = self.Languages.PLAYER_ENTER_FEEDING_STORE, priority = true})
	end
end


function FeedingStore:LocalPlayerExitSpot(args)
	if args.spotType == "FOODSTORE_SPOT" then
		self.atStore = false
		Events:Fire("RemoveInformationAlert", {id = "PLAYER_ENTER_FEEDING_STORE"})
	end
end


function FeedingStore:Render()
	if self.active and self.ContextMenu and not self.ContextMenu.active then
		self:SetActive(false)
	end
end


function FeedingStore:ModuleLoad()
	self:SetLanguages()
end


function FeedingStore:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_ENTER_FEEDING_STORE", {["en"] = "Press F to access the Feeding Store.", ["pt"] = "Pressione F para acessar a Loja."})
	self.Languages:SetLanguage("PLAYER_INSUFFICIENT_MONEY", {["en"] = "You do not have enough money.", ["pt"] = "Você não tem dinheiro suficiente."})
	self.Languages:SetLanguage("PLAYER_ITEM_BOUGHT", {["en"] = "You bought this item.", ["pt"] = "Você comprou este item."})

	self.Languages:SetLanguage("LABEL_ITEMS", {["en"] = "Items", ["pt"] = "Itens"})
	self.Languages:SetLanguage("TEXT_BUY", {["en"] = "Buy", ["pt"] = "Comprar"})
	self.Languages:SetLanguage("TEXT_FOR", {["en"] = "for", ["pt"] = "por"})
	self.Languages:SetLanguage("TEXT_HUNGER", {["en"] = "Hunger", ["pt"] = "Fome"})
	self.Languages:SetLanguage("TEXT_THIRST", {["en"] = "Thirst", ["pt"] = "Sede"})
end


FeedingStore = FeedingStore()