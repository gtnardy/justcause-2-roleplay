class 'JobDeliver'

function JobDeliver:__init()
	self.deliveries = {}
	
	Events:Subscribe("CreateDelivery", self, self.CreateDelivery)
	
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
end


function JobDeliver:CreateDelivery(delivery)
	self.deliveries[delivery.to.id] = delivery
	self:UpdatePlayers()
end


function JobDeliver:ClientModuleLoad(args)
	self:UpdatePlayer(args.player)
end


function JobDeliver:UpdatePlayers()
	Network:Broadcast("UpdateData", {deliveries = self.deliveries})
end


function JobDeliver:UpdatePlayer(player)
	Network:Send(player, "UpdateData", {deliveries = self.deliveries})
end


function JobDeliver:ServerStart()
	-- SQL:Execute("CREATE TABLE IF NOT EXISTS JobDeliveryDeliveries(" ..
		-- "Id INTEGER PRIMARY KEY AUTOINCREMENT," ..
		-- "IdJob INTEGER NOT NULL," ..
		-- "MinimumLevel INTEGER NOT NULL)")
		
	-- SQL:Execute("CREATE TABLE IF NOT EXISTS JobDeliveryStops(" ..
		-- "IdDelivery INT NOT NULL," ..
		-- "IdEstablishment INT NOT NULL," ..
		-- "Position VARCHAR(30) NOT NULL," ..
		-- "PRIMARY KEY(IdDelivery, IdEstablishment))")
end


JobDeliver = JobDeliver()