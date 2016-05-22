class 'NotificationAlert'

function NotificationAlert:__init()
	
	Events:Subscribe("AddNotificationAlert", self, self.AddNotificationAlert)
end


function NotificationAlert:AddNotificationAlert(args)
	Network:Send(args.player, "AddNotificationAlert", {message = args.message})
end

NotificationAlert = NotificationAlert()

