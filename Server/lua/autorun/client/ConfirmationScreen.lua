class 'ConfirmationScreenText'

function ConfirmationScreenText:__init(args)

	self.active = false
	self.margin = Vector2(14, 12)
	self.size = Vector2(620, 80)
	self.text = args.text
	self.GUIStateObject = SharedObject.Create("GUIState")
	self.limitCharacteres = args.limitCharacteres and args.limitCharacteres or 30
	
	self.timer = Timer()
	self.confirmEvent = function() end
	
	self.TextBox = TextBox.Create()
	self:ConfigureTextBox()
	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
end


function ConfirmationScreenText:ConfigureTextBox()
	self.TextBox:SetVisible(false)
	self.TextBox:SetFont(AssetLocation.Disk, "Archivo.ttf")
	self.TextBox:SetTextSize(18)
	self.TextBox:SetPosition(Render.Size / 2 - self.size / 2 + Vector2(self.margin.x, self.size.y - self.margin.y - 30))
	self.TextBox:SetSize(Vector2(self.size.x - self.margin.x * 2, 30))
	self.TextBox:Subscribe("TextChanged", self, self.TextChanged)
	self.TextBox:Subscribe("ReturnPressed", self, self.Confirm)
end


function ConfirmationScreenText:TextChanged()
	if self.TextBox:GetTextLength() > self.limitCharacteres then
		self.TextBox:SetText(self.TextBox:GetText():sub(1, self.limitCharacteres))
	end
end


function ConfirmationScreenText:Confirm()
	if self.timer:GetSeconds() > 1 then
		self.confirmEvent()
		self:SetActive(false)
	end
end


function ConfirmationScreenText:Render()
	
	if not self.active then return end
	
	Render:SetFont(AssetLocation.Disk, "Archivo.ttf")
	self.TextBox:Focus()
	
	-- Content
	local position = Render.Size / 2 - self.size / 2
	Render:FillArea(position, self.size, Color(0, 0, 0, 175))
	
	-- Text
	Render:DrawText(position + self.margin, self.text, Color.White)
end


function ConfirmationScreenText:SetActive(bool)
	self.timer:Restart()
	self.GUIStateObject:SetValue(tostring(GUIState.ConfirmationScreen), bool)
	self.active = bool
	self.TextBox:SetVisible(bool)
	self.TextBox:Focus()
end


function ConfirmationScreenText:ModuleUnload()
	self.GUIStateObject:SetValue(tostring(GUIState.ConfirmationScreen), false)
end