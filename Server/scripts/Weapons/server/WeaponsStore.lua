class 'WeaponsStore'

function WeaponsStore:__init()

	self.WeaponsList = WeaponsList()
	Network:Subscribe("BuyWeapon", self, self.BuyWeapon)
	Network:Subscribe("BuyAmmo", self, self.BuyAmmo)
end


function WeaponsStore:BuyAmmo(args, player)
	local weapons = player:GetWeapons()
	if not weapons[args.id] then return end
	
	local weaponData = self.WeaponsList.weapons[args.id]
	if not weaponData then return end
	
	if player:GetMoney() < weaponData.ammoPrice then return end
	
	local ammo = math.min(weapons[args.id].ammo + weaponData.defaultAmmo, weaponData.maximumAmmo)
	
	local command = SQL:Command("UPDATE PlayerWeapon SET Ammo = ? WHERE IdPlayer = ? AND IdWeapon = ?")
	command:Bind(1, ammo)
	command:Bind(2, player:GetSteamId().id)
	command:Bind(3, args.id)
	command:Execute()
	
	player:SetMoney(player:GetMoney() - weaponData.ammoPrice)
	
	weapons[args.id] = {ammo = ammo}
	player:SetNetworkValue("Weapons", weapons)
end


function WeaponsStore:BuyWeapon(args, player)
	local weapons = player:GetWeapons()
	if weapons[args.id] then return end
	
	local weaponData = self.WeaponsList.weapons[args.id]
	if not weaponData then return end
	
	if player:GetMoney() < weaponData.price then return end
	if player:GetLevel() < weaponData.minimumLevel then return end
	
	local command = SQL:Command("INSERT INTO PlayerWeapon (IdPlayer, IdWeapon, Ammo) VALUES(?, ?, ?)")
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, args.id)
	command:Bind(3, weaponData.defaultAmmo)
	command:Execute()
	
	player:SetMoney(player:GetMoney() - weaponData.price)
	
	weapons[args.id] = {ammo = weaponData.defaultAmmo}
	player:SetNetworkValue("Weapons", weapons)
end


WeaponsStore = WeaponsStore()