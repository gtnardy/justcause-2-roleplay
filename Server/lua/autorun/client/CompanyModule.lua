class 'CompanyModule'

function CompanyModule:__init()
	
	self:SetLanguages()
end


function CompanyModule:GetContextMenuModule(company)
	local textRight = ""
	if company.owner then
		if company.owner.id == LocalPlayer:GetSteamId().id then
			textRight = self.Languages.TEXT_YOU_OWN
		else
			textRight = self.Languages.TEXT_OWNER .. ": " .. tostring(company.owner.name)
		end
	else
		textRight = self.Languages.TEXT_OWNERLESS
	end
	
	local itemCompany = ContextMenuItem({
		text = self.Languages.LABEL_COMPANY,
		textRight = textRight,
		textColor = Color(46, 204, 113),
		legend = self.Languages.DESCRIPTION_COMPANY,
	})
	
	itemCompany.list = ContextMenuList({subtitle =  string.upper(textRight)})
	itemCompany.list.subtitleNumeric = false
	
	local itemCompanyProduction = ContextMenuItem({
		text = self.Languages.LABEL_COMPANY_PRODUCTION,
		textRight = tostring(company.production) .. " /" .. self.Languages.TEXT_HOUR,
		legend = string.gsub(self.Languages.DESCRIPTION_PRODUCTION, "{VALUE}", tostring(company.production))
	})
	
	itemCompany.list:AddItem(itemCompanyProduction)
	
	if company.owner then
		if company.owner.id == LocalPlayer:GetSteamId().id then
			local itemCompanyGoods = ContextMenuItem({
				text = self.Languages.LABEL_COMPANY_GOODS,
				textRight = "...",
			})
			
			local itemCompanyFeedstock = ContextMenuItem({
				text = self.Languages.LABEL_COMPANY_FEEDSTOCK,
				textRight = "...",
			})
			
			local request = AsyncRequest():Request("RequestStock", {id = company.id},
				function(args)
					itemCompanyGoods.textRight = tostring(args.goods)
					itemCompanyGoods:SetLegend(string.gsub(self.Languages.DESCRIPTION_GOODS, "{VALUE}", tostring(args.goods)))
					itemCompanyGoods.textRightColor = args.goods > company.production and Color.White or Color.Red
					
					itemCompanyFeedstock.textRight = tostring(args.feedstock)
					itemCompanyFeedstock:SetLegend(string.gsub(self.Languages.DESCRIPTION_FEEDSTOCK, "{VALUE}", tostring(args.feedstock)))
					itemCompanyFeedstock.textRightColor = args.feedstock > company.production and Color.White or Color.Red
				end
			)
			
			if not company.isFactory then
				itemCompany.list:AddItem(itemCompanyFeedstock)
			end
			itemCompany.list:AddItem(itemCompanyGoods)
			
			local itemCompanySell = ContextMenuItem({
				text = self.Languages.LABEL_COMPANY_SELL,
				textRight = "R$ " .. tostring(company.value),
				textColor = Color(231, 76, 60),
				legend = string.gsub(self.Languages.DESCRIPTION_SELL, "{VALUE}", tostring(company.value)),
			})
			itemCompany.list:AddItem(itemCompanySell)
		else
		
		end
	else
		local canBuy = true
		if LocalPlayer:GetCompany() then canBuy = false end
		
		local itemCompanyBuy = ContextMenuItem({
			text = self.Languages.LABEL_COMPANY_BUY,
			textRight = "R$ " .. tostring(company.value),
			textColor = Color(231, 76, 60),
			enabled = canBuy,
			legend = canBuy and string.gsub(self.Languages.DESCRIPTION_BUY, "{VALUE}", tostring(company.value)) or self.Languages.DESCRIPTION_CANT_BUY,
		})
		
		itemCompany.list:AddItem(itemCompanyBuy)
	end
	
	return itemCompany
end


function CompanyModule:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("LABEL_COMPANY", {["en"] = "Company", ["pt"] = "Empresa"})
	self.Languages:SetLanguage("LABEL_COMPANY_PRODUCTION", {["en"] = "Production", ["pt"] = "Produção"})
	self.Languages:SetLanguage("LABEL_COMPANY_SELL", {["en"] = "Sell the Company", ["pt"] = "Vender a Empresa"})
	self.Languages:SetLanguage("LABEL_COMPANY_BUY", {["en"] = "Buy the Company", ["pt"] = "Comprar esta Empresa"})
	self.Languages:SetLanguage("LABEL_COMPANY_GOODS", {["en"] = "Goods", ["pt"] = "Mercadorias"})
	self.Languages:SetLanguage("LABEL_COMPANY_FEEDSTOCK", {["en"] = "Feedstock", ["pt"] = "Matérias-primas"})
	self.Languages:SetLanguage("TEXT_OWNERLESS", {["en"] = "Ownerless", ["pt"] = "Sem dono"})
	self.Languages:SetLanguage("TEXT_OWNER", {["en"] = "Owner", ["pt"] = "Proprietario"})
	self.Languages:SetLanguage("TEXT_HOUR", {["en"] = "hour", ["pt"] = "hora"})
	self.Languages:SetLanguage("TEXT_YOU_OWN", {["en"] = "You are the Owner", ["pt"] = "Você é o Proprietário"})
	self.Languages:SetLanguage("DESCRIPTION_PRODUCTION", {["en"] = "This company are producting {VALUE} good(s) per hour.", ["pt"] = "Esta empresa está produzindo {VALUE} mercadoria(s) por hora."})
	self.Languages:SetLanguage("DESCRIPTION_GOODS", {["en"] = "This company has {VALUE} good(s) in stock.", ["pt"] = "Esta empresa possui {VALUE} mercadoria(s) em estoque."})
	self.Languages:SetLanguage("DESCRIPTION_FEEDSTOCK", {["en"] = "This company has {VALUE} feedstock(s) in stock.", ["pt"] = "Esta empresa possui {VALUE} matéria(s)-prima(s) em estoque."})
	self.Languages:SetLanguage("DESCRIPTION_SELL", {["en"] = "Sell your company for R$ {VALUE}.", ["pt"] = "Vender sua empresa por {VALUE}."})
	self.Languages:SetLanguage("DESCRIPTION_BUY", {["en"] = "Buy this company for R$ {VALUE}.", ["pt"] = "Comprar esta empresa por {VALUE}."})
	self.Languages:SetLanguage("DESCRIPTION_CANT_BUY", {["en"] = "You can not buy this company because you already have a Company.", ["pt"] = "Você não pode comprar esta empresa pois já possui uma."})
	self.Languages:SetLanguage("DESCRIPTION_COMPANY", {["en"] = "Show company informations.", ["pt"] = "Ver informações desta empresa."})
end