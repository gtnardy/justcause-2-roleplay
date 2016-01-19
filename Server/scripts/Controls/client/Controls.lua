class 'Controls'

function Controls:__init()

	Events:Subscribe("MouseDown", self, self.MouseDown)
	Events:Subscribe("InputPoll", self, self.InputPoll)
	Events:Subscribe("GameLoad", self, self.GameLoad)
	Events:Subscribe("CalcView", self, self.CalcView)
	Events:Subscribe("Render", self, self.Render)

	self.mirar = false
	self.imageReticle = Image.Create(AssetLocation.Resource, "Sniper_Reticle")
	
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


function Controls:CalcView()
	if Camera:GetFOV() >= 0.69 then
		Camera:SetFOV(0.9)
	end
end


function Controls:Render()

	if Camera:GetFOV() < 0.3 then
		self.imageReticle:SetSize(Render.Size)
		self.imageReticle:Draw()
		
		-- local barWidth = Render.Width * 232 / 1920
		-- local fovBar  = (math.ceil((Camera:GetFOV() - 0.05) * 100)/100) * 5 * barWidth
		-- Render:FillArea(Render.Size / 2 + Vector2(-(Render.Width * 140 / 1920) + fovBar, Render.Height * 218 / 1080), Vector2(1, 20), Color.Red)

	else
		-- Crosshair
		if LocalPlayer:GetUpperBodyState() ==  AnimationState.UbSAiming or LocalPlayer:GetBaseState() == AnimationState.SIdleFixedMg or LocalPlayer:GetBaseState() == AnimationState.SIdleVehicleMg then
			Render:FillCircle(Render.Size / 2, 2, Color(255, 255, 255, 125))
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