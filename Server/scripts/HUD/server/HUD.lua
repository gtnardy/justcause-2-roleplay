class 'HUD'

function HUD:__init()

	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	
	self.spots = {}
end


function HUD:ClientModuleLoad(args)
	
	Network:Send(args.player, "AtualizarSpots", {spots = self.spots})
end


function HUD:ModuleLoad()
	self.spots = SQL:Query("SELECT e.Id, e.Position, et.Spot, et.Description AS 'DescriptionType', e.Name, et.Radius FROM Establishment e LEFT JOIN EstablishmentType et on e.Type = et.Id"):Execute()
end


hud = HUD()