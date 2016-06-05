class 'Objective'

function Objective:__init()
	
	self.textSize = 24
	self.texts = nil--{} -- {text, color}
	self.textLenght = 0
	self.WaypointScreen = nil
	self.dynamicPosition = nil
	self.removeOnEnter = false
	
	Events:Subscribe("RemoveObjective", self, self.RemoveObjective)
	Events:Subscribe("SetObjective", self, self.SetObjective)
	
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
end


function Objective:ModuleUnload()
	LocalPlayer:SetValue("Objective", false)
end


function Objective:RemoveObjective()
	self.WaypointScreen = nil
	self.texts = nil
	self.textLenght = 0
	self.dynamicPosition = nil
	LocalPlayer:SetValue("Objective", false)
end


function Objective:SetObjective(args)
	self:RemoveObjective()
	self.texts = args.texts
	Render:SetFont(AssetLocation.Disk, "archivo.ttf")
	
	local name = ""
	for _, text in pairs(self.texts) do
		self.textLenght = self.textLenght + Render:GetTextWidth(text.text, self.textSize)
		name = name .. text.text
	end
	
	if args.dynamicPosition then
		self.dynamicPosition = args.dynamicPosition
	end
	
	self.removeOnEnter = args.removeOnEnter
	
	if args.position then
		self.WaypointScreen = WaypointScreen(args)
	end
	LocalPlayer:SetValue("Objective", {dynamicPosition = args.dynamicPosition, position = args.position, name = name, color = args.color})
end


function Objective:Render(position)
	if not self.texts then return end
	position.y = position.y - Render:GetTextHeight("@", self.textSize)
	position.x = position.x - self.textLenght / 2
	
	for _, text in pairs(self.texts) do
		Render:DrawText(position + Vector2.One, text.text, Color(0, 0, 0, 150), self.textSize)
		Render:DrawText(position, text.text, text.color, self.textSize)
		position.x = position.x + Render:GetTextWidth(text.text, self.textSize)
	end	
	
	if self.WaypointScreen then
		if self.dynamicPosition then
			self.WaypointScreen.position = self.dynamicPosition:GetPosition()
		end
		self.WaypointScreen:Render()
	end
	
	if self.removeOnEnter and Vector3.Distance(LocalPlayer:GetPosition(), self.WaypointScreen.position) < 5 then
		self:RemoveObjective()
	end
end