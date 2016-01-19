class 'CustomChat'

function CustomChat:__init()
	
	Network:Subscribe("PlayerChat", self, self.PlayerChat)
end


function CustomChat:PlayerChat(args)
	
	Network:Broadcast("PlayerChat", args)
	Events:Fire("PlayerChat", args)
	Console:Print(tostring(args.player) .. ": ".. args.text)
end


CustomChat = CustomChat()