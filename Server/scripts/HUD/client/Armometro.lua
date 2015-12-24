class 'Armometro'

function Armometro:__init()
	
	self.weapons = {}
	self.weapons[2] = {name = "Pistol", image = Image.Create(AssetLocation.Resource, "Pistol_Weapon")}
	self.weapons[4] = {name = "Revolver", image = Image.Create(AssetLocation.Resource, "Revolver_Weapon")}
	self.weapons[5] = {name = "SMG", image = Image.Create(AssetLocation.Resource, "SMG_Weapon")}
	self.weapons[6] = {name = "Sawed Off Shotgun", image = Image.Create(AssetLocation.Resource, "Sawed_Weapon")}
	self.weapons[11] = {name = "Assault Rifle", image = Image.Create(AssetLocation.Resource, "Assault_Weapon")}
	self.weapons[13] = {name = "Pump Action Shotgun", image = Image.Create(AssetLocation.Resource, "Shotgun_Weapon")}
	self.weapons[14] = {name = "Sniper rifle", image = Image.Create(AssetLocation.Resource, "Sniper_Weapon")}
	self.weapons[16] = {name = "Rocket launcher", image = Image.Create(AssetLocation.Resource, "Bazooka_Weapon")}
	self.weapons[17] = {name = "Grenade launcher", image = Image.Create(AssetLocation.Resource, "Granadier_Weapon")}
	self.weapons[26] = {name = "Minigun", image = Image.Create(AssetLocation.Resource, "Minigun_Weapon")}
	self.weapons[28] = {name = "Machine gun", image = Image.Create(AssetLocation.Resource, "Machinegun_Weapon")}
	-- self.weapons[31] = {name = "SAM launcher", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	self.weapons[32] = {name = "Sentry gun", image = Image.Create(AssetLocation.Resource, "Turret_Weapon")}
	-- self.weapons[34] = {name = "Flak cannon (invalid)", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[43] = {name = "Bubble blaster", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[52] = {name = "Grappling hook (invalid)", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[66] = {name = "Panay's rocket launcher", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[100] = {name = "(DLC) Bull's Eye assault rifle", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[101] = {name = "(DLC) Air propulsion gun", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[102] = {name = "(DLC) Cluster bomb launcher", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[103] = {name = "(DLC) Rico's signature gun", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[104] = {name = "(DLC) Quad rocket launcher", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[105] = {name = "(DLC) Multi-lock missile launcher", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[116] = {name = "Vehicle rocket launcher", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[128] = {name = "Vehicle machine gun (invalid)", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	self.weapons[129] = {name = "Mounted machine gun", image = Image.Create(AssetLocation.Resource, "Turret_Weapon")}
	-- self.weapons[134] = {name = "Cannon (invalid)", image = Image.Create(AssetLocation.Resource, "_Weapon")}
	-- self.weapons[139] = {name = "Vehicle grenade launcher (invalid)", image = Image.Create(AssetLocation.Resource, "_Weapon")}

	self.municaoSize = 32
	self.municaoReservaSize = 16
	
end


function Armometro:Render(posicao, raio)
	
	Render:FillCircle(posicao, raio, Color(0, 0, 0, 75))
	--for i = 1, 5 do
		Render:DrawCircle(posicao, raio - 5, Color(255, 255, 255, 125))
		Render:DrawCircle(posicao, raio - 6, Color(255, 255, 255, 150))
		Render:DrawCircle(posicao, raio - 4, Color(255, 255, 255, 125))
	--end
	local weapon = LocalPlayer:GetEquippedWeapon()
	local municao = tostring(weapon.ammo_clip)
	local municaoReserva = " /" .. tostring(weapon.ammo_reserve)
	
	Render:DrawText(posicao + Vector2(-Render:GetTextWidth(municao, self.municaoSize), 10), municao, Color(255, 255, 255, 200), self.municaoSize)
	Render:DrawText(posicao + Vector2(0, 10), municaoReserva, Color(255, 255, 255, 200), self.municaoReservaSize)

	-- Nome
	local weaponData = self.weapons[weapon.id]
	if not weaponData then return end
	local nome = string.upper(tostring(weaponData.name))
	Render:DrawText(posicao + Vector2(- Render:GetTextWidth(nome, 14) / 2, raio + 8), nome, Color(255, 255, 255, 200), 14)
	
	weaponData.image:SetPosition(posicao - weaponData.image:GetSize() / 2 - Vector2(0, 10))
	weaponData.image:Draw()

end