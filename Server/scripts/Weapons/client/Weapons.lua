class 'Weapons'

function Weapons:__init()
	
	self.weapons = {}
	self.equippedWeapon = 0
	self.WeaponsList = WeaponsList()
	
	self:GetWeapons()
	
	Events:Subscribe("MouseScroll", self, self.MouseScroll)
	Events:Subscribe("NetworkObjectValueChange", self, self.NetworkObjectValueChange)
end


function Weapons:NetworkObjectValueChange(args)
	if args.object.__type == "LocalPlayer" and args.key == "Weapons" then
		self:GetWeapons()
	end
end


function Weapons:GetWeapons()
	local weapons = LocalPlayer:GetWeapons()
	local newWeapons = {}
	local weaponsData = self.WeaponsList.weapons
	for id, weapon in pairs(weapons) do
		weapon.id = id
		weapon.slot = weaponsData[id].slot
		table.insert(newWeapons, weapon)
	end
	self.weapons = newWeapons
end


function Weapons:MouseScroll(args)
	self.equippedWeapon = (self.equippedWeapon + (args.delta > 0 and 1 or -1)) % #self.weapons
	
	Network:Send("ChangeWeapon", {weapon = self.weapons[self.equippedWeapon + 1]})
	Game:FireEvent("gui.weapon.raiseaim")
end


Weapons = Weapons()