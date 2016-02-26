class 'FeedingList'

function FeedingList:__init()
	
	self:SetLanguages()
	
	self["FOOD"] = {
		[1] = {value = 1000, name = self.Languages.WATER_BOTTLE, hunger = 10, thirst = 30},
		[2] = {value = 1000, name = self.Languages.WATER_BOTTLE, hunger = 10, thirst = 30},
	}

end


function FeedingList:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("WATER_BOTTLE", {["en"] = "Water Bottle", ["pt"] = "Garrafa de Água"})
end