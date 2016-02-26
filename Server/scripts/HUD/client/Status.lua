class 'Status'

function Status:__init()

	self.Fome = 100
	self.Sede = 100
	self.Combustivel = 100
	
	Events:Subscribe("UpdateDataStatus", self, self.UpdateData)
	Events:Subscribe("ModulesLoad", self, self.UpdateData)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("UpdateDataHUD", self, self.UpdateDataHUD)
	
	self.timer = Timer()
end


function Status:UpdateData()
	if (LocalPlayer:GetValue("Fome") and LocalPlayer:GetValue("Sede") and LocalPlayer:GetValue("Combustivel")) then
		self.Fome = LocalPlayer:GetValue("Fome")
		self.Sede = LocalPlayer:GetValue("Sede")
		self.Combustivel = LocalPlayer:GetValue("Combustivel")
	end
end


function Status:PostTick()
	if self.timer:GetSeconds() > 5 then
		self:UpdateData()
		self.timer:Restart()
	end
end


function Status:UpdateDataHUD(status)
	if not self[status] then return end
	self[status] = LocalPlayer:GetValue(status)
end


function Status:Render(position, size, languages)
	if self.Fome and self.Sede and self.Combustivel then
		position.y = position.y + 2
		
		-- Fome
		self:DrawBlock(position, size, languages.LABEL_HUNGER, Color(241, 196, 15), self.Fome, 1)
		
		-- Sede
		self:DrawBlock(position, size, languages.LABEL_THIRST, Color(52, 152, 219), self.Sede, 2)
		
		-- Gasolina
		if LocalPlayer:InVehicle() and LocalPlayer:GetVehicle():GetDriver() == LocalPlayer then
			self:DrawBlock(position, size, languages.LABEL_FUEL, Color(230, 126, 34), self.Combustivel, 3)
		end
	end
end


function Status:DrawBlock(position, size, text, color, bar, pos)

	local margin = Vector2(2, 2)
	local sizeBar = Vector2(size.x - margin.x * 2, 7)
	
	position = Vector2(position.x, position.y - (size.y + margin.y) * pos)
	Render:FillArea(position, size, Color(0, 0, 0, 100))
	
	Render:DrawText(position + margin, text, Color(255, 255, 255, 200), 12)
	
	local sizeBarFome = bar / 100 * sizeBar.x
	if bar <= 0 then
		color = Color(255, 40, 10, 100)
	else
		color.a = 50
	end
	
	Render:FillArea(position + Vector2(margin.x, size.y - margin.y - sizeBar.y), sizeBar, color)
	color.a = 150
	Render:FillArea(position + Vector2(margin.x, size.y - margin.y - sizeBar.y), Vector2(sizeBarFome, sizeBar.y), color)
	
end