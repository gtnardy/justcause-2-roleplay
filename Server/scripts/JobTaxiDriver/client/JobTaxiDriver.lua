class 'JobTaxiDriver'

function JobTaxiDriver:__init()
	
	self.PRICE_KM = 5
	
	self.requests = {}
	
	self.taximeterOn = false
	self.passenger = nil
	self.driver = nil
	self.distance = 0
	
	self.passengerWaiting = nil
	
	self.timer = Timer()
	Network:Subscribe("UpdateData", self, self.UpdateData)
	Network:Subscribe("PassengerEnteredTaxi", self, self.PassengerEnteredTaxi)
	Network:Subscribe("TaximeterOff", self, self.TaximeterOff)
	Network:Subscribe("TaximeterOn", self, self.TaximeterOn)
	Network:Subscribe("AcceptedTaxi", self, self.AcceptedTaxi)
	
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("LocalPlayerEnterVehicle", self, self.LocalPlayerEnterVehicle)
	Events:Subscribe("LocalPlayerExitVehicle", self, self.LocalPlayerExitVehicle)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("PlayerQuit", self, self.PlayerQuit)
	
	Events:Subscribe("CallTaxi", self, self.CallTaxi)
	Events:Subscribe("AcceptTaxi", self, self.AcceptTaxi)
end


function JobTaxiDriver:PlayerQuit(args)
	if self.passengerWaiting then
		if args.player == self.passengerWaiting then
			self:RemovePassengerWaiting(true)
		end
	end
end


function JobTaxiDriver:UpdateData(args)
	self.requests = args.requests
	Events:Fire("TaxiRequests", self.requests)
end


function JobTaxiDriver:AcceptedTaxi(args)
	self.passengerWaiting = args.player
	Events:Fire("SetObjective", {texts = {
									{text = self.Languages.TEXT_BRING .. " ", color = Color.White},
									{text = self.Languages.TEXT_PASSENGER, color = Color(206, 194, 105)},
									{text = ".", color = Color.White},
								},
								color = Color(206, 194, 105),
								name = self.passengerWaiting:GetCustomName(),
								position = self.passengerWaiting:GetPosition(),
								dynamicPosition = self.passengerWaiting,
				})
end


function JobTaxiDriver:AcceptTaxi(args)
	Network:Send("AcceptTaxi", args)
end


function JobTaxiDriver:RemovePassengerWaiting(announce)
	self.passengerWaiting = nil
	if announce then
		Events:Fire("AddNotificationAlert", {message = self.Languages.PASSENGER_WAITING_QUIT})
	end
	Events:Fire("RemoveObjective")
end


function JobTaxiDriver:CallTaxi()
	Network:Send("CallTaxi")
end


function JobTaxiDriver:LocalPlayerEnterVehicle(args)
	if args.vehicle:GetModelId() == 70 then
		if args.is_driver then
			if LocalPlayer:GetJob() == Jobs.TaxiDriver then
				self:EnteredTaxiAsDriver()
			end
		else
			local driver = args.vehicle:GetDriver()
			if driver:GetJob() == Jobs.TaxiDriver then
				self:EnteredTaxiAsPassgenger(driver)
			end
		end
	end
end


function JobTaxiDriver:LocalPlayerExitVehicle(args)
	if self.taximeterOn then
		self:TurnOffTaximeter()
	end
end


function JobTaxiDriver:EnteredTaxiAsPassgenger(taxiDriver)
	Network:Send("EnteredTaxiAsPassgenger", {driver = taxiDriver})
end


function JobTaxiDriver:PassengerEnteredTaxi(args)
	Chat:Print("passenger entered taxi", Color.Pink)
	Events:Fire("AddInformationAlert", {id = "PASSENGER_ENTERED_TAXI", message = self.Languages.PASSENGER_ENTERED_TAXI, priority = true})
	self.passenger = {player = args.passenger, steamId = args.passenger:GetSteamId().id}
end


function JobTaxiDriver:EnteredTaxiAsDriver()
	Events:Fire("AddNotificationAlert", {message = self.Languages.ENTERED_TAXI_AS_DRIVER})
end


function JobTaxiDriver:Render()
	if not self.taximeterOn then return end
	if Game:GetHUDHidden() then return end

	Render:SetFont(AssetLocation.Disk, "Archivo.ttf")

	local size = Vector2(200, 25)
	local pos = Vector2(310, Render.Height - 71)
	
	local textTaximeterValue = tostring(self.distance) .. " m"
	self:RenderRetangle(pos, size, self.Languages.LABEL_TAXIMETER, textTaximeterValue)
	
	local textValueValue = "R$ " .. tostring(math.floor(self.distance * self.PRICE_KM / 1000))
	self:RenderRetangle(pos, size, self.Languages.LABEL_VALUE, textValueValue)
		
	local textDriver = self.driver and self.Languages.LABEL_DRIVER or self.Languages.LABEL_PASSENGER
	local textDriverValue = "nil"
	if self.driver and self.driver.player then
		textDriverValue = tostring(self.driver.player)
	elseif self.passenger and self.passenger.player then
		textDriverValue = tostring(self.passenger.player)
	end
	self:RenderRetangle(pos, size, textDriver, textDriverValue)
	
end


