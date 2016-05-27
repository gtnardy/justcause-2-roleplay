class 'JobDeliver'

function JobDeliver:__init()

	self.deliveries = {}
	
	Network:Subscribe("UpdateData", self, self.UpdateData)
end


function JobDeliver:UpdateData(args)
	self.deliveries = args.deliveries
	Events:Fire("UpdateDeliveries", self.deliveries)
end


JobDeliver = JobDeliver()