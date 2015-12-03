class 'UsuarioController'

function UsuarioController:__init()

	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
end

function UsuarioController:PlayerJoin(args)
	
	Chat:Broadcast(tostring(args.player) .. " entrou no servidor.", Color(255, 255, 255))
end

UsuarioController = UsuarioController()