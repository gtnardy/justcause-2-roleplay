class 'Languages'

function Languages:__init()
	
	self.language = "pt"
	self.alias = {
		["en"] = {
			["PLAYER_STARVING"] = "You are starving!",
			["PLAYER_DYING_THIRST"] = "You are dying of thirst!",
			["PLAYER_OUT_FUEL"] = "You are out of fuel!",
			["LABEL_HUNGER"] = "Hunger",
			["LABEL_THIRST"] = "Thirst",
			["LABEL_FUEL"] = "Fuel"		
		},
		
		["pt"] = {
			["PLAYER_STARVING"] = "Você está morrendo de Fome!",
			["PLAYER_DYING_THIRST"] = "Você está morrendo de Sede!",
			["PLAYER_OUT_FUEL"] = "Você está sem combustível!",
			["LABEL_HUNGER"] = "Fome",
			["LABEL_THIRST"] = "Sede",
			["LABEL_FUEL"] = "Combustivel"
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