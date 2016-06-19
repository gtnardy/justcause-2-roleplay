class ("Police")(EstablishmentModule)

function Police:__init()
	
	self.PoliceList = PoliceList()
	
	self:ConfigureEstablishmentModule()
	self:SetLanguages()
	
	self.enterEstablishmentMessage = self.Languages.PLAYER_ENTER_POLICEDEPARTMENT
	self.spotType = "POLICEDEPARTMENT_SPOT"

end


function Police:ConfigureContextMenu()
	
	if self.ContextMenu then
		self.ContextMenu:SetActive(false)
	end
	
	self.ContextMenu = ContextMenu({subtitle = string.upper(self.Languages.TEXT_POLICEDEPARTMENT)})
	self.ContextMenu.list.subtitleNumeric = false
	
	if LocalPlayer:GetJob() == Jobs.Police then
	
	else
	
	end
	
	local wantedStars = LocalPlayer:GetWantedStars()
	
	local itemWantedStars = ContextMenuItem({
		text = self.Languages.TEXT_WANTED_STARS,
		legend = self.Languages.TEXT_WANTED_STARS_DESCRIPTION,
	})
	
	local listWantedStars = ContextMenuList({subtitle = string.upper(self.Languages.TEXT_WANTED_STARS)})
	
	for _, wantedStar in pairs(wantedStars) do
		local data = self.PoliceList:GetWantedStar(wantedStar.idWanted)
		local itemWantedStar = ContextMenuItem({
			text = data.name,
			textRight = "R$ " .. tostring(data.value),
			legend = self.Languages.TEXT_WANTED_STAR_LEGEND .. data.name .. ".",
		})
		
		itemWantedStar.pressEvent = function()
			if LocalPlayer:GetMoney() >= data.value then
				Network:Send("PayWantedStar", {id = wantedStar.id})
				itemWantedStar.enabled = false
				itemWantedStar:SetLegend(self.Languages.TEXT_ITEM_PAID)
			else
				itemWantedStar.legend:SetTempText(self.Languages.PLAYER_INSUFFICIENT_MONEY)
			end			
		end		
		
		listWantedStars:AddItem(itemWantedStar)
	end
	
	itemWantedStars.list = listWantedStars
	
	self.ContextMenu.list:AddItem(itemWantedStars)
	
	
	local trafficTickets = LocalPlayer:GetTrafficTickets()
	
	local itemTrafficTicket = ContextMenuItem({
		text = self.Languages.TEXT_TRAFFIC_TICKETS,
		legend = self.Languages.TEXT_TRAFFIC_TICKETS_DESCRIPTION,
	})
	
	local listTrafficTicket = ContextMenuList({subtitle = string.upper(self.Languages.TEXT_TRAFFIC_TICKETS)})
	
	for _, trafficTicket in pairs(trafficTickets) do
		local data = self.PoliceList:GetTrafficTicket(trafficTicket.idTicket)
		local itemTrafficTicket = ContextMenuItem({
			text = data.name,
			textRight = "R$ " .. tostring(data.value),
			legend = self.Languages.TEXT_TRAFFIC_TICKET_LEGEND .. data.name .. ".",
		})
		
		itemTrafficTicket.pressEvent = function()
			if LocalPlayer:GetMoney() >= data.value then
				Network:Send("PayTrafficTicket", {id = trafficTicket.id})
				itemTrafficTicket.enabled = false
				itemTrafficTicket:SetLegend(self.Languages.TEXT_ITEM_PAID)
			else
				itemTrafficTicket.legend:SetTempText(self.Languages.PLAYER_INSUFFICIENT_MONEY)
			end
		end		
		
		listTrafficTicket:AddItem(itemTrafficTicket)
	end
	
	itemTrafficTicket.list = listTrafficTicket
	
	self.ContextMenu.list:AddItem(itemTrafficTicket)
	
	
	local gotWeaponLicense = LocalPlayer:GetWeaponLicense()
	local itemWeaponLicense = ContextMenuItem({
		text = self.Languages.TEXT_WEAPON_LICENSE,
		legend = gotWeaponLicense and self.Languages.TEXT_ITEM_ACQUIRED or self.Languages.TEXT_WEAPON_LICENSE_DESCRIPTION,
		textRight = "R$ " .. tostring(self.PoliceList.weaponLicensePrice),
		enabled = not gotWeaponLicense,
	})
	
	itemWeaponLicense.pressEvent = function()
		if not LocalPlayer:GetWeaponLicense() then
			if LocalPlayer:GetMoney() >= self.PoliceList.weaponLicensePrice then
				if LocalPlayer:GetLevel() >= self.PoliceList.weaponLicenseMinimumLevel then
					Network:Send("AcquireWeaponLicense")
					itemWeaponLicense.legend:SetText(self.Languages.TEXT_ITEM_ACQUIRED)
					itemWeaponLicense.enabled = false
				else
					itemWeaponLicense.legend:SetTempText(string.gsub(self.Languages.TEXT_NOT_ENOUGH_LEVEL, "{VALUE}", self.PoliceList.weaponLicenseMinimumLevel))
				end
			else
				itemWeaponLicense.legend:SetTempText(self.Languages.TEXT_NOT_ENOUGH_MONEY)
			end
		end
	end
	
	self.ContextMenu.list:AddItem(itemWeaponLicense)
