class 'Combustivel'

function Combustivel:__init()

	self.Combustivel = nil
	
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("NetworkObjectValueChange", self, self.NetworkObjectValueChange)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)	
	Events:Subscribe("LocalPlayerExitSpot", self, self.LocalPlayerExitSpot)
	Events:Subscribe("LocalPlayerEnterSpot", self, self.LocalPlayerEnterSpot)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	
	Network:Subscribe("Abastecer", self, self.Abastecer)
	
	self.timer = Timer()
	self.timerUpdate = Timer()
	self.timerSave = Timer()
	self.timerKey = Timer()
	
	self.noPosto = false
	self.precoLitro = 2
	self.quantidadeLitros = 10
	
	self.Languages = nil
end


function Combustivel:LocalPlayerEnterSpot(args)
	if args.spotType == "Fuel_Spot" then
		self.noPosto = true
		Events:Fire("AddInformationAlert", {id = "PLAYER_ENTER_FUEL_STATION", message = self.Languages.PLAYER_ENTER_FUEL_STATION, priority = true})
	end
end


function Combustivel:LocalPlayerExitSpot(args)
	if args.spotType == "Fuel_Spot" then
		self.noPosto = false
		Events:Fire("RemoveInformationAlert", {id = "PLAYER_ENTER_FUEL_STATION"})
	end
end


function Combustivel:KeyUp(args)
	if not self.noPosto then return end
	
	if args.key == string.byte("F") then
		self:AbastecerRequest()
	end
end


function Combustivel:AbastecerRequest()
	if self.Combustivel < 99 then
		local litros = math.floor(math.min(100 - self.Combustivel, self.quantidadeLitros))
		if LocalPlayer:GetMoney() > self.precoLitro * litros then
			Network:Send("AbastecerRequest", {litros = litros})
		else
			Events:Fire("AddInformationAlert", {id = "PLAYER_INSUFFICIENT_MONEY", message = self.Languages.PLAYER_INSUFFICIENT_MONEY, duration = 5, priority = true})
		end
	else
		Events:Fire("AddInformationAlert", {id = "PLAYER_FUEL_TANK_FULL", message = self.Languages.PLAYER_FUEL_TANK_FULL, duration = 5, priority = true})
	end
end


function Combustivel:Abastecer(args)
	self.Combustivel = math.min(self.Combustivel + args.litros, 100)
	LocalPlayer:SetValue("Combustivel", self.Combustivel)
	Events:Fire("UpdateDataHUD", "Combustivel")
end


function Combustivel:ModuleUnload()
	Events:Fire("RemoveInformationAlert", {id = "PLAYER_ENTER_FUEL_STATION"})
	self:SaveData()
end


function Combustivel:ModuleLoad()
	self.Languages = Languages()
	self.Combustivel = LocalPlayer:GetValue("Combustivel")
end


function Combustivel:NetworkObjectValueChange(args)	
	if args.object == LocalPlayer and args.key == "Combustivel" then
		self.Combustivel = args.value
	end
end


function Combustivel:PostTick()
	if self.timerSave:GetSeconds() > 60 then
		self:SaveData()
	end
	
	if not self.Combustivel or not (LocalPlayer:InVehicle() and LocalPlayer:GetVehicle():GetDriver() == LocalPlayer) then return end

	if self.timer:GetSeconds() > 1 then
	
		self.timer:Restart()
	
		self.Combustivel = math.max(self.Combustivel - self:GetGasto(), 0)

		if self.Combustivel <= 0 then
			self:SemCombustivel()
		end
	end
	
	if self.timerUpdate:GetSeconds() > 5 then
		self.timerUpdate:Restart()
		LocalPlayer:SetValue("Combustivel", self.Combustivel)
	end
end


function Combustivel:LocalPlayerInput(args)
	if (self.Combustivel and self.Combustivel <= 0 and (args.input == Action.Reverse or args.input == Action.Accelerate or args.input == Action.PlaneIncTrust or args.input == Action.HeliIncAltitude or args.input == Action.HeliForward)) then
		return false
	end
end


function Combustivel:GetGasto()

	local vehicle = LocalPlayer:GetVehicle()
	local class = vehicle:GetClass()
	if class == VehicleClass.Air or class == VehicleClass.Sea then
		local velocidade = math.ceil(math.abs(-(-LocalPlayer:GetVehicle():GetAngle() * LocalPlayer:GetVehicle():GetLinearVelocity()).z))
		return math.floor(velocidade / 500)
	else
		local torque = math.max(math.floor(vehicle:GetTorque()), 0)
		return math.floor(math.pow(torque, 0.25)*100) / 5000 + 0.02
	end
	
	return 0.05
end


function Combustivel:SemCombustivel()
	
end



function Combustivel:SaveData()
	Network:Send("SaveData", {combustivel = self.Combustivel})
	self.timerSave:Restart()
end

Combustivel = Combustivel()