function JobTaxiDriver:RenderRetangle(position, size, text, value)

	local margin = Vector2(5, 5)
	local textSize = 14
	
	Render:FillArea(position, size, Color(0, 0, 0, 100))
	Render:DrawText(position + margin, text, Color.White, textSize)
	Render:DrawText(position + Vector2(size.x - margin.x - Render:GetTextWidth(value, textSize), margin.y), value, Color.White, textSize)
	position.y = position.y - size.y - 2
end


function JobTaxiDriver:PostTick()
	if self.passengerWaiting then
		if Vector3.Distance(self.passengerWaiting:GetPosition(), LocalPlayer:GetPosition()) <= 10 then
			self:RemovePassengerWaiting(false)
		end
	end
	
	if not self.taximeterOn then return end

	if self.timer:GetSeconds() >= 1 then
		local vehicle = LocalPlayer:GetVehicle()
		if not vehicle then return end
		
		self.distance = self.distance + vehicle:GetLinearVelocity():Length()
		
		-- Verifying if the passenger or driver exists
		if self.passenger and (not self.passenger.player or not IsValid(self.passenger.player)) then
			Events:Fire("AddNotificationAlert", {message = self.Languages.PASSENGER_DISCONNECTED})
			self:TurnOffTaximeter()
		end
		if self.driver and (not self.driver.player or not IsValid(self.driver.player)) then
			Events:Fire("AddNotificationAlert", {message = self.Languages.DRIVER_DISCONNECTED})
			self:TurnOffTaximeter()
		end
		
		self.timer:Restart()
	end
end


function JobTaxiDriver:KeyUp(args)
	if args.key == string.byte("F") then
		if not self.taximeterOn and self.passenger then
			self:TaximeterOn()
		end
	end
end


function JobTaxiDriver:TaximeterOn(args)
	if self.passenger then
		Network:Send("TaximeterOn", {passenger = self.passenger, driver = LocalPlayer})
	else
		self.driver = {player = args.driver, steamId = args.driver:GetSteamId().id}
	end
	self.distance = 0
	self.taximeterOn = true
	Events:Fire("AddNotificationAlert", {message = self.Languages.TAXI_STARTED_RUN})
end


function JobTaxiDriver:TurnOffTaximeter()
	Network:Send("TaximeterOff", {driver = self.driver, passenger = self.passenger, distance = self.distance})
	self:TaximeterOff()
end


function JobTaxiDriver:TaximeterOff()
	local price = math.floor(self.PRICE_KM * self.distance / 1000)
	Events:Fire("AddNotificationAlert", {message = self.Languages.TAXI_FINISHED_RUN .. " " ..tostring(price) .. "."})
	self.distance = 0
	self.taximeterOn = false
	self.driver = nil
	self.passenger = nil
end


function JobTaxiDriver:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("TEXT_BRING", {["en"] = "Go bring the ", ["pt"] = "Vá buscar o "})
	self.Languages:SetLanguage("TEXT_PASSENGER", {["en"] = "passenger", ["pt"] = "passageiro"})
	self.Languages:SetLanguage("PASSENGER_ENTERED_TAXI", {["en"] = "A passenger has entered into your Taxi. Press F to start the run.", ["pt"] = "Um passageiro entrou em seu Taxi. Pressione F para iniciar a corrida."})
	self.Languages:SetLanguage("TAXI_STARTED_RUN", {["en"] = "The race has started! Exit the vehicle to finish him.", ["pt"] = "A corrida foi iniciada, saia do veículo para terminá-la."})
	self.Languages:SetLanguage("TAXI_FINISHED_RUN", {["en"] = "The race has finished! The value was R$ ", ["pt"] = "A corrida foi finalizada, o valor de foi R$"})
	self.Languages:SetLanguage("ENTERED_TAXI_AS_DRIVER", {["en"] = "You have entered into a taxi. Wait for a passenger to start the run.", ["pt"] = "Você entrou em um Taxi, espere por um passageiro para iniciar a corrida."})
	self.Languages:SetLanguage("DRIVER_DISCONNECTED", {["en"] = "The Taxi Driver has disconnected. The cost has paid.", ["pt"] = "O Taxista desconectou! O valor da corrida foi pago automaticamente."})
	self.Languages:SetLanguage("PASSENGER_DISCONNECTED", {["en"] = "Your passenger has disconnected. The cost has paid automaticaly.", ["pt"] = "Seu passageiro desconectou! O valor da corrida foi pago automaticamente."})
	self.Languages:SetLanguage("LABEL_TAXIMETER", {["en"] = "Taximeter", ["pt"] = "Taximetro"})
	self.Languages:SetLanguage("LABEL_VALUE", {["en"] = "Value", ["pt"] = "Valor"})
	self.Languages:SetLanguage("LABEL_DRIVER", {["en"] = "Driver", ["pt"] = "Motorista"})
	self.Languages:SetLanguage("LABEL_PASSENGER", {["en"] = "Passenger", ["pt"] = "Passageiro"})
	self.Languages:SetLanguage("PASSENGER_WAITING_QUIT", {["en"] = "The passenger quit the game.", ["pt"] = "O passageiro saiu do jogo."})
end


function JobTaxiDriver:ModuleLoad()
	self:SetLanguages()
end


JobTaxiDriver = JobTaxiDriver()