end


function Police:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_ENTER_POLICEDEPARTMENT", {["en"] = "Press F to access the Police Department.", ["pt"] = "Pressione F para acessar o Departamento de Policia."})
	self.Languages:SetLanguage("TEXT_NOT_ENOUGH_MONEY", {["en"] = "You do not have enough money.", ["pt"] = "Você não possui dinheiro suficiente."})
	self.Languages:SetLanguage("TEXT_NOT_ENOUGH_LEVEL", {["en"] = "You must be at least level {VALUE} to acquire Weapon License.", ["pt"] = "Você deve ter no mínimo nível {VALUE} para poder adquirir Porte de Armas."})
	self.Languages:SetLanguage("TEXT_WEAPON_LICENSE", {["en"] = "Weapon License", ["pt"] = "Porte de Armas"})
	self.Languages:SetLanguage("TEXT_WEAPON_LICENSE_DESCRIPTION", {["en"] = "Buy Weapon License", ["pt"] = "Adquirir Porte de Armas"})
	self.Languages:SetLanguage("TEXT_POLICEDEPARTMENT", {["en"] = "Police Department", ["pt"] = "Departamento de Policia"})
	self.Languages:SetLanguage("TEXT_WANTED_STARS", {["en"] = "Wanted Stars", ["pt"] = "Estrelas de Procurado"})
	self.Languages:SetLanguage("TEXT_WANTED_STARS_DESCRIPTION", {["en"] = "Manage your Wanted Stars.", ["pt"] = "Gerenciar suas Estrelas de Procurado."})
	self.Languages:SetLanguage("TEXT_WANTED_STAR_LEGEND", {["en"] = "Pay the Wanted Star: ", ["pt"] = "Pagar a Estrela de Procurado: "})
	self.Languages:SetLanguage("TEXT_TRAFFIC_TICKETS", {["en"] = "Traffic Tickets", ["pt"] = "Multas"})
	self.Languages:SetLanguage("TEXT_TRAFFIC_TICKETS_DESCRIPTION", {["en"] = "Manage your Wanted Stars.", ["pt"] = "Gerenciar suas Estrelas de Procurado."})
	self.Languages:SetLanguage("TEXT_TRAFFIC_TICKET_LEGEND", {["en"] = "Pay the Traffic Ticket: ", ["pt"] = "Pagar a Multa: "})
	self.Languages:SetLanguage("TEXT_ITEM_PAID", {["en"] = "This debt was paid.", ["pt"] = "Esse débito foi pago."})
	self.Languages:SetLanguage("TEXT_ITEM_ACQUIRED", {["en"] = "You already have it.", ["pt"] = "Você adquiriu isto."})
	self.Languages:SetLanguage("PLAYER_INSUFFICIENT_MONEY", {["en"] = "You do not have enough money.", ["pt"] = "Você não tem dinheiro suficiente."})
end


Police = Police()