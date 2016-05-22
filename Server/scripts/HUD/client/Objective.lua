class 'Objective'

function Objective:__init()
	
	self.textSize = 24
	self.texts = nil--{} -- {text, color}
	self.textLenght = 0
	self.WaypointScreen = nil
	self.dynamicPosition = nil
	
	Events:Subscribe("RemoveObjective", self, self.RemoveObjective)
	Events:Subscribe("SetObjective", self, self.SetObjective)
end


function Objective:RemoveObjective()
	self.WaypointScreen = nil
	self.texts = nil
	self.textLenght = 0
	self.dynamicPosition = nil
end


function Objective:SetObjective(args)
	self:RemoveObjective()
	self.texts = args.texts
	Render:SetFont(AssetLocation.Disk, "archivo.ttf")
	for _, text in pairs(self.texts) do
		self.textLenght = self.textLenght + Render:GetTextWidth(text.text, self.textSize)
	end
	
	if args.dynamicPosition then
		self.dynamicPosition = args.dynamicPosition
	end
	
	if args.position then
		self.WaypointScreen = WaypointScreen(args)
	end
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
end