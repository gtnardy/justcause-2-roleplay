class 'Armometro'

function Armometro:__init()
	
	self.weapons = {}
	self.weapons[2] = "Pistol"
	self.weapons[4] = "Revolver"
	self.weapons[5] = "SMG"
	self.weapons[6] = "Sawed off shotgun"
	self.weapons[11] = "Assault rifle"
	self.weapons[13] = "Pump action shotgun"
	self.weapons[14] = "Sniper rifle"
	self.weapons[16] = "Rocket launcher"
	self.weapons[17] = "Grenade launcher"
	self.weapons[26] = "Minigun"
	self.weapons[28] = "Machine gun"
	self.weapons[31] = "SAM launcher"
	self.weapons[32] = "Sentry gun"
	self.weapons[34] = "Flak cannon (invalid)"
	self.weapons[43] = "Bubble blaster"
	self.weapons[52] = "Grappling hook (invalid)"
	self.weapons[66] = "Panay's rocket launcher"
	self.weapons[100] = "(DLC) Bull's Eye assault rifle"
	self.weapons[101] = "(DLC) Air propulsion gun"
	self.weapons[102] = "(DLC) Cluster bomb launcher"
	self.weapons[103] = "(DLC) Rico's signature gun"
	self.weapons[104] = "(DLC) Quad rocket launcher"
	self.weapons[105] = "(DLC) Multi-lock missile launcher"
	self.weapons[116] = "Vehicle rocket launcher"
	self.weapons[128] = "Vehicle machine gun (invalid)"
	self.weapons[129] = "Mounted machine gun"
	self.weapons[134] = "Cannon (invalid)"
	self.weapons[139] = "Vehicle grenade launcher (invalid)"

end


function Armometro:Render(posicao, raio)
	
	Render:FillCircle(posicao, raio, Color(0, 0, 0, 100))
	for i = 1, 5 do
		Render:DrawCircle(posicao, raio - 4 - i, Color(255, 255, 255, 200))
	end
	local weapon = LocalPlayer:GetEquippedWeapon()
	
	-- Municao
	local municao = tostring(weapon.ammo_clip)
	local municaoReserva = " /" .. tostring(weapon.ammo_reserve)
	local municaoSize = 36
	local municaoReservaSize = 14
	
	Render:DrawText(posicao + Vector2(-Render:GetTextWidth(municao, municaoSize), 10), municao, Color(255, 255, 255, 200), municaoSize)
	Render:DrawText(posicao + Vector2(0, 10), municaoReserva, Color(255, 255, 255, 200), municaoReservaSize)

	-- Nome
	local nome = string.upper(tostring(self.weapons[weapon.id]))
	Render:DrawText(posicao + Vector2(- Render:GetTextWidth(nome, 12) / 2, raio + 5), nome, Color(255, 255, 255, 200), 12)

end