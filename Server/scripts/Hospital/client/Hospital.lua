class ("Hospital")(EstablishmentModule)

function Hospital:__init()

	self:ConfigureEstablishmentModule()
	self:SetLanguages()
	
	self.priceInsurance = 5000
	
	self.enterEstablishmentMessage = self.Languages.PLAYER_ENTER_HOSPITAL
	self.spotType = "HOSPITAL_SPOT"
end


function Hospital:ConfigureContextMenu()
	if self.ContextMenu then
		self.ContextMenu:SetActive(false)
	end
	self.ContextMenu = ContextMenu({subtitle = "HOSPITAL"})
	self.ContextMenu.list.subtitleNumeric = false
	
	local acquired = LocalPlayer:GetLifeInsurance()
	local itemInsurance = ContextMenuItem({
		text = self.Languages.TEXT_INSURANCE,
		textRight = "$" .. tostring(self.priceInsurance),
		legend = acquired and self.Languages.TEXT_INSURANCE_OWN or self.Languages.TEXT_INSURANCE_LEGEND,
		enabled = not acquired,
	})
	
	if not acquired then
		itemInsurance.pressEvent = function()
			if LocalPlayer:GetMoney() > self.priceInsurance then
				itemInsurance.enbled = false
				itemInsurance.legend:SetTempText(self.Languages.TEXT_ITEM_BOUGHT)
				Network:Send("BuyLifeInsurance")
			else
				itemInsurance.legend:SetTempText(self.Languages.TEXT_NOT_ENOUGH_MONEY)
			end
		end
	end
	
	self.ContextMenu.list:AddItem(itemInsurance)
end


function Hospital:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_ENTER_HOSPITAL", {["en"] = "Press F to access the Hospital.", ["pt"] = "Pressione F para acessar o Hospital."})
	self.Languages:SetLanguage("TEXT_INSURANCE", {["en"] = "Life Insurance", ["pt"] = "Seguro de Vida"})
	self.Languages:SetLanguage("TEXT_INSURANCE_OWN", {["en"] = "You already have Life Insurance.", ["pt"] = "Você já possui Seguro de Vida."})
	self.Languages:SetLanguage("TEXT_INSURANCE_LEGEND", {["en"] = "Buy Life Insurance to ensure that your money is not lost by dying.", ["pt"] = "Comprar seguro de vida para assegurar que o seu dinheiro não seja perdido ao morrer."})
	self.Languages:SetLanguage("TEXT_NOT_ENOUGH_MONEY", {["en"] = "You do not have enough money to buy this!", ["pt"] = "Você não possui dinheiro suficiente para comprar isso!"})
	self.Languages:SetLanguage("TEXT_ITEM_BOUGHT", {["en"] = "You bought the Life Insurance.", ["pt"] = "Você comprou o Seguro de Vida!"})
end


Hospital = Hospital()