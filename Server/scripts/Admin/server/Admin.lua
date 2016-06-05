class 'Admin'

function Admin:__init()
	
	-- Admins Commands
	Network:Subscribe("Vspawn", self, self.Vspawn) 
	Network:Subscribe("Ban", self, self.Ban) 
	Network:Subscribe("Kick", self, self.Kick) 
	Network:Subscribe("TP", self, self.TP)
	Network:Subscribe("TPW", self, self.TPW)
	
	-- Sets
	Network:Subscribe("SetEstablishment", self, self.SetEstablishment) 
end


function Admin:Vspawn(args, player)
	local vehicle = Vehicle.Create({
		position = player:GetPosition(),
		model_id = args.model_id,
		angle = player:GetAngle(),
		world = player:GetWorld(),
	})
	player:EnterVehicle(vehicle, VehicleSeat.Driver)
end


function Admin:Ban(args, player)

end


function Admin:Kick(args, player)

end


function Admin:TP(args, player)
	player:Teleport(args.player:GetPosition(), args.player:GetAngle())
end


function Admin:TPW(args, player)
	player:Teleport(args.position, player:GetAngle())
end


function Admin:Bring(args, player)
	args.player:Teleport(player:GetPosition(), player:GetAngle())
end


function Admin:SetEstablishment(args, player)
	Events:Fire("SetEstablishment", args)
end



Admin = Admin()