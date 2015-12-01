class 'Controls'

function Controls:__init()

	Events:Subscribe("MouseDown", self, self.MouseDown)
	Events:Subscribe("InputPoll", self, self.InputPoll)
	Events:Subscribe("GameLoad", self, self.GameLoad)

	self.mirar = false
end


function Controls:GameLoad(args)
	Game:FireEvent("ply.grappling.enable")
	Game:FireEvent("ply.parachute.disable")
end


function Controls:MouseDown(args)
	if (self:GetGameState() and args.button == 2 and not LocalPlayer:InVehicle()) then
		self.mirar = true
	end
end


function Controls:InputPoll(args)
	if self:GetGameState() then
		if self.mirar then
			Input:SetValue(Action.ShoulderCam, 1)
			self.mirar = false
		end
		if Key:IsDown(32) and LocalPlayer:InVehicle() then
			Input:SetValue(Action.Handbrake, 1)
		end
	end
end


function Controls:GetGameState()
	if(Game:GetState() != GUIState.PDA and Game:GetState() != GUIState.Loading and Game:GetState() != GUIState.Menu) then
		return true
	end
	return false
end


Controls = Controls()