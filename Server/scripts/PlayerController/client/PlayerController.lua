class 'PlayerController'

function PlayerController:__init()
	
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	Events:Subscribe("PlayerQuit", self, self.PlayerQuit)
end


function PlayerController:PlayerJoin(args)
	Events:Fire("AddNotificationAlert", {message = tostring(args.player) .. " entrou no servidor!"})
end


function PlayerController:PlayerQuit(args)
	Events:Fire("AddNotificationAlert", {message = tostring(args.player) .. " saiu do servidor!"})
end


PlayerController = PlayerController()