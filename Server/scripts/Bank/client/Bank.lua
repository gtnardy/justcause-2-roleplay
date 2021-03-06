class ("Bank")(EstablishmentModule)

function Bank:__init()
	
	self:ConfigureEstablishmentModule()
	self:SetLanguages()
	
	self.enterEstablishmentMessage = self.Languages.PLAYER_ENTER_BANK
	self.spotType = "BANK_SPOT"
	
	self.MoneyBank = 0
	
	self.operationValues = {
		10, 50, 100, 500, 1000, 10000, 100000,
	}
	
	Events:Subscribe("NetworkObjectValueChange", self, self.NetworkObjectValueChange)
end


function Bank:NetworkObjectValueChange(args)
	if args.object.__type == "LocalPlayer" and args.key == "MoneyBank" and self.active then
		self.itemBalance.data.value = args.value
		self.itemBalance.textRight = "$".. tostring(args.value)
		self.MoneyBank = args.value
	end
end


function Bank:ConfigureContextMenu()
	
	self.MoneyBank = LocalPlayer:GetValue("MoneyBank") or 0
	
	if self.ContextMenu then
		self.ContextMenu:SetActive(false)
	end
	self.ContextMenu = ContextMenu({subtitle = self.Languages.TEXT_BANK})
	self.ContextMenu.list.subtitleNumeric = false
	
	self.itemBalance = ContextMenuItem({
		text = self.Languages.TEXT_BALANCE,
		textRight = "$" .. tostring(self.MoneyBank),
		textRightColor = Color(46, 204, 113),
		legend = self.Languages.TEXT_BALANCE_AVAILABLE,
		data = {value = self.MoneyBank},
	})
	local itemWithdraw = ContextMenuItem({text = self.Languages.TEXT_WITHDRAW, listInLine = true})
	local listWithdraw = ContextMenuList({subtitle = self.Languages.TEXT_WITHDRAW})
	itemWithdraw.list = listWithdraw

	local itemDeposit = ContextMenuItem({text = self.Languages.TEXT_DEPOSIT, listInLine = true})
	local listDeposit = ContextMenuList({subtitle = self.Languages.TEXT_DEPOSIT})
	itemDeposit.list = listDeposit
	
	for _, value in pairs(self.operationValues) do
		local data = {value = value}
		local itemValueDeposit = ContextMenuItem({text = "$" .. tostring(value), data = data})
		itemValueDeposit.enabled = LocalPlayer:GetMoney() >= value
		itemValueDeposit.selectEvent = function()
			itemValueDeposit.enabled = LocalPlayer:GetMoney() >= itemValueDeposit.data.value
			if itemValueDeposit.enabled then
				itemDeposit.legend:SetText(self.Languages.TEXT_DEPOSIT .. " $".. tostring(itemValueDeposit.data.value) .. ".")
			else
				itemDeposit.legend:SetText(self.Languages.TEXT_NOT_ENOUGH_MONEY)	
			end
		end
		
		itemValueDeposit.pressEvent = function()
			if itemValueDeposit.enabled then
				self:Deposit(itemValueDeposit)
			end
		end
		listDeposit:AddItem(itemValueDeposit)
		
		local itemValueWithdraw = ContextMenuItem({text = "$" .. tostring(value), data = data})
		
		itemValueWithdraw.enabled = self.MoneyBank >= value
		itemValueWithdraw.selectEvent = function()
			itemValueWithdraw.enabled = self.MoneyBank >= itemValueWithdraw.data.value
			if itemValueWithdraw.enabled then
				itemWithdraw.legend:SetText(self.Languages.TEXT_WITHDRAW .. " $".. tostring(itemValueWithdraw.data.value) .. ".")
			else
				itemWithdraw.legend:SetText(self.Languages.TEXT_NOT_ENOUGH_MONEY_BANK)		
			end
		end
		
		itemValueWithdraw.pressEvent = function()
			if itemValueWithdraw.enabled then
				self:Withdraw(itemValueWithdraw)
			end
		end
		listWithdraw:AddItem(itemValueWithdraw)
	end

	self.ContextMenu.list:AddItem(self.itemBalance)
	self.ContextMenu.list:AddItem(itemWithdraw)
	self.ContextMenu.list:AddItem(itemDeposit)
end


function Bank:Deposit(itemValueDeposit)
	local value = itemValueDeposit.data.value
	Network:Send("Deposit", value)
	if LocalPlayer:GetMoney() - value < value  then
		itemValueDeposit.enabled = false
	end
end


function Bank:Withdraw(itemValueWithdraw)
	local value = itemValueWithdraw.data.value
	Network:Send("Withdraw", value)
	if self.MoneyBank - value < value  then
		itemValueWithdraw.enabled = false
	end
end


function Bank:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("PLAYER_ENTER_BANK", {["en"] = "Press F to access the Bank.", ["pt"] = "Pressione F para acessar o Banco."})
	self.Languages:SetLanguage("TEXT_BANK", {["en"] = "BANK", ["pt"] = "BANCO"})
	self.Languages:SetLanguage("TEXT_BALANCE", {["en"] = "Balance", ["pt"] = "Saldo"})
	self.Languages:SetLanguage("TEXT_DATE", {["en"] = "Date", ["pt"] = "Data"})
	self.Languages:SetLanguage("TEXT_WITHDRAW", {["en"] = "Withdraw", ["pt"] = "Sacar"})
	self.Languages:SetLanguage("TEXT_DEPOSIT", {["en"] = "Deposit", ["pt"] = "Depositar"})
	self.Languages:SetLanguage("TEXT_NOT_ENOUGH_MONEY", {["en"] = "You do not have enough money!", ["pt"] = "Você não possui dinheiro suficiente!"})
	self.Languages:SetLanguage("TEXT_NOT_ENOUGH_MONEY_BANK", {["en"] = "You do not have enough money in the bank!", ["pt"] = "Você não possui dinheiro suficiente no banco!"})
	self.Languages:SetLanguage("TEXT_BALANCE_AVAILABLE", {["en"] = "Your available balance.", ["pt"] = "Seu saldo disponível."})
end


Bank = Bank()