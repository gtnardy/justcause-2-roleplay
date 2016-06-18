class 'Objects'

function Objects:__init()

	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	self.light = ClientLight.Create({position = Vector3(-6325, 211, -3543), color = Color.White, multiplier = 2, radius = 10})
end


function Objects:Render()
	Render:DrawText(Vector2(10, 200), tostring(LocalPlayer:GetPosition()) .. " " .. tostring(LocalPlayer:GetAngle()) .. " " .. tostring(LocalPlayer:GetLinearVelocity()), Color.Pink)
end


function Objects:ModuleUnload()
	self.light:Remove()
end

Objects = Objects()