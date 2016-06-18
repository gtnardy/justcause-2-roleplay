class 'FeedingStore'

function FeedingStore:__init()

	self.FeedingStores = {}
	self.FeedingList = FeedingList()
	
	Network:Subscribe("ExitFeedingStore", self, self.ExitFeedingStore)
	Network:Subscribe("BuyItem", self, self.BuyItem)
	
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("ServerStart", self, self.ServerStart)
	
	Events:Subscribe("UpdateSpots", self, self.UpdateSpots)
end


function FeedingStore:BuyItem(args, player)

	local value = self.FeedingList["FOOD"][args.id].value
	
	if player:GetMoney() < value then
		return
	end

	local query = SQL:Query("SELECT * FROM PlayerFood WHERE IdPlayer = ? AND IdFood = ?")
	query:Bind(1, player:GetSteamId().id)
	query:Bind(2, args.id)
	local result = query:Execute()
	if #result > 0 then
		local command = SQL:Command("UPDATE PlayerFood SET Quantity = Quantity + 1 WHERE IdPlayer = ? AND IdFood = ?")
		command:Bind(1, player:GetSteamId().id)
		command:Bind(2, args.id)
		command:Execute()
	else
		local command = SQL:Command("INSERT INTO PlayerFood VALUES(?, ?, ?)")
		command:Bind(1, player:GetSteamId().id)
		command:Bind(2, args.id)
		command:Bind(3, 1)
		command:Execute()
	end
	
	player:SetMoney(player:GetMoney() - value)
	
	Events:Fire("UpdateInventory", {player = player})
end


function FeedingStore:ExitFeedingStore()


end


function FeedingStore:UpdateSpots(args)
	if args.type != 11 then return end
	self:ModuleLoad()
	for player in Server:GetPlayers() do
		self:UpdatePlayer(player)
	end
end


function FeedingStore:ClientModuleLoad(args)
	self:UpdatePlayer(args.player)
end


function FeedingStore:ModuleLoad()

	local query = SQL:Query("SELECT Id FROM Establishment WHERE Type = 11")
	local establishments = query:Execute()
	
	for e, establishment in ipairs(establishments) do
		self.FeedingStores[establishment.Id] = {}
		
		query = SQL:Query("SELECT IdFood FROM EstablishmentFeedingStore WHERE IdEstablishment = ?")
		query:Bind(1, establishment.Id)
		local foods = query:Execute()
		for f, food in ipairs(foods) do
			table.insert(self.FeedingStores[establishment.Id], tonumber(food.IdFood))
		end		

	end
end


function FeedingStore:UpdatePlayer(player)
	Network:Send(player, "UpdateFeedingStores", {FeedingStores = self.FeedingStores})
end


function FeedingStore:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS EstablishmentFeedingStore(" ..
		"IdEstablishment INTEGER NOT NULL," ..
		"IdFood INTEGER NOT NULL," ..
		"PRIMARY KEY (IdEstablishment, IdFood))")
end


FeedingStore = FeedingStore()