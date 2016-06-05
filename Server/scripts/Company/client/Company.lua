class 'Company'

function Company:__init()
	
	self:SetLanguages()
	
	self.companies = {}
	self.whitelistCompanies = {"CLOTHFACTORY_SPOT", "COTTONFACTORY_SPOT"}
	
	self.atCompany = false
	self.active = false
	self.ContextMenu = nil

	self.CompanyModule = CompanyModule()
	
	Network:Subscribe("UpdateData", self, self.UpdateData)
	
	Events:Subscribe("LocalPlayerEnterSpot", self, self.LocalPlayerEnterSpot)
	Events:Subscribe("LocalPlayerExitSpot", self, self.LocalPlayerExitSpot)
	
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	
	Events:Subscribe("StartDelivery", self, self.StartDelivery)
	Events:Subscribe("DoneDelivery", self, self.DoneDelivery)
end


function Company:StartDelivery(args)
	Events:Fire("StartingDelivery", args)
	self:SetActive(false)
end


function Company:DoneDelivery()
	self:SetActive(false)
end


function Company:UpdateData(args)
	self.companies = args.companies
end


function Company:KeyUp(args)
	if args.key == string.byte("F") then
		if self.atCompany then
			self:SetActive(not self.active)
		elseif self.active then
			self:SetActive(false)
		end
	end
end


function Company:LocalPlayerEnterSpot(args)
	for _, companyType in pairs(self.whitelistCompanies) do
		if companyType == args.spotType then
			self.atCompany = args
		end
	end
end


function Company:LocalPlayerExitSpot(args)
	if self.atCompany and args.id == self.atCompany.id then
		self:SetActive(false)
		self.atCompany = false
	end
end


function Company:ConfigureContextMenu()

	if self.ContextMenu then
		self.ContextMenu:SetActive(false)
	end
	self.ContextMenu = ContextMenu({subtitle = string.upper(self.Languages.LABEL_COMPANY)})
	
	self.ContextMenu.list = self.CompanyModule:GetContextMenuModule(self.atCompany.company).list
	self.ContextMenu.list.active = true
end


function Company:SetActive(bool)
	self.active = bool
	if bool then
		self:ConfigureContextMenu()
		self.active = self.ContextMenu:SetActive(true)
	else
		if self.ContextMenu then
			self.ContextMenu:SetActive(false)
		end
	end
end


function Company:Render()
	if self.active and self.ContextMenu and not self.ContextMenu.active then
		self:SetActive(false)
	end
end


function Company:LocalPlayerInput(args)
	if self.active and (args.input < Action.LookUp or args.input > Action.LookRight) then
		return false
	end
end


function Company:RequestStock(args)
	for _, company in pairs(self.companies) do
		if company.id == args.id then
			Events:Fire("RequestStock_RETURN", {goods = company.goods, feedstock = company.feedstock})
			break
		end
	end
end


function Company:SetLanguages()	
	self.Languages = Languages()
	self.Languages:SetLanguage("LABEL_COMPANY", {["en"] = "Company", ["pt"] = "Empresa"})
end


Company = Company()