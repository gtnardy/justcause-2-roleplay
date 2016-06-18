class 'JobDeliverList'

function JobDeliverList:__init()
	-- [ModelId] = Unlock
	self.vehicleUnlock = {
		-- Motos
		[74] = 1,
		[21] = 1,
		[43] = 1,
		[89] = 1,
		[90] = 1,
		[61] = 1,
		[83] = 1,
		[32] = 1,
		[47] = 1,
		
		-- Normal Cars
		[44] = 2,
		[29] = 2,
		[15] = 2,
		
		-- Fiorino
		[23] = 3,
		[33] = 3,
		[68] = 3,
		[60] = 3,
		
		-- Pickups
		[63] = 4,
		[26] = 4,
		[86] = 4,
		[7] = 4,
		[73] = 4,
		
		-- Trucks
		[40] = 5,
		[41] = 5,
		[49] = 5,
		[42] = 5,
		[31] = 5,
		
	}
	
	-- [EstablishmentType] = ModelId
	self.vehiclesType = {
		-- CLOTHFACTORY
		[14] = {74, 21, 43, 89, 90, 61, 83, 32, 47},
	}
	
	-- [EstablishmentType] = Unlock
	self.unlocksType = {
		[14] = 1,
		[15] = 1,
	}
	
end


function JobDeliverList:GetVehicleUnlock(modelId)
	return self.vehicleUnlock[modelId]
end


function JobDeliverList:GetUnlocksType(typeEstablishment)
	return self.unlocksType[typeEstablishment]
end

function JobDeliverList:GetVehiclesType(typeEstablishment)
	return self.vehiclesType[typeEstablishment]
end