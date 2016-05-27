class 'AsyncRequest'

function AsyncRequest:__init()
	self.request = nil
end


function AsyncRequest:Request(name, params, func)
	self.request = Events:Subscribe(name .. "_RETURN", function(args)
		func(args)
		Events:Unsubscribe(self.request)
	end)
	Events:Fire(name, params)
end
