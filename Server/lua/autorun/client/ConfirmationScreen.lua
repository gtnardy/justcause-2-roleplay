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



class 'ConfirmationScreenBoolean'

function ConfirmationScreenBoolean:__init(args)

	self.active = false
	self.margin = Vector2(14, 12)
	self.size = Vector2(620, 80)
	self.text = args.text
	self.GUIStateObject = SharedObject.Create("GUIState")
	
	self.timer = Timer()
	self.confirmEvent = function() end
	self.cancelEvent = function() end
	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	
	self.Languages = Languages()
	self.Languages:SetLanguage("TEXT_CONFIRM", {["en"] = "Confirm", ["pt"] = "Confirmar"})
	self.Languages:SetLanguage("TEXT_CANCEL", {["en"] = "Cancel", ["pt"] = "Cancelar"})
	self.Languages:SetLanguage("TEXT_ABREV_CONFIRM", {["en"] = "Y", ["pt"] = "S"})
end


function ConfirmationScreenBoolean:Confirm()
	if self.timer:GetSeconds() > 1 then
		self.confirmEvent()
		self:SetActive(false)
	end
end


function ConfirmationScreenBoolean:Cancel()
	self.cancelEvent()
	self:SetActive(false)
end


function ConfirmationScreenBoolean:KeyUp(args)
	if not self.active then return end
	if args.key == string.byte("S") or args.key == string.byte("Y") then
		self:Confirm()
	elseif args.key == string.byte("N") then
		self:Cancel()
	end
end


function ConfirmationScreenBoolean:Render()
	if not self.active then return end
	
	Render:SetFont(AssetLocation.Disk, "Archivo.ttf")
	
	-- Content
	local position = Render.Size / 2 - self.size / 2
	Render:FillArea(position, self.size, Color(0, 0, 0, 175))
	
	-- Text
	Render:DrawText(position + Vector2(self.size.x / 2 - Render:GetTextWidth(self.text) / 2, self.margin.y), self.text, Color.White)
	
	-- Text Confirm
	local textConfirm = self.Languages.TEXT_CONFIRM .. " (" .. self.Languages.TEXT_ABREV_CONFIRM .. ")"
	Render:DrawText(position + Vector2(self.margin.x * 5, self.size.y - Render:GetTextHeight(textConfirm) - self.margin.y), textConfirm, Color.White)
	
	-- Text Cancel
	local textCancel = "(N) " .. self.Languages.TEXT_CANCEL
	Render:DrawText(position + Vector2(self.size.x - self.margin.x * 5 - Render:GetTextWidth(textCancel), self.size.y - Render:GetTextHeight(textCancel) - self.margin.y), textCancel, Color.White)
end


function ConfirmationScreenBoolean:SetActive(bool)
	self.timer:Restart()
	self.GUIStateObject:SetValue(tostring(GUIState.ConfirmationScreen), bool)
	self.active = bool
end


function ConfirmationScreenBoolean:ModuleUnload()
	self.GUIStateObject:SetValue(tostring(GUIState.ConfirmationScreen), false)
end