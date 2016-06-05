class 'Licenses'

function Licenses:__init()
	Network:Subscribe("EjectPlayer", self, self.EjectPlayer)
end


function Licenses:EjectPlayer(args, player)
	if not player:InVehicle() then return end
	player:Teleport(player:GetVehicle():GetPosition(), player:GetVehicle():GetAngle())
end


Licenses = Licenses()