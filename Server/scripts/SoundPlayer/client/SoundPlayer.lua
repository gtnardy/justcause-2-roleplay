class 'SoundPlayer'
function SoundPlayer:__init()
	self.archives = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,28,30,31,32,33,34,35,36,37,38,39,40,41,42}
	self.archiveContents = SoundArchives.LoadSounds()

	self.bankid = 0
	self.soundid = 0
	self.sound = nil
	self.window = nil
	self.textbox = nil
	self.sliders = nil

	self:LoadSound()
	self:CreateWindow()

	Events:Subscribe("ModuleUnload", self, self.Unload)
	Events:Subscribe("KeyDown" , self , self.KeyDown)
	print("Sound Player Loaded")
end

function SoundPlayer:KeyDown(args)
	if (args.key == 38) then
		if self.bankid == #self.archives - 1 then
			self.bankid = 0
		else
			self.bankid = self.bankid + 1
		end
		self.soundid = 0
	self:LoadSound()
	self:CreateWindow()
	end
	if (args.key == 40) then
		if self.bankid == 0 then
			self.bankid = #self.archives - 1
		else
			self.bankid = self.bankid - 1
		end
		self.soundid = 0
	self:LoadSound()
	self:CreateWindow()
	end
	if (args.key == 37) then
		if self.soundid == 0 then
			self.soundid = #self.archiveContents[self.bankid + 1] - 1
		else
			self.soundid = self.soundid - 1
		end
	self:LoadSound()
	self:CreateWindow()
	end
	if (args.key == 39) then
		if self.soundid == #self.archiveContents[self.bankid + 1] - 1 then
			self.soundid = 0
		else
			self.soundid = self.soundid + 1
		end
	self:LoadSound()
	self:CreateWindow()
	end
	return false
end

function SoundPlayer:LoadSound()
	if self.sound ~= nil then
		self.sound:Remove()
		self.sound = nil
		self:LoadSound()
	else
		self.sound = ClientSound.Create(AssetLocation.Game, {
			bank_id = tonumber(self.archives[self.bankid + 1]),
			sound_id = tonumber(self.archiveContents[self.bankid + 1][self.soundid + 1].index),
			position = LocalPlayer:GetPosition(),
			angle = Angle()
		})
	end
end

