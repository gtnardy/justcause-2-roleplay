class 'ClothingStore'

function ClothingStore:__init()

	self.ClothingStores = {}
	self.ClothingsList = ClothingsList()
	
	Network:Subscribe("ExitClothingStore", self, self.ExitClothingStore)
	Network:Subscribe("TrySkin", self, self.TrySkin)
	Network:Subscribe("BuyClothing", self, self.BuyClothing)
	Network:Subscribe("EquipClothing", self, self.EquipClothing)
	
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("ServerStart", self, self.ServerStart)
end


function ClothingStore:ExitClothingStore(args, player)
	self:UpdatePlayerSkin(player)
	self:UpdatePlayerClothings(player)
end


function ClothingStore:TrySkin(args, player)
	player:SetModelId(tonumber(args.id))
end


function ClothingStore:EquipClothing(args, player)

	local value = self.ClothingsList[args.clothingType][args.id].value
	
	local command = SQL:Command("UPDATE PlayerClothing SET Equipped = 0 WHERE IdPlayer = ? AND ClothingType = ?")
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, args.clothingType)
	command:Execute()
	
	command = SQL:Command("UPDATE PlayerClothing SET Equipped = 1 WHERE IdPlayer = ? AND ClothingType = ? AND IdClothing = ?")
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, args.clothingType)
	command:Bind(3, args.id)
	command:Execute()
	
	if args.clothingType == "SKIN" then
		player:SetModelId(tonumber(args.id))
	end
	
	local clothings = player:GetValue("Clothings")
	if not clothings then clothings = {} end
	clothings[args.clothingType] = args.id
	player:SetNetworkValue("Clothings", clothings)
end


function ClothingStore:BuyClothing(args, player)
	if player:GetMoney() < args.value then
		return
	end
	
	local value = self.ClothingsList[args.clothingType][args.id].value

	local query = SQL:Query("SELECT * FROM PlayerClothing WHERE IdPlayer = ? AND IdClothing = ? AND ClothingType = ?")
	query:Bind(1, player:GetSteamId().id)
	query:Bind(2, args.id)
	query:Bind(3, args.clothingType)
	local result = query:Execute()
	if #result > 0 then
		return
	end
	
	player:SetMoney(player:GetMoney() - value)
	
	local command = SQL:Command("INSERT INTO PlayerClothing VALUES(?, ?, ?, 1)")
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, args.id)
	command:Bind(3, args.clothingType)
	command:Execute()

	if args.clothingType == "SKIN" then
		player:SetModelId(tonumber(args.id))
	end
	
	local clothings = player:GetValue("Clothings")
	if not clothings then clothings = {} end
	clothings[args.clothingType] = args.id
	player:SetNetworkValue("Clothings", clothings)
end


function ClothingStore:UpdatePlayerSkin(player)
	local clothings = player:GetValue("Clothings")
	if not clothings or not clothings["SKIN"] then return end
	player:SetModelId(tonumber(clothings["SKIN"]))
end


function ClothingStore:UpdatePlayerClothings(player)
	local clothings = player:GetValue("Clothings")
	if not clothings then clothings = {} end
	for clothingType, id in pairs(clothings) do
		clothings[clothingType] = id
	end
	player:SetNetworkValue("Clothings", clothings)	
end


function ClothingStore:ClientModuleLoad(args)
	self:UpdatePlayer(args.player)
end


function ClothingStore:ModuleLoad()

	self:SetLanguages()

	local query = SQL:Query("SELECT DISTINCT(IdEstablishment) FROM EstablishmentClothing")
	local establishments = query:Execute()
	
	for e, establishment in ipairs(establishments) do
		self.ClothingStores[establishment.IdEstablishment] = {}
		
		query = SQL:Query("SELECT DISTINCT(ClothingType) FROM EstablishmentClothing WHERE IdEstablishment = ? ORDER BY ClothingType")
		query:Bind(1, establishment.IdEstablishment)
		local clothingTypes = query:Execute()
		
		for t, clothingType in ipairs(clothingTypes) do
			self.ClothingStores[establishment.IdEstablishment][clothingType.ClothingType] = {}
			
			query = SQL:Query("SELECT IdClothing FROM EstablishmentClothing WHERE IdEstablishment = ? AND ClothingType = ?")
			query:Bind(1, establishment.IdEstablishment)
			query:Bind(2, clothingType.ClothingType)
			local clothings = query:Execute()
			
			for v, clothing in ipairs(clothings) do
				table.insert(self.ClothingStores[establishment.IdEstablishment][clothingType.ClothingType], clothing.IdClothing)
			end
		end
	end
	
	self:UpdatePlayers()
end


function ClothingStore:UpdatePlayers()
	for player in Server:GetPlayers() do
		self:UpdatePlayer(player)
	end
end


function ClothingStore:UpdatePlayer(player)
	Network:Send(player, "UpdateClothingStores", {ClothingStores = self.ClothingStores})
	self:UpdatePlayerClothingsAcquired(player)
end


function ClothingStore:UpdatePlayerClothingsAcquired(player)
	local clothingsAcquired = {}
	local query = SQL:Query("SELECT DISTINCT(ClothingType) FROM PlayerClothing WHERE IdPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local clothingTypes = query:Execute()
	
	for e, clothingType in ipairs(clothingTypes) do
		clothingsAcquired[clothingType.ClothingType] = {}
		
		query = SQL:Query("SELECT IdClothing FROM PlayerClothing WHERE IdPlayer = ? AND clothingType = ?")
		query:Bind(1, player:GetSteamId().id)
		query:Bind(2, clothingType.ClothingType)
		local clothings = query:Execute()
		
		for c, clothing in ipairs(clothings) do
			clothingsAcquired[clothingType.ClothingType][clothing.IdClothing] = true
		end
	end	
	Network:Send(player, "UpdateClothingsAcquired", {clothingsAcquired = clothingsAcquired})
end


function ClothingStore:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS EstablishmentClothing(" ..
		"IdEstablishment INTEGER NOT NULL," ..
		"IdClothing INTEGER NOT NULL," ..
		"ClothingType VARCHAR(10) NOT NULL," ..
		"PRIMARY KEY (IdEstablishment, IdClothing, ClothingType))")
end


function ClothingStore:SetLanguages()
	self.Languages = Languages()
end

ClothingStore = ClothingStore()