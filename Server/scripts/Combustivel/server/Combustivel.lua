class 'Combustivel'

function Combustivel:__init()
	
	Network:Subscribe("SaveData", self, self.SaveData)
	Network:Subscribe("AbastecerRequest", self, self.AbastecerRequest)
	
	self.precoLitro = 2
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
		Console:Print("não")
	end
end


Combustivel = Combustivel()