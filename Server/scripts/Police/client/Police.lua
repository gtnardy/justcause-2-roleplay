class ("Police")(EstablishmentModule)

function Police:__init()
	
	self.PoliceList = PoliceList()
	
	self:ConfigureEstablishmentModule()
	self:SetLanguages()
	
	self.enterEstablishmentMessage = self.Languages.PLAYER_ENTER_POLICEDEPARTMENT
	self.spotType = "POLICEDEPARTMENT_SPOT"
	
	self.timer = Timer()
	
	Events:Subscribe("PostTick", self, self.PostTick)
end


function Police:PostTick()
	if self.timer:GetSeconds() > 5 then
		self.timer:Restart()
		
		if LocalPlayer:GetArrested() then
			if Vector3.Distance(LocalPlayer:GetPosition(), self.PoliceList.prisionLocation) > 10 then
				Network:Send("EscapedPrision")
				Events:Fire("AddNotificationAlert", {message = self.Languages.DO_NOT_ESCAPE})
			end
		end
	end
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
	
	self.ContextMenu.list:AddItem(itemWantedStars)
	self.ContextMenu.list:AddItem(itemTrafficTicket)
end


function Police:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_ENTER_POLICEDEPARTMENT", {["en"] = "Press F to access the Police Department.", ["pt"] = "Pressione F para acessar o Departamento de Policia."})
	self.Languages:SetLanguage("TEXT_POLICEDEPARTMENT", {["en"] = "Police Department", ["pt"] = "Departamento de Policia"})
	self.Languages:SetLanguage("TEXT_WANTED_STARS", {["en"] = "Wanted Stars", ["pt"] = "Estrelas de Procurado"})
	self.Languages:SetLanguage("TEXT_WANTED_STARS_DESCRIPTION", {["en"] = "Manage your Wanted Stars.", ["pt"] = "Gerenciar suas Estrelas de Procurado."})
	self.Languages:SetLanguage("TEXT_WANTED_STAR_LEGEND", {["en"] = "Pay the Wanted Star: ", ["pt"] = "Pagar a Estrela de Procurado: "})
	self.Languages:SetLanguage("TEXT_TRAFFIC_TICKETS", {["en"] = "Traffic Tickets", ["pt"] = "Multas"})
	self.Languages:SetLanguage("TEXT_TRAFFIC_TICKETS_DESCRIPTION", {["en"] = "Manage your Wanted Stars.", ["pt"] = "Gerenciar suas Estrelas de Procurado."})
	self.Languages:SetLanguage("TEXT_TRAFFIC_TICKET_LEGEND", {["en"] = "Pay the Traffic Ticket: ", ["pt"] = "Pagar a Multa: "})
	self.Languages:SetLanguage("TEXT_ITEM_PAID", {["en"] = "This debt was paid.", ["pt"] = "Esse débito foi pago."})
	self.Languages:SetLanguage("PLAYER_INSUFFICIENT_MONEY", {["en"] = "You do not have enough money.", ["pt"] = "Você não tem dinheiro suficiente."})
	self.Languages:SetLanguage("DO_NOT_ESCAPE", {["en"] = "Do not to try to escape from prision.", ["pt"] = "Não tente fugir da prisão."})

end


Police = Police()