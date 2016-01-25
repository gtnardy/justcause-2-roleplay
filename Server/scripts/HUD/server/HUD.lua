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
	self.spots = SQL:Query("SELECT e.Id, e.Posicao, et.Spot, et.Descricao AS 'TipoDescricao', e.Nome, et.Raio FROM Estabelecimento e LEFT JOIN EstabelecimentoTipo et on e.Tipo = et.Id"):Execute()
end


hud = HUD()