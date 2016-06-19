class 'Police'

function Police:__init()

	self:SetLanguages()
	
	self.PoliceList = PoliceList()
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	
	Network:Subscribe("AcquireWeaponLicense", self, self.AcquireWeaponLicense)
	Network:Subscribe("PayWantedStar", self, self.PayWantedStar)
	Network:Subscribe("PayTrafficTicket", self, self.PayTrafficTicket)
	Network:Subscribe("EscapedPrision", self, self.EscapedPrision)
end


function Police:PlayerJoin(args)
	self:UpdatePlayer(args.player)
end


function Police:EscapedPrision(args, player)
	player:SetPosition(self.PoliceList.prisionLocation)
end


function Police:AcquireWeaponLicense(args, player)
	if player:GetMoney() >= self.PoliceList.weaponLicensePrice
	and player:GetLevel() >= self.PoliceList.weaponLicenseMinimumLevel
	and not player:GetWeaponLicense() then
	
		local command = SQL:Command("UPDATE Player SET WeaponLicense = 1 WHERE Id = ?")
		command:Bind(1, player:GetSteamId().id)
		command:Execute()

		player:SetNetworkValue("WeaponLicense", true)
	end
end


function Police:PayWantedStar(args, player)
	local data = self.PoliceList:GetWantedStar(args.id)
	if not data then return end
	
	if player:GetMoney() >= data.value then
		local command = SQL:Command("DELETE FROM PlayerWantedStar WHERE Id = ?")
		command:Bind(1, args.id)
		command:Execute()
		
		player:SetMoney(player:GetMoney() - data.value)
		local stars = player:GetValue("WantedStars")
		for _, star in pairs(stars) do
			if star.id == args.id then
				table.remove(stars, _)
				break
			end
		end
		player:SetNetworkValue("WantedStars", stars)
	end
end


function Police:PayTrafficTicket(args, player)
	local data = self.PoliceList:GetTrafficTicket(args.id)
	if not data then return end
	
	if player:GetMoney() >= data.value then
		local command = SQL:Command("DELETE FROM PlayerTrafficTicket WHERE Id = ?")
		command:Bind(1, args.id)
		command:Execute()
		
		player:SetMoney(player:GetMoney() - data.value)
		local tickets = player:GetValue("TrafficTickets")
		for _, ticket in pairs(tickets) do
			if ticket.id == args.id then
				table.remove(tickets, _)
				break
			end
		end
		player:SetNetworkValue("TrafficTickets", tickets)
	end
end


function Police:UpdatePlayer(player)
	local query = SQL:Query("SELECT * FROM PlayerTrafficTicket WHERE IdPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local trafficTickets = query:Execute()
	local tickets = {}
	for _, ticket in pairs(trafficTickets) do
		table.insert(tickets, {id = tonumber(ticket.id), idTicket = tonumber(ticket.IdTicket)})
	end
			
	player:SetNetworkValue("TrafficTickets", tickets)
	
	
	local query = SQL:Query("SELECT * FROM PlayerWantedStar WHERE IdPlayer = ?")
	query:Bind(1, player:GetSteamId().id)	
	local wantedStars = query:Execute()
	local wanteds = {}
	for _, wanted in pairs(wantedStars) do
		table.insert(wanteds, {id = tonumber(wanted.id), idWanted = tonumber(ticket.IdWanted)})
	end
	
	player:SetNetworkValue("WantedStars", wanteds)

	if #wanteds > 0 or #tickets > 0 then
		Events:Fire("AddNotificationAlert", {player = player, message = self.Languages.NOTIFICATION_PENDENCIES})
	end		
	
	local query = SQL:Query("SELECT * FROM PlayerArrested WHERE IdPlayer = ?")
	query:Bind(1, player:GetSteamId().id)	
	local arrested = query:Execute()

	if #arrested > 0 then
		player:SetNetworkValue("Arrested", {timeRemaining = tonumber(arrested.TimeRemaining)})
	end	
end


function Police:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS PlayerTrafficTicket(" ..
		"Id INTEGER PRIMARY KEY AUTOINCREMENT," ..
		"IdPlayer VARCHAR(20) NOT NULL," ..
		"IdTicket INTEGER NOT NULL," ..
		"IdPoliceOfficer VARCHAR(20))")
		
	SQL:Execute("CREATE TABLE IF NOT EXISTS PlayerWantedStar(" ..
		"Id INTEGER PRIMARY KEY AUTOINCREMENT," ..
		"IdPlayer VARCHAR(20) NOT NULL," ..
		"IdWanted INTEGER NOT NULL," ..
		"IdPoliceOfficer VARCHAR(20))")
		
	SQL:Execute("CREATE TABLE IF NOT EXISTS PlayerArrested(" ..
		"IdPlayer VARCHAR(20) NOT NULL," ..
		"TimeRemaining INTEGER NOT NULL," ..
		"IdPoliceOfficer VARCHAR(20))")
end


function Police:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("NOTIFICATION_PENDENCIES", {["en"] = "You have pendencies with the Police. Go to a Police Department to pay off your debts.", ["pt"] = "Você possui pendências com a policia. Vá a uma Delegacia para pagar suas dívidas."})
end


Police = Police()