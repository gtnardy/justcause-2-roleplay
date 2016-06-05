class 'JobDeliverList'

function JobDeliverList:__init()
	-- [ModelId] = Unlock
	self.vehicleUnlock = {
		[74] = 1,
		[21] = 1,
		[43] = 1,
		[89] = 1,
		[90] = 1,
		[61] = 1,
		[83] = 1,
		[32] = 1,
		[47] = 1,
	}
	
	-- [EstablishmentType] = ModelId
	self.vehiclesType = {
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