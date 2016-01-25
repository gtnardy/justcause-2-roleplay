class 'Fome'

function Fome:__init()
	
	Network:Subscribe("SaveData", self, self.SaveData)
	Network:Subscribe("Starving", self, self.Starving)
	DamageEntity.Starve = 5
end


function Fome:Starving(player)
	
	player:Damage(0.01, DamageEntity.Starve)
end


function Fome:SaveData(args, player)
	player:SetValue("Fome", args.fome)
	player:SetValue("Sede", args.sede)
end

Fome = Fome()