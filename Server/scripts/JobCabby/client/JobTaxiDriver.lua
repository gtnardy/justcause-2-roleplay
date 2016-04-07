class 'JobTaxiDriver'

function JobTaxiDriver:__init()
	
	self.taximeterOn = false
	self.distance = 0
	self.PRICE_KM = 5
	
	self.timer = Timer()
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("LocalPlayerEnterVehicle", self, self.LocalPlayerEnterVehicle)
	Events:Subscribe("LocalPlayerExitVehicle", self, self.LocalPlayerExitVehicle)
end


function JobTaxiDriver:LocalPlayerEnterVehicle(args)
	if args.is_driver then
		if LocalPlayer:GetJob() == 2 then
			self:EnteredTaxiAsDriver()
		end
	else
		local driver = args.vehicle:GetDriver()
		if driver:GetJob() == 2 then
			self:EnteredTaxiAsPassgenger(driver)
		end
	end
end


function JobTaxiDriver:LocalPlayerExitVehicle(args)

end


function JobTaxiDriver:EnteredTaxiAsPassgenger(taxiDriver)
	
end


function JobTaxiDriver:EnteredTaxiAsDriver()
	
end


function JobTaxiDriver:Render()
	if not self.taximeterOn then return end
end


function JobTaxiDriver:PostTick()
	if not self.taximeterOn then return end

	if self.timer:GetSeconds() >= 1 then
		local vehicle = LocalPlayer:GetVehicle()
		if not vehicle then break end
		
		self.distance = self.distance + vehicle:GetLinearVelocity():Length()
		
		self.timer:Restart()
	end
end


function JobTaxiDriver:TaximeterOn()
	self.distance = 0
	
	self.taximeterOn = true
end


function JobTaxiDriver:TaximeterOff()
	self.distance = 0
	self.taximeterOn = false
	Network:Send("TaximeterOff", {})
end


JobTaxiDriver = JobTaxiDriver()