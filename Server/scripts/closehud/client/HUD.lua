class 'HUD'

function HUD:__init()
	

	Events:Subscribe("Render", self, self.Render) 
end



function HUD:Render()

	
	Game:FireEvent("gui.minimap.hide")
	Game:FireEvent("gui.hud.hide")
	


end


hud = HUD()