class 'ClothingStore'

function ClothingStore:__init()
	
	self.active = false
	self.naLoja = false
	self.ContextMenu = nil
	
	self.ClothingStores = {}
	self.ClothingsList = ClothingsList()
	self.clothingAcquired = {}
	
	Network:Subscribe("UpdateClothingStores", self, self.UpdateClothingStores)
	Network:Subscribe("UpdateClothingsAcquired", self, self.UpdateClothingsAcquired)
	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("LocalPlayerExitSpot", self, self.LocalPlayerExitSpot)
	Events:Subscribe("LocalPlayerEnterSpot", self, self.LocalPlayerEnterSpot)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("KeyUp", self, self.KeyUp)
end


function ClothingStore:SetActive(bool)

	self.active = bool
	if bool then
		self:ConfigureContextMenu()
		self.ContextMenu:SetActive(true)
	else
		self.ContextMenu:SetActive(false)
		self.ContextMenu = nil
		Network:Send("ExitClothingStore")
	end
end


function ClothingStore:Render()
	if self.active and self.ContextMenu and not self.ContextMenu.active then
		self:SetActive(false)
	end
end


function ClothingStore:ConfigureContextMenu()

	if self.ContextMenu then
		self.ContextMenu:SetActive(false)
	end
	self.ContextMenu = ContextMenu({subtitle = string.upper(self.Languages.LABEL_CATEGORIES)})
	
	local clothingsPlayer = LocalPlayer:GetValue("Clothings")
	if not clothingsPlayer then clothingsPlayer = {} end
	
	for clothingType, clothings in pairs(self.naLoja.clothingTypes) do
		local itemClothing = ContextMenuItem({text = self.Languages["LABEL_"..clothingType], active = true})
		self.ContextMenu.list:AddItem(itemClothing)
		
		itemClothing.list = ContextMenuList({subtitle =  string.upper(self.Languages["LABEL_"..clothingType])})
		
		for _, idSkin in pairs(clothings) do
			local clothingData = self.ClothingsList[clothingType][idSkin]
			if not clothingData then break end
			
			local imageRight = nil
			local imageRight_white = nil
			local acquired = self.clothingsAcquired[clothingType] and self.clothingsAcquired[clothingType][idSkin]
			local legend = self.Languages.TEXT_BUY .. " " .. clothingData.name .. " " .. self.Languages.TEXT_FOR .. " R$ " .. clothingData.value .. "."
			local equipped = ((clothingType == "SKIN") and (LocalPlayer:GetModelId() == tonumber(idSkin))) or (clothingsPlayer[clothingType] and clothingsPlayer[clothingType] == idSkin)
			local enabled = true
			
			if equipped then
				imageRight = EQUIPPED_IMAGE
				imageRight_white = EQUIPPED_WHITE_IMAGE
				legend = self.Languages.PLAYER_EQUIPPED_ITEM
			elseif acquired then
				imageRight = ACQUIRED_IMAGE
				imageRight_white = ACQUIRED_WHITE_IMAGE
				legend = self.Languages.PLAYER_HAVE_ITEM
			end
			
			local data = {
				clothingType = clothingType,
				id = idSkin,
				value = clothingData.value,
				equipped = equipped,
				acquired = acquired
			}
			
			local item = ContextMenuItem({
				text = clothingData.name,
				textRight = "R$ " .. clothingData.value,
				data = data,
				legend = legend,
				enabled = enabled,
				imageRight = imageRight,
				imageRight_white = imageRight_white
			})
			
			item.selectEvent = function()
				ClothingStore:TryClothing(itemClothing.list, item)
				end
			item.pressEvent = function()
				ClothingStore:BuyClothing(itemClothing.list, item)
			end
			itemClothing.list:AddItem(item)	
		end
	end
end


function ClothingStore:TryClothing(list, item)
	local data = item.data
	if data.clothingType == "SKIN" then
		Network:Send("TrySkin", {id = data.id})
	else		
		local clothings = LocalPlayer:GetValue("Clothings")
		if not clothings then clothings = {} end
		
		clothings[data.clothingType] = data.id
		LocalPlayer:SetValue("Clothings", clothings)
	end
end


