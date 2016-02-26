class 'Inventory'

function Inventory:__init()
	self.GPS = {}
	self.InventoryGPSList = InventoryGPSList()["GPS"]
	
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("UpdateInventory", self, self.UpdateInventory)
	Network:Subscribe("ConsumeFood", self, self.ConsumeFood)
end


function Inventory:ConsumeFood(args, player)
	args.player = player
	Events:Fire("ConsumeFood", args)
end


function Inventory:UpdateInventory(args)
	self:UpdatePlayer(args.player)
end


function Inventory:ModuleLoad()
	
	for id, name in pairs(self.InventoryGPSList) do
		local positions = {}
		local query = SQL:Query("SELECT Position FROM Establishment WHERE Type = ?")
		query:Bind(1, id)
		local resultEstablishment = query:Execute()
		for _, establishment in ipairs(resultEstablishment) do
			table.insert(positions, self:StringToVector3(establishment.Position))
		end
		table.insert(self.GPS, {name = name, positions = positions})
	end
end


function Inventory:ClientModuleLoad(args)
	self:UpdatePlayer(args.player)
end


function Inventory:UpdatePlayer(player)
	local inventory = {}
	local query = SQL:Query("SELECT IdFood, Quantity FROM PlayerFood WHERE IdPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	for _, line in ipairs(result) do
		table.insert(inventory, {id = tonumber(line.IdFood), quantity = tonumber(line.Quantity)})
	end

	Network:Send(player, "UpdateData", {GPS = self.GPS, inventoryItems = inventory})
end


function Inventory:StringToVector3(str)
	local v = tostring(str):split(", ")
	return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
end


Inventory = Inventory()