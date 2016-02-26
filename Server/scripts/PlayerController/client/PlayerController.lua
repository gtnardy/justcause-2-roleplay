class 'PlayerController'

function PlayerController:__init()
	
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	Events:Subscribe("PlayerQuit", self, self.PlayerQuit)
end


function PlayerController:PlayerJoin(args)
	Events:Fire("AddNotificationAlert", {message = args.player:GetCustomName() .. " entrou no servidor!"})
end


function PlayerController:PlayerQuit(args)
	Events:Fire("AddNotificationAlert", {message = args.player:GetCustomName() .. " saiu do servidor!"})
end


PlayerController = PlayerController()