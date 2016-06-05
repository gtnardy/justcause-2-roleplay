class 'JobDeliver'

function JobDeliver:__init()
	self:SetLanguages()
	
	self.deliveries = {}
	
	Events:Subscribe("CreateDelivery", self, self.CreateDelivery)
	
	Network:Subscribe("StartService", self, self.StartService)
	Network:Subscribe("DoneService", self, self.DoneService)
	Network:Subscribe("PlayerUppedJobLevel", self, self.PlayerUppedJobLevel)
	
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
end


function JobDeliver:PlayerUppedJobLevel(args)
	self:UpdatePlayer(args.player)
end


function JobDeliver:StartService(args, player)
	local delivery = nil
	for _, del in pairs(self.deliveries) do
		if del.id == args.id then
			delivery = del
			break
		end
	end
	
	delivery.deliveries = delivery.deliveries - 1
	if delivery.deliveries <= 0 then
		self:DeleteDelivery(args.id)
	else
		self:UpdatePlayers()
	end
	
	if delivery then
		Network:Send(player, "StartService", args)
		player:SetNetworkValue("Working", true)
	else
		Events:Fire("AddNotificationAlert", {player = player, self.Languages.DELIVERY_NOT_FOUND})
	end
end


function JobDeliver:DoneService(args, player)
	local payment = args.payment
	Events:Fire("EarnJobExperience", {player = player, experience = payment})
	Events:Fire("EarnExperience", {player = player, experience = payment})
	player:SetMoney(player:GetMoney() + payment)
	player:SetNetworkValue("Working", nil)
	
	local command = SQL:Command("UPDATE Company SET Goods = Goods - ? WHERE IdEstablishment = ?")
	command:Bind(1, args.goods)
	command:Bind(2, args.from.id)
	command:Execute()
	
	local command = SQL:Command("UPDATE Company SET Goods = Goods + ? WHERE IdEstablishment = ?")
	command:Bind(1, args.goods)
	command:Bind(2, args.to.id)
	command:Execute()
	
	Events:Fire("UpdateCompanies")
end


function JobDeliver:DeleteDelivery(id)
	local command = SQL:Command("DELETE FROM JobDeliveryDeliveries WHERE Id = ?")
	command:Bind(1, id)
	command:Execute()
	
	for _, delivery in pairs(self.deliveries) do
		if delivery.id == id then
			table.remove(self.deliveries, _)
			break
		end
	end
	self:UpdatePlayers()
end


function JobDeliver:CreateDelivery(delivery)
	local command = SQL:Command("INSERT INTO JobDeliveryDeliveries (IdEstablishmentTo, IdEstablishmentFrom, Payment, Goods, Distance, Deliveries) VALUES(?, ?, ?, ?, ?, ?)")
	command:Bind(1, delivery.to.id)
	command:Bind(2, delivery.from.id)
	command:Bind(3, delivery.cost)
	command:Bind(4, delivery.goods)
	command:Bind(5, delivery.distance)
	command:Bind(6, delivery.deliveries)
	command:Execute()
	
	self:UpdateDeliveries()
	self:UpdatePlayers()
end


function JobDeliver:UpdateDeliveries()
	local query = SQL:Query("SELECT dd.Id, dd.IdEstablishmentTo, dd.IdEstablishmentFrom, dd.Distance, dd.Payment, eTo.Position AS 'PositionTo', eFrom.Position AS 'PositionFrom', eTo.Name AS 'NameTo', eFrom.Name AS 'NameFrom', eFrom.Type AS 'TypeFrom', dd.Deliveries FROM JobDeliveryDeliveries dd INNER JOIN Establishment eTo ON eTo.Id = dd.IdEstablishmentTo INNER JOIN Establishment eFrom ON eFrom.Id = dd.IdEstablishmentFrom")
	local result = query:Execute()
	for _, line in pairs(result) do
		table.insert(self.deliveries, {
			id = tonumber(line.Id),
			to = {id = tonumber(line.IdEstablishmentTo), position = Vector3.ParseString(line.PositionTo), name = line.NameTo},
			from = {id = tonumber(line.IdEstablishmentFrom), position = Vector3.ParseString(line.PositionFrom), name = line.NameFrom, typeEstablishment = tonumber(line.TypeFrom)},
			deliveries = tonumber(line.Deliveries),
			distance = tonumber(line.Distance),
			payment = tonumber(line.Payment),
		})
	end
end


function JobDeliver:ModuleLoad()
	self:UpdateDeliveries()
end


function JobDeliver:ClientModuleLoad(args)
	self:UpdatePlayer(args.player)
end


function JobDeliver:UpdatePlayers()
	for player in Server:GetPlayers() do
		self:UpdatePlayer(player)
	end
end


function JobDeliver:UpdatePlayer(player)
	if player:GetJob() == Jobs.Deliver then
		Network:Send(player, "UpdateData", {deliveries = self.deliveries})
	end
end


function JobDeliver:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS JobDeliveryDeliveries(" ..
		"Id INTEGER PRIMARY KEY AUTOINCREMENT," ..
		"IdEstablishmentTo INTEGER NOT NULL," ..
		"IdEstablishmentFrom INTEGER NOT NULL," ..
		"Payment INTEGER NOT NULL," ..
		"Goods INTEGER NOT NULL," ..
		"Deliveries INTEGER NOT NULL," ..
		"Distance INTEGER NOT NULL)")
end


function JobDeliver:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("DELIVERY_NOT_FOUND", {["en"] = "This delivery is no longer available.", ["pt"] = "Essa estrega não está mais disponível."})	
end


JobDeliver = JobDeliver()