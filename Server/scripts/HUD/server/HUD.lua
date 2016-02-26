class 'HUD'

function HUD:__init()

	Network:Subscribe("RequestAtualizarSpots", self, self.RequestAtualizarSpots)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("AtualizarSpots", self, self.AtualizarSpots)
	
	self.spots = {}
end


function HUD:AtualizarSpots()
	for player in Server:GetPlayers() do
		Network:Send(player, "AtualizarSpots", {spots = self.spots})
	end
end


function HUD:RequestAtualizarSpots(args, player)
	Network:Send(player, "AtualizarSpots", {spots = self.spots})
end


function HUD:ModuleLoad()
	self.spots = SQL:Query("SELECT e.Id, e.Position, et.Spot, e.Name, et.Radius FROM Establishment e LEFT JOIN EstablishmentType et on e.Type = et.Id"):Execute()
end


hud = HUD()