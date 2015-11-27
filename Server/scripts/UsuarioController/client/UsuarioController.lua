class 'UsuarioController'

function UsuarioController:__init()

	Events:Subscribe("", self, self.LocalPlayerChat)
end

function UsuarioController:LocalPlayerChat(args)
	
	if args.text == "/pos" then
		Chat:Print(tostring(LocalPlayer:GetPosition()), Color(255, 255, 255))
	end
end

UsuarioController = UsuarioController()