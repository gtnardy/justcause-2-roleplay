class 'Weapons'

function Weapons:__init()

	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	
	Network:Subscribe("ChangeWeapon", self, self.ChangeWeapon)
end


function Weapons:ChangeWeapon(args, player)

	player:ClearInventory()
	player:GiveWeapon(args.weapon.slot, Weapon(args.weapon.id, 0, args.weapon.ammo))
end


function Weapons:PlayerJoin(args)

	self:UpdatePlayer(args.player)
end


function Weapons:UpdatePlayer(player)

	local query = SQL:Query("SELECT IdWeapon, Ammo FROM PlayerWeapon WHERE IdPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	
	local result = query:Execute()
	local weapons = {}
	
	for _, line in pairs(result) do
		weapons[tonumber(line.IdWeapon)] = {ammo = tonumber(line.Ammo)}
	end
	
	player:SetNetworkValue("Weapons", weapons)
end


function Weapons:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS PlayerWeapon(" ..
		"IdPlayer VARCHAR(20) NOT NULL," ..
		"IdWeapon INTEGER NOT NULL," ..
		"Ammo INTEGER NOT NULL DEFAULT 0," ..
		"PRIMARY KEY (IdPlayer, IdWeapon))")
end


Weapons = Weapons()