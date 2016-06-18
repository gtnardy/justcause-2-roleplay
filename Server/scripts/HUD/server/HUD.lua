class 'HUD'

function HUD:__init()

	Network:Subscribe("RequestAtualizarSpots", self, self.RequestAtualizarSpots)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("UpdateSpots", self, self.UpdateSpots)
	
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


function HUD:UpdateSpots()
	self:ModuleLoad()
	self:AtualizarSpots()
end


function HUD:ModuleLoad()
	self.spots = SQL:Query("SELECT e.Id, e.Position, et.Spot, e.Name, et.Radius, c.IsFactory, c.Value, c.IdEstablishment AS 'IdCompany', c.IdOwner, p.Nome AS 'Owner', c.Production FROM Establishment e LEFT JOIN EstablishmentType et ON e.Type = et.Id LEFT JOIN Company c ON e.Id = c.IdEstablishment LEFT JOIN Player p ON c.IdOwner = p.Id"):Execute()
end


hud = HUD()