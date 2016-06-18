class 'Feeding'

function Feeding:__init()
	
	Network:Subscribe("SaveData", self, self.SaveData)
	Network:Subscribe("Starving", self, self.Starving)
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("ConsumeFood", self, self.ConsumeFood)
end


function Feeding:ConsumeFood(args)
	local query = SQL:Query("SELECT Quantity FROM PlayerFood WHERE IdPlayer = ? AND IdFood = ?")
	query:Bind(1, args.player:GetSteamId().id)
	query:Bind(2, args.id)
	local result = query:Execute()
	if #result > 0 then
		if tonumber(result[1].Quantity) <= 1 then
			local command = SQL:Command("DELETE FROM PlayerFood WHERE IdPlayer = ? AND IdFood = ?")
			command:Bind(1, args.player:GetSteamId().id)
			command:Bind(2, args.id)
			command:Execute()
		else
			local command = SQL:Command("UPDATE PlayerFood SET Quantity = Quantity - 1 WHERE IdPlayer = ? AND IdFood = ?")
			command:Bind(1, args.player:GetSteamId().id)
			command:Bind(2, args.id)
			command:Execute()
		end
		Network:Send(args.player, "ConsumeFood", args)
	end
	Events:Fire("UpdateInventory", {player = args.player})
end


function Feeding:Starving(player)
	player:Damage(0.01, DamageEntity.Starve)
end


function Feeding:SaveData(args, player)
	player:SetValue("Fome", args.fome)
	player:SetValue("Sede", args.sede)
end


function Feeding:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS PlayerFood(" ..
		"IdPlayer VARCHAR(20) NOT NULL," ..
		"IdFood INTEGER NOT NULL," ..
		"Quantity INTEGER NOT NULL," ..
		"PRIMARY KEY (IdPlayer, IdFood))")
end


Feeding = Feeding()