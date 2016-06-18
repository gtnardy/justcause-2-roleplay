class ("WeaponsStore")(EstablishmentModule)

function WeaponsStore:__init()
	
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

end


function WeaponsStore:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_ENTER_WEAPONSSTORE", {["en"] = "Press F to access the Weapon Store.", ["pt"] = "Pressione F para acessar a Loja de Armas."})
	self.Languages:SetLanguage("TEXT_WEAPONSSTORE", {["en"] = "Weapons Store", ["pt"] = "Loj de Armas"})
end


WeaponsStore = WeaponsStore()