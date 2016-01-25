class 'Languages'

function Languages:__init()
	
	self.language = "pt"
	self.alias = {
		["en"] = {
			["PLAYER_ENTER_FUEL_STATION"] = "Press F to fuel 10 liters.",
			["PLAYER_INSUFFICIENT_MONEY"] = "You do not have enough money.",
			["PLAYER_FUEL_TANK_FULL"] = "Your fuel tank is full."
		},
		
		["pt"] = {
			["PLAYER_ENTER_FUEL_STATION"] = "Pressione F para abastecer 10 litros.",
			["PLAYER_INSUFFICIENT_MONEY"] = "Você não possui dinheiro suficiente.",
			["PLAYER_FUEL_TANK_FULL"] = "O seu tanque de combustível está cheio."
		}
	}
	
	self:UpdateValues()
	Events:Subscribe("NetworkObjectValueChange", self, self.ObjectValueChange)
	Events:Subscribe("SharedObjectValueChange", self, self.ObjectValueChange)
end


function Languages:ObjectValueChange(args)
	if args.object == LocalPlayer and args.key == "Language" then
		self.language = LocalPlayer:GetValue("Language")
		self:UpdateValues()
	end
end


function Languages:UpdateValues()
	for key, word in pairs(self.alias[self.language]) do
		self[key] = word
	end
end