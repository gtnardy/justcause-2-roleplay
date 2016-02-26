class 'InformationAlert'

function InformationAlert:__init()
	
	self.textSize = 16
	self.margin = Vector2(10, 10)
	self.width = 360
	
	self.messages = {}
	self.timer = Timer()
	
	self.label = Label.Create()
	self:ConfigureLabel()
	
	Network:Subscribe("AddInformationAlert", self, self.AddInformationAlert)
	Events:Subscribe("AddInformationAlert", self, self.AddInformationAlert)
	
	Network:Subscribe("RemoveInformationAlert", self, self.RemoveInformationAlert)
	Events:Subscribe("RemoveInformationAlert", self, self.RemoveInformationAlert)	
	
	Events:Subscribe("PreTick", self, self.PreTick)
end


function InformationAlert:AddInformationAlert(args)
	self:AddMessage(args.id, args.message, args.duration, args.priority)
end


function InformationAlert:RemoveInformationAlert(args)
	self:RemoveMessage(args.id)
end


function InformationAlert:AddMessage(id, message, duration, priority)
	if id then
		for _, m in pairs(self.messages) do
			if m.id and m.id == id then
				table.remove(self.messages, _)
			end
		end
	end
	if priority then
		table.insert(self.messages, 1, {id = id, message = message, duration = duration})
	else
		table.insert(self.messages, {id = id, message = message, duration = duration})
	end
	self:NextMessage()
end


function InformationAlert:RemoveMessage(id)
	if id then
		for _, m in pairs(self.messages) do
			if m.id == id then
				table.remove(self.messages, _)
				break
			end
		end
	else
		id = self.messages[1].id
		table.remove(self.messages, 1)
	end
	self.label:Hide()
	self:NextMessage()
	Events:Fire("RemovedInformationAlert", {id = id})
end


function InformationAlert:NextMessage()
	if self.messages[1] then
		Render:SetFont(AssetLocation.Disk, "Archivo.ttf")
		self.label:SetText(self.messages[1].message)
		self.label:SetWidth(math.min(self.width, Render:GetTextWidth(self.messages[1].message, self.textSize)))
		self.label:SizeToContents()
		ClientSound.Play(AssetLocation.Game, {bank_id = 11, sound_id = 2, position = Camera:GetPosition(), angle = Angle(), timeout = 10, variable_id_focus = 0})
		Events:Fire("AddedInformationAlert", {id = self.messages[1].id})
	end
end


function InformationAlert:HasMessage()
	return self.messages[1]
end


function InformationAlert:ConfigureLabel()
	self.label:Hide()
	self.label:SetFont(AssetLocation.Disk, "Archivo.ttf")
	self.label:SetWrap(true)
	self.label:SetTextSize(self.textSize)
	self.label:Subscribe("PostRender", self, self.LabelPostRender)
end


function InformationAlert:LabelPostRender()
	self.label:Hide()
end


function InformationAlert:PreTick()
	if self.timer:GetSeconds() >= 1 then

		if self.messages[1] and self.messages[1].duration then
			self.messages[1].duration = self.messages[1].duration - 1
			
			if self.messages[1].duration <= 0 then
				self:RemoveMessage()
			end
		end
		self.timer:Restart()
	end
end


function InformationAlert:Render(position)
	if not self.messages[1] then return end

	self.label:Show()	
	self.label:SetPosition(position + self.margin)

	Render:FillArea(position, self.label:GetSize() + self.margin * 2, Color(0, 0, 0, 150))
end