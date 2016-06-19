class ("WeaponsStore")(EstablishmentModule)

function WeaponsStore:__init()
	
	self.WeaponsList = WeaponsList()
	
	self:ConfigureEstablishmentModule()
	self:SetLanguages()
	
	self.enterEstablishmentMessage = self.Languages.PLAYER_ENTER_WEAPONSSTORE
	self.spotType = "WEAPONSSTORE_SPOT"
	
end


function WeaponsStore:ConfigureContextMenu()
	
	if self.ContextMenu then
		self.ContextMenu:SetActive(false)
	end
	
	self.ContextMenu = ContextMenu({subtitle = string.upper(self.Languages.TEXT_WEAPONSSTORE)})
	self.ContextMenu.list.subtitleNumeric = false
	
	local playerWeapons = LocalPlayer:GetWeapons()
	
	for id, weapon in pairs(self.WeaponsList.weapons) do
		local acquired = playerWeapons[id]

		local itemWeapon = ContextMenuItem({
			text = weapon.name .. (acquired and " (" .. self.Languages.TEXT_AMMO .. ")" or ""),
			textRight = "R$ " .. (acquired and tostring(weapon.ammoPrice) or tostring(weapon.price)),
			legend = acquired and ((acquired.ammo < weapon.maximumAmmo and self.Languages.TEXT_BUY_AMMO) or self.Languages.TEXT_FULL_AMMO) or self.Languages.TEXT_BUY_WEAPON,
			enabled = not acquired and (weapon.minimumLevel <= LocalPlayer:GetLevel()) or (acquired.ammo < weapon.maximumAmmo) ,
		})
		
		itemWeapon.pressEvent = function()
			local playerWeapons = LocalPlayer:GetWeapons()
			local acquired = playerWeapons[id]
			
			if acquired then
				if acquired.ammo < weapon.maximumAmmo then
					if LocalPlayer:GetMoney() >= weapon.ammoPrice then
						Network:Send("BuyAmmo", {id = id})
						itemWeapon.legend:SetTempText(self.Languages.TEXT_AMMO_BOUGHT)
						if acquired.ammo + weapon.defaultAmmo >= weapon.maximumAmmo then
							itemWeapon.enabled = false
							itemWeapon.legend:SetText(self.Languages.TEXT_FULL_AMMO)
						end
					else
						itemWeapon.legend:SetTempText(self.Languages.TEXT_NOT_ENOUGH_MONEY)
					end
				else
					itemWeapon.enabled = false
				end
			else
				if LocalPlayer:GetLevel() >= weapon.minimumLevel then
					if LocalPlayer:GetMoney() >= weapon.price then
						Network:Send("BuyWeapon", {id = id})
						itemWeapon.legend:SetText(self.Languages.TEXT_BUY_AMMO)
						itemWeapon.text = weapon.name .. " (" .. self.Languages.TEXT_AMMO .. ")"
						itemWeapon.textRight = "R$ " .. tostring(weapon.ammoPrice)
					else
						itemWeapon.legend:SetTempText(self.Languages.TEXT_NOT_ENOUGH_MONEY)
					end
				else
					itemWeapon.legend:SetTempText(string.gsub(self.Languages.TEXT_NOT_ENOUGH_LEVEL, "{VALUE}", tostring(weapon.minimumLevel)))
				end
			end
		end
		
		self.ContextMenu.list:AddItem(itemWeapon)
	end

end


function WeaponsStore:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_ENTER_WEAPONSSTORE", {["en"] = "Press F to access the Weapon Store.", ["pt"] = "Pressione F para acessar a Loja de Armas."})
	self.Languages:SetLanguage("TEXT_WEAPONSSTORE", {["en"] = "Weapons Store", ["pt"] = "Loja de Armas"})
	self.Languages:SetLanguage("TEXT_AMMO_BOUGHT", {["en"] = "Ammo bought.", ["pt"] = "Munição Comprada."})
	self.Languages:SetLanguage("TEXT_BUY_WEAPON", {["en"] = "Buy this weapon.", ["pt"] = "Comprar esta arma."})
	self.Languages:SetLanguage("TEXT_BUY_AMMO", {["en"] = "Buy ammo for this weapon.", ["pt"] = "Comprar munição para esta arma."})
	self.Languages:SetLanguage("TEXT_FULL_AMMO", {["en"] = "Full ammo.", ["pt"] = "Munição cheia."})
	self.Languages:SetLanguage("TEXT_NOT_ENOUGH_MONEY", {["en"] = "You do not have enough money.", ["pt"] = "Você não possui dinheiro suficiente."})
	self.Languages:SetLanguage("TEXT_NOT_ENOUGH_LEVEL", {["en"] = "You must be at least level {VALUE} to acquire this weapon.", ["pt"] = "Você deve possuir no mínimo nível {VALUE} para adquirir esta arma."})
	self.Languages:SetLanguage("TEXT_AMMO", {["en"] = "Ammo", ["pt"] = "Munição"})
end


WeaponsStore = WeaponsStore()