function SoundPlayer:CreateWindow()
	if self.window ~= nil then
		self.textbox:Remove()
		self.window:Remove()
	end
	Mouse:SetVisible(true)

	self.window = Window.Create()
	self.window:SetSize( Vector2(Render.Width, 400 ) )
	self.window:SetPosition(Vector2(2,Render.Height))
	self.window:SetTitle( "Sound Settings" )
	self.window:SetVisible(true)

	local label = Label.Create(self.window)
	label:SetPosition(Vector2(0,0))
	label:SetText("BankId: " .. tostring(self.archives[self.bankid + 1]) .. "/42")
	label:SizeToContents()
	local label = Label.Create(self.window)
	label:SetPosition(Vector2(0,24))
	label:SetText("SoundId: " .. tostring(self.archiveContents[self.bankid + 1][self.soundid + 1].index) .. " / " .. tostring(#self.archiveContents[self.bankid + 1] - 1))
	label:SizeToContents()
	local label = Label.Create(self.window)
	label:SetPosition(Vector2(0,48))
	label:SetText("Sound Name: " .. self.archiveContents[self.bankid + 1][self.soundid + 1].name)
	label:SizeToContents()
	local label = Label.Create(self.window)
	label:SetPosition(Vector2(0,344))
	label:SetText("  Up / Down to change Bank \nLeft / Right to change Sound")
	label:SizeToContents()
	local label = Label.Create(self.window)
	label:SetPosition(Vector2(self.window:GetSize().x - 75,self.window:GetSize().y - 45))
	label:SetText("By Patawic")
	label:SizeToContents()

	self.sliders = nil
	self.sliders = {}
	for index=1, #self.archiveContents[self.bankid + 1][self.soundid + 1].parameters, 1 do
		local label = Label.Create(self.window)
		label:SetPosition(Vector2(240,50 * index - 30))
		label:SetText	("Index: " .. self.archiveContents[self.bankid + 1][self.soundid + 1].parameters[index].index .. "\n" .. 
						 "Name: " .. self.archiveContents[self.bankid + 1][self.soundid + 1].parameters[index].name
						)
		label:SizeToContents()


		local label = Label.Create(self.window)
		label:SetPosition(Vector2(375,50 * index - 18))
		label:SetText(tostring(self.archiveContents[self.bankid + 1][self.soundid + 1].parameters[index].min))
		label:SizeToContents()

		local slider = HorizontalSlider.Create(self.window)
		slider:SetPosition(Vector2(400,50 * index - 30))
		slider:SetWidth(200) 
		slider:SetHeight(36)
		slider:SetRange(tonumber(self.archiveContents[self.bankid + 1][self.soundid + 1].parameters[index].min), tonumber(self.archiveContents[self.bankid + 1][self.soundid + 1].parameters[index].max))
		slider:SetName(self.archiveContents[self.bankid + 1][self.soundid + 1].parameters[index].name .. "|" .. self.archiveContents[self.bankid + 1][self.soundid + 1].parameters[index].index)
		if self.archiveContents[self.bankid + 1][self.soundid + 1].parameters[index].name == "focus" or self.archiveContents[self.bankid + 1][self.soundid + 1].parameters[index].name == "Focus" then
			slider:SetValue(0.75)
			self:UpdateSound(slider)
		end
		slider:Subscribe("ValueChanged", self, self.UpdateSound)
		table.insert(self.sliders, slider)

		local label = Label.Create(self.window)
		label:SetPosition(Vector2(610,50 * index - 18))
		label:SetText(tostring(self.archiveContents[self.bankid + 1][self.soundid + 1].parameters[index].max))
		label:SizeToContents()
	end
	local button = Button.Create(self.window)
	button:SetPosition(Vector2(10, 125))
	button:SetSize(Vector2(150,75))
	button:SetText("Replay Sound")
	button:Subscribe("Press", function() self:LoadSound() self:UpdateSounds(self.sliders) end)
	--TextBox
	self.textbox = TextBox.Create(self.window)
	self.textbox:SetPosition(Vector2(650, 30))
	self.textbox:SetSize(Vector2(350,300))
	self.textbox:SetAlignment(bit32.bor(GwenPosition.Top, GwenPosition.Left))
	local slidertext = ""
	for index, slider in pairs(self.sliders) do
		local name = slider:GetName():split("|")
		slidertext = slidertext .. "sound:SetParameter(".. name[2] .. ",".. tostring(slider:GetValue()) .. ")\n"
	end
	self.textbox:SetText(
					"local sound = ClientSound.Create(AssetLocation.Game, {\n"..
					"			bank_id = " .. self.archives[self.bankid + 1] .. ",\n"..
					"			sound_id = " .. self.archiveContents[self.bankid + 1][self.soundid + 1].index .. ",\n"..
					"			position = LocalPlayer:GetPosition(),\n"..
					"			angle = Angle()\n"..
					"})\n\n"..
					slidertext
					)

end
function SoundPlayer:UpdateTextBox()
	if self.textbox == nil then return end
	local slidertext = ""
	for index, slider in pairs(self.sliders) do
		local name = slider:GetName():split("|")
		slidertext = slidertext .. "sound:SetParameter(".. name[2] .. ",".. tostring(slider:GetValue()) .. ")\n"
	end
	self.textbox:SetText(
					"local sound = ClientSound.Create(AssetLocation.Game, {\n"..
					"			bank_id = " .. self.archives[self.bankid + 1] .. ",\n"..
					"			sound_id = " .. self.archiveContents[self.bankid + 1][self.soundid + 1].index .. ",\n"..
					"			position = LocalPlayer:GetPosition(),\n"..
					"			angle = Angle()\n"..
					"})\n\n" .. 
					slidertext
					)
end
function SoundPlayer:UpdateSounds(table)
	for index, slider in pairs(table) do
		self:UpdateSound(slider)
	end
end
function SoundPlayer:UpdateSound(slider)
	if self.sound ~= nil then
		local name = slider:GetName():split("|")
		self.sound:SetParameter(tonumber(name[2]),slider:GetValue())
	end
	self:UpdateTextBox()
end


function SoundPlayer:Unload(args)
	if self.sound ~= nil then
		self.sound:Remove()
	end
end
test = SoundPlayer()

