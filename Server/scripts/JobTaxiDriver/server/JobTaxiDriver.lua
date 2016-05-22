class 'JobTaxiDriver'

function JobTaxiDriver:__init()
	
	self:SetLanguages()
	
	self.taxiRequests = {}
	self.timer = Timer()
	
	self.PRICE_KM = 5
	
	Network:Subscribe("EnteredTaxiAsPassgenger", self, self.EnteredTaxiAsPassgenger)
	Network:Subscribe("TaximeterOn", self, self.TaximeterOn)
	Network:Subscribe("TaximeterOff", self, self.TaximeterOff)
	Network:Subscribe("CallTaxi", self, self.CallTaxi)
	Network:Subscribe("AcceptTaxi", self, self.AcceptTaxi)
	
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("PlayerQuit", self, self.PlayerQuit)
end


function JobTaxiDriver:PlayerQuit(args)
	for idPlayer, request in pairs(self.taxiRequests) do
		if args.player:GetId() == idPlayer then
			self:RemoveRequest(idPlayer, false)
		end
	end
end


function JobTaxiDriver:PostTick()
	if self.timer:GetSeconds() > 5 then
		for idPlayer, request in pairs(self.taxiRequests) do
		
			request.remainingTime = request.remainingTime - 5
			if request.remainingTime <= 0 then
				self:RemoveRequest(idPlayer, true)
			end
		end
		self.timer:Restart()
	end	
end


function JobTaxiDriver:AcceptTaxi(args, player)
	if self.taxiRequests[args.player:GetId()] then
		self:RemoveRequest(args.player:GetId(), false)
		Events:Fire("AddNotificationAlert", {player = player, message = string.gsub(self.Languages.TAXI_ACCEPTED, "{VALUE}", args.player:GetCustomName())})
		Events:Fire("AddNotificationAlert", {player = args.player, message = string.gsub(self.Languages.DRIVER_ACCEPTED, "{VALUE}", player:GetCustomName())})
		Network:Send(player, "AcceptedTaxi", args)
	else
		Events:Fire("AddNotificationAlert", {player = player, message = self.Languages.TAXI_REQUEST_NOT_FOUND})
	end
end


function JobTaxiDriver:RemoveRequest(id, announce)
	self.taxiRequests[id] = nil
	self:UpdatePlayers()
	if announce then
		self:NotifyTaxidrivers(string.gsub(self.Languages.TAXI_REQUEST_EXPIRED, "{VALUE}", request.player:GetCustomName()))
	end
end


function JobTaxiDriver:CallTaxi(args, player)
	if self.taxiRequests[player:GetId()] then
		Events:Fire("AddNotificationAlert", {player = player, message = self.Languages.TAXI_REQUEST_YET_SENT})
	else
		Events:Fire("AddNotificationAlert", {player = player, message = self.Languages.TAXI_REQUEST_SENT})
		self.taxiRequests[player:GetId()] = {player = player, remainingTime = 180}
		
		self:NotifyTaxidrivers(string.gsub(self.Languages.TAXI_REQUEST_RECEIVED, "{VALUE}", player:GetCustomName()))
		self:UpdatePlayers()
	end
end


function JobTaxiDriver:NotifyTaxidrivers(message)
	for player in Server:GetPlayers() do
		if player:GetJob() == Jobs.TaxiDriver then
			Events:Fire("AddNotificationAlert", {player = player, message = message})
		end
	end
end


function JobTaxiDriver:UpdatePlayers()
	for player in Server:GetPlayers() do
		Network:Send(player, "UpdateData", {requests = self.taxiRequests})
	end
end


function JobTaxiDriver:EnteredTaxiAsPassgenger(args, player)
	Network:Send(args.driver, "PassengerEnteredTaxi", {passenger = player})
end


function JobTaxiDriver:TaximeterOn(args, player)
	Network:Send(args.passenger.player, "TaximeterOn", args)
end


function JobTaxiDriver:TaximeterOff(args, player)
	local price = self.PRICE_KM * math.ceil(args.distance / 1000)

	if args.passenger then
		if args.passenger.player then
			Network:Send(args.passenger.player, "TaximeterOff")
			args.passenger.player:SetMoney(args.passenger.player:GetMoney() - price)
		else
			local command = SQL:Command("UPDATE Player SET Dinheiro = Dinheiro - ? WHERE Id = ?")
			command:Bind(1, price)
			command:Bind(2, args.passenger.steamId)
			command:Execute()
		end
		player:SetMoney(player:GetMoney() + price)
	elseif args.driver then
		if args.driver.player then
			Network:Send(args.driver.player, "TaximeterOff")
			args.driver.player:SetMoney(args.driver.player:GetMoney() + price)
		else
			local command = SQL:Command("UPDATE Player SET Dinheiro = Dinheiro + ? WHERE Id = ?")
			command:Bind(1, price)
			command:Bind(2, args.driver.steamId)
			command:Execute()
		end
		player:SetMoney(player:GetMoney() - price)
	end
end


function JobTaxiDriver:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("TAXI_REQUEST_EXPIRED", {["en"] = "The taxi request of {VALUE} expired.", ["pt"] = "O pedido de Taxi de {VALUE} expirou."})
	self.Languages:SetLanguage("TAXI_REQUEST_RECEIVED", {["en"] = "The player {VALUE} is requesting taxi, verify your Interaction Menu (I) to see more.", ["pt"] = "O jogador {VALUE} está pedindo taxi! Verifique seu Menu de Contexto (I) para ver mais."})
	self.Languages:SetLanguage("TAXI_REQUEST_SENT", {["en"] = "Your taxi request was sent!", ["pt"] = "Os taxistas foram informados!"})
	self.Languages:SetLanguage("TAXI_REQUEST_YET_SENT", {["en"] = "You already did a request. Wait to request again.", ["pt"] = "Você já fez um pedido, espere para solicitar novamente."})
	self.Languages:SetLanguage("TAXI_REQUEST_NOT_FOUND", {["en"] = "This taxi request was not found, perhaps because another player has accepted the request or it expired.", ["pt"] = "Não foi possível encontrar esse pedido de taxi, talvez porque outro taxista já o aceitou ou o pedido expirou."})
	self.Languages:SetLanguage("TAXI_ACCEPTED", {["en"] = "You accepted the taxi request from {VALUE}, his position is marked on the map.", ["pt"] = "Você aceitou o pedido de {VALUE}, sua posição está marcada no mapa."})
	self.Languages:SetLanguage("DRIVER_ACCEPTED", {["en"] = "{VALUE} accepted YOUR taxi request, soon he will come.", ["pt"] = "{VALUE} aceitou seu pedido de taxi, em breve ele chegará em sua posição."})
end


JobTaxiDriver = JobTaxiDriver()