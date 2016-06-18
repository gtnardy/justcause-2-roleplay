class("ScreenMapa")(Tela)

function ScreenMapa:__init()
	
	self:SetLanguages()
	
	self.spots = {}
	
	self.nome = self.Languages.LABEL_MAP
	self.Map = Map()
	self.Map.active = false
end


function ScreenMapa:SetSpots(spots)
	self.spots = spots
	self.Map.spots = self.spots
end


function ScreenMapa:Render()
	self.Map:Render()
end


function ScreenMapa:SetActive(bool)
	self.Map:SetActive(bool)
end


function ScreenMapa:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("LABEL_MAP", {["en"] = "Map", ["pt"] = "Mapa"})
end