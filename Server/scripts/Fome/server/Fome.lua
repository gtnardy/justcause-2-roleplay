class 'Fome'

function Fome:__init()
	
	Network:Subscribe("Starving", self, self.Starving)
end


function Fome:Starving(player)
	
	player:Damage(0.01, DamageEntity.Starve)
end

Fome = Fome()