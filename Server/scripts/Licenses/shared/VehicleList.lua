class 'VehicleList'

function VehicleList:__init()
	--[Type] = Id
	self.types = {
		-- Moto
		[1] = {11, 36, 74, 21, 43, 89, 90, 61, 83, 32, 47, 75, 22, 9},
		
		-- Car
		[2] = {54, 72, 58, 73, 82, 23, 33, 63, 26, 68, 78, 8, 86, 35, 44, 77, 48, 2, 84, 46, 7, 10, 52, 29, 70, 55, 15, 13, 91, 60, 87, 1},
		
		-- Airplane
		[3] = {39, 85, 51, 34, 59, 30, 81},
		
		-- Helicopter
		[4] = {64, 65, 14, 67, 3, 37, 57, 62},
		
		-- Boat
		[5] = {53, 80, 38, 88, 45, 6, 19, 5, 27, 28, 25, 69, 16, 50},
		
		-- Bus
		[6] = {66, 12},
		
		-- Truck
		[7] = {20, 79, 18, 56, 40, 4, 41, 49, 71, 42, 76, 31},
		
	}
	
	-- [Type] = License
	self.typeLicenses = {
		[1] = "A",
		[2] = "B",
		[3] = "C",
		[4] = "E",
		[5] = "F",
		[6] = "D",
		[7] = "D",
	}
	
	-- [Type] = Price
	self.priceLicenses = {
		["A"] = 1000,
		["B"] = 1000,
		["C"] = 1000,
		["D"] = 1000,
		["E"] = 1000,
		["F"] = 1000,
		["G"] = 1000,
	}
end


function VehicleList:GetVehicleType(vehicleModelId)
	for typ, vehicles in pairs(self.types) do
		for _, vehicle in pairs(vehicles) do
			if vehicle == vehicleModelId then
				return typ
			end
		end
	end
	return 0
end


function VehicleList:GetLicenseType(typ)
	return self.typeLicenses[typ]
end


function VehicleList:GetPrice(typ)
	return self.priceLicenses[typ]
end