class 'DrivingSchool'

function DrivingSchool:__init()
	
	self.WorldTesting = World.Create()
	
	-- [PlayerId] = Vehicle
	self.playersTesting = {}
	
	Events:Subscribe("PlayerQuit", self, self.PlayerQuit)
	
	Network:Subscribe("StartTest", self, self.StartTest)
	Network:Subscribe("FailedTest", self, self.FailedTest)
	Network:Subscribe("FinishTest", self, self.FinishTest)
end



function DrivingSchool:PlayerQuit(args)
	self:ClearPlayer(args.player)
end


function DrivingSchool:ClearPlayer(player)
	player:SetWorld(DefaultWorld)
	local playerData = self.playersTesting[player:GetId()]
	if playerData then
		if IsValid(playerData.vehicle) then
			playerData.vehicle:Remove()
		end
		player:SetPosition(playerData.positionStarted)
	end
	player:SetNetworkValue("DrivingSchool", nil)
end


function DrivingSchool:StartTest(args, player)

	local position = player:GetPosition()
	player:SetWorld(self.WorldTesting)
	player:Teleport(args.startingPosition, args.startingAngle)
	
	local vehicle = Vehicle.Create({
		model_id = args.modelId,
		position = args.startingPosition,
		angle = args.startingAngle,
		tone1 = Color.White,
		tone2 = Color.White,
		world = self.WorldTesting,
	})
	
	player:EnterVehicle(vehicle, VehicleSeat.Driver)
	self.playersTesting[player:GetId()] = {vehicle = vehicle, positionStarted = position}
	
	player:SetNetworkValue("DrivingSchool", true)
end


function DrivingSchool:FailedTest(args, player)
	self:ClearPlayer(player)
end


function DrivingSchool:FinishTest(args, player)
	self:ClearPlayer(player)
	local command = SQL:Command("UPDATE Player SET License" .. args.license .. " = ? WHERE Id = ?")
	command:Bind(1, 1)
	command:Bind(2, player:GetSteamId().id)
	command:Execute()
	local licenses = player:GetLicenses()
	licenses[args.license] = true
	player:SetNetworkValue("Licenses", licenses)
end


DrivingSchool = DrivingSchool()