function ClothingStore:BuyClothing(list, item)

	local data = item.data
	if LocalPlayer:GetMoney() < data.value then
		item.legend:SetTempText(self.Languages.PLAYER_INSUFFICIENT_MONEY)
		return
	end

	for _, item in pairs(list.items) do
		if item.data.equipped then
			item.data.equipped = false
			item.imageRight = ACQUIRED_IMAGE
			item.imageRight_white = ACQUIRED_WHITE_IMAGE
			item.legend:SetText(self.Languages.PLAYER_HAVE_ITEM) 
		end
	end
	
	if data.acquired and not data.equipped then
		Network:Send("EquipClothing", data)
	else
		Network:Send("BuyClothing", data)
	end
	item.legend:SetText(self.Languages.PLAYER_EQUIPPED_ITEM)
	data.acquired = true
	data.equipped = true
	item.imageRight = EQUIPPED_IMAGE
	item.imageRight_white = EQUIPPED_WHITE_IMAGE
end


function ClothingStore:KeyUp(args)
	if args.key == string.byte("F") then
		if self.naLoja then
			self:SetActive(not self.active)
		elseif self.active then
			self:SetActive(false)
		end
	end
end


function ClothingStore:LocalPlayerInput(args)
	if self.active and (args.input < Action.LookUp or args.input > Action.LookRight) then
		return false
	end
end


function ClothingStore:UpdateClothingStores(args)
	self.ClothingStores = args.ClothingStores
end


function ClothingStore:UpdateClothingsAcquired(args)
	self.clothingsAcquired = args.clothingsAcquired
end


function ClothingStore:GetShop(args)
	--{id = spot.id, position = spot.position, radius = spot.radius, spotType = spot.spotType, name = spot.name, description = spot.description}
	args.clothingTypes = self.ClothingStores[args.id]
	return args
end


function ClothingStore:LocalPlayerEnterSpot(args)
	if args.spotType == "ClothingShop_Spot" then
		self.naLoja = self:GetShop(args)
		Events:Fire("AddInformationAlert", {id = "PLAYER_ENTER_CLOTHING_SHOP", message = self.Languages.PLAYER_ENTER_CLOTHING_SHOP, priority = true})
	end
end


function ClothingStore:LocalPlayerExitSpot(args)
	if args.spotType == "ClothingShop_Spot" then
		self.naLoja = false
		Events:Fire("RemoveInformationAlert", {id = "PLAYER_ENTER_CLOTHING_SHOP"})
	end
end


function ClothingStore:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_ENTER_CLOTHING_SHOP", {["en"] = "Press F to acess the Clothing Shop.", ["pt"] = "Pressione F para acessar a Loja de Roupas."})
	self.Languages:SetLanguage("PLAYER_INSUFFICIENT_MONEY", {["en"] = "You do not have enough money.", ["pt"] = "Você não tem dinheiro suficiente."})
	self.Languages:SetLanguage("LABEL_CATEGORIES", {["en"] = "Categories", ["pt"] = "Categorias"})
	self.Languages:SetLanguage("LABEL_SKIN", {["en"] = "Skins", ["pt"] = "Roupas"})
	self.Languages:SetLanguage("LABEL_HAT", {["en"] = "Hats", ["pt"] = "Chapeus"})
	self.Languages:SetLanguage("LABEL_GLASSES", {["en"] = "Glasses", ["pt"] = "Oculos"})
	self.Languages:SetLanguage("LABEL_TIE", {["en"] = "Ties", ["pt"] = "Gravatas"})
	self.Languages:SetLanguage("LABEL_BAG", {["en"] = "Bags", ["pt"] = "Mochilas"})
	self.Languages:SetLanguage("LABEL_BELT", {["en"] = "Belts", ["pt"] = "Cintos"})
	self.Languages:SetLanguage("TEXT_BUY", {["en"] = "Buy", ["pt"] = "Comprar"})
	self.Languages:SetLanguage("TEXT_FOR", {["en"] = "for", ["pt"] = "por"})
	self.Languages:SetLanguage("PLAYER_HAVE_ITEM", {["en"] = "You own this item but it is not in use.", ["pt"] = "Você possui este item, mas ele não está em uso."})
	self.Languages:SetLanguage("PLAYER_EQUIPPED_ITEM", {["en"] = "Equipped item.", ["pt"] = "Item Equipado"})
end


function ClothingStore:ModuleLoad()
	self:SetLanguages()
end


ClothingStore = ClothingStore()