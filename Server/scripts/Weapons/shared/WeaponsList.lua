class 'WeaponsList'

function WeaponsList:__init()
	self.weapons = {
		[Weapon.Handgun] = {name = "Handgun", price = 1000, minimumLevel = 1, defaultAmmo = 30, ammoPrice = 500, maximumAmmo = 500, slot = WeaponSlot.Right},
		[Weapon.Revolver] = {name = "Revolver", price = 2000, minimumLevel = 1, defaultAmmo = 30, ammoPrice = 500, maximumAmmo = 500, slot = WeaponSlot.Right},
		[Weapon.MachineGun] = {name = "MachineGun", price = 3000, minimumLevel = 1, defaultAmmo = 30, ammoPrice = 500, maximumAmmo = 500, slot = WeaponSlot.Right},
		[Weapon.SMG] = {name = "SMG", price = 3000, minimumLevel = 1, defaultAmmo = 30, ammoPrice = 500, maximumAmmo = 500, slot = WeaponSlot.Right},
		[Weapon.Shotgun] = {name = "Shotgun", price = 3000, minimumLevel = 1, defaultAmmo = 30, ammoPrice = 500, maximumAmmo = 500, slot = WeaponSlot.Right},
		[Weapon.Sniper] = {name = "Sniper", price = 3000, minimumLevel = 1, defaultAmmo = 30, ammoPrice = 500, maximumAmmo = 500, slot = WeaponSlot.Right},
		[Weapon.Assault] = {name = "Assault", price = 3000, minimumLevel = 1, defaultAmmo = 30, ammoPrice = 500, maximumAmmo = 500, slot = WeaponSlot.Right},
		[Weapon.BubbleGun] = {name = "BubbleGun", price = 50000, minimumLevel = 5, defaultAmmo = 30, ammoPrice = 100000, maximumAmmo = 500, slot = WeaponSlot.Right},
		[Weapon.SawnOffShotgun] = {name = "SawnOffShotgun", price = 3000, minimumLevel = 1, defaultAmmo = 30, ammoPrice = 500, maximumAmmo = 500, slot = WeaponSlot.Right},
	}
end