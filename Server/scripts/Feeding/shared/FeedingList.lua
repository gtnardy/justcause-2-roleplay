class 'FeedingList'

function FeedingList:__init()
	
	self:SetLanguages()
	
	self["FOOD"] = {
		[1] = {value = 2, name = self.Languages.WATER_BOTTLE, hunger = 0, thirst = 30},
		[2] = {value = 4, name = self.Languages.SODA_CAN, hunger = 15, thirst = 15},
		[3] = {value = 5, name = self.Languages.COCONUT_WATER, hunger = 5, thirst = 40},
		[4] = {value = 3, name = self.Languages.BEER_CAN, hunger = 10, thirst = 20},
		[5] = {value = 5, name = self.Languages.JUICE_BOTTLE, hunger = 15, thirst = 30},
		[6] = {value = 3, name = self.Languages.CRISPS_BAG, hunger = 30, thirst = -10},
		[7] = {value = 5, name = self.Languages.CHOCOLATE_BAR, hunger = 40, thirst = -15},
		[8] = {value = 10, name = self.Languages.HAMBURGUER, hunger = 70, thirst = -20},
		[9] = {value = 8, name = self.Languages.FRENCH_FRIES, hunger = 60, thirst = -30},
		[10] = {value = 10, name = self.Languages.VODKA, hunger = 0, thirst = 20},
	}

end


function FeedingList:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("JUICE_BOTTLE", {["en"] = "Juice Bottle", ["pt"] = "Garrafa de Suco"})
	self.Languages:SetLanguage("WATER_BOTTLE", {["en"] = "Water Bottle", ["pt"] = "Garrafa de Água"})
	self.Languages:SetLanguage("SODA_CAN", {["en"] = "Soda Can", ["pt"] = "Lata de Refrigerante"})
	self.Languages:SetLanguage("BEER_CAN", {["en"] = "Beer Can", ["pt"] = "Lata de Cerveja"})
	self.Languages:SetLanguage("COCONUT_WATER", {["en"] = "Coconut Water", ["pt"] = "Água de Coco"})
	self.Languages:SetLanguage("CRISPS_BAG", {["en"] = "Crisps Bag", ["pt"] = "Salgadinho"})
	self.Languages:SetLanguage("CHOCOLATE_BAR", {["en"] = "Chocolate Bar", ["pt"] = "Barra de Chocolate"})
	self.Languages:SetLanguage("HAMBURGUER", {["en"] = "Hamburguer", ["pt"] = "Hamburguer"})
	self.Languages:SetLanguage("FRENCH_FRIES", {["en"] = "French Fries", ["pt"] = "Batatas Fritas"})
	self.Languages:SetLanguage("VODKA", {["en"] = "Vodka", ["pt"] = "Vodka"})
end