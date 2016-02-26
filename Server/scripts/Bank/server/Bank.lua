class 'Bank'

function Bank:__init()
	Network:Subscribe("Deposit", self, self.Deposit)
	Network:Subscribe("Withdraw", self, self.Withdraw)
end


function Bank:Deposit(value, player)
	local money = player:GetMoney()
	if money >= value then
		local command = SQL:Command("UPDATE Player SET DinheiroBanco = DinheiroBanco + ? WHERE Id = ?")
		command:Bind(1, value)
		command:Bind(2, player:GetSteamId().id)
		command:Execute()
		
		player:SetNetworkValue("MoneyBank", self:GetMoneyBank(player))
		player:SetMoney(money - value)
	end
end


function Bank:Withdraw(value, player)
	local moneyBank = self:GetMoneyBank(player)
	if moneyBank >= value then
		local command = SQL:Command("UPDATE Player SET DinheiroBanco = DinheiroBanco - ? WHERE Id = ?")
		command:Bind(1, value)
		command:Bind(2, player:GetSteamId().id)
		command:Execute()
		
		player:SetNetworkValue("MoneyBank", self:GetMoneyBank(player))
		player:SetMoney(player:GetMoney() + value)
	end
end


function Bank:GetMoneyBank(player)
	local query = SQL:Query("SELECT DinheiroBanco FROM Player WHERE Id = ?")
	query:Bind(1, player:GetSteamId().id)
	return tonumber(query:Execute()[1].DinheiroBanco)
end


Bank = Bank()