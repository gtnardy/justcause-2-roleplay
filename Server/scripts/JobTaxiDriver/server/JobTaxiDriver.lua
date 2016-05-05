class 'JobTaxiDriver'

function JobTaxiDriver:__init()
	
	self.PRICE_KM = 5
	
	Network:Subscribe("EnteredTaxiAsPassgenger", self, self.EnteredTaxiAsPassgenger)
	Network:Subscribe("TaximeterOn", self, self.TaximeterOn)
	Network:Subscribe("TaximeterOff", self, self.TaximeterOff)
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


JobTaxiDriver = JobTaxiDriver()