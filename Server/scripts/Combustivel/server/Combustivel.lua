class 'Combustivel'

function Combustivel:__init()
	
	Network:Subscribe("SaveData", self, self.SaveData)
	Network:Subscribe("AbastecerRequest", self, self.AbastecerRequest)
	
	self.precoLitro = 2
	
	self.Languages = Languages()
	self:SetLanguages()
end


function Combustivel:SaveData(args, player)
	player:SetValue("Combustivel", args.combustivel)
end


function Combustivel:AbastecerRequest(args, player)
	local valor = self.precoLitro * args.litros
	if player:GetMoney() >= valor then
		player:SetMoney(player:GetMoney() - valor)
		Network:Send(player, "Abastecer", {litros = args.litros})
	else
		Events:Fire("AddInformationAlert", {player = player, data = {id = "PLAYER_INSUFFICIENT_MONEY", message = self.Languages.PLAYER_INSUFFICIENT_MONEY, duration = 5, priority = true}})
	end
end


function Combustivel:SetLanguages()
	self.Languages:SetLanguage("PLAYER_INSUFFICIENT_MONEY", {["en"] = "You do not have enough money.", ["pt"] = "Você não possui dinheiro suficiente."})
end

Combustivel = Combustivel()