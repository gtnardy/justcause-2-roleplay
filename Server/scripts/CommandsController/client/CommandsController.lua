class 'CommandsConstroller'

function CommandsConstroller:__init()

	Events:Subscribe("LocalPlayerChat", self, self.LocalPlayerChat)
end

function CommandsConstroller:LocalPlayerChat(args)
	
	if args.text == "/pos" then
		Chat:Print(tostring(LocalPlayer:GetPosition()), Color(255, 255, 255))
	end
end

CommandsConstroller = CommandsConstroller()