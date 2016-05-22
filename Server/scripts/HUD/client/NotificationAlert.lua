class 'NotificationAlert'

function NotificationAlert:__init()
	
	self.textSize = 14
	self.margin = Vector2(10, 10)
	
	self.duration = 20
	self.messages = {}
	self.timer = Timer()
	
	Network:Subscribe("AddNotificationAlert", self, self.AddNotificationAlert)
	Events:Subscribe("AddNotificationAlert", self, self.AddNotificationAlert)
	Events:Subscribe("PostTick", self, self.PostTick)
end


function NotificationAlert:AddNotificationAlert(args)
	self:AddMessage(args.message)
end


function NotificationAlert:AddMessage(message)

	local label = Label.Create()
	label:SetFont(AssetLocation.Disk, "Archivo.ttf")
	label:SetWidth(self.width)
	label:SetWrap(true)
	label:SetTextSize(self.textSize)
	label:SetText(message)
	label:SizeToContents()	
	label:SetHeight(label:GetHeight() + 5)
	label:Hide()

	table.insert(self.messages, {label = label, duration = self.duration})
	ClientSound.Play(AssetLocation.Game, {bank_id = 11, sound_id = 2, position = Camera:GetPosition(), angle = Angle(), timeout = 10, variable_id_focus = 0})
end


function NotificationAlert:RemoveMessage(index)
	local message = self.messages[index]
	message.label:Remove()
	table.remove(self.messages, index)
end



function NotificationAlert:PostTick()
	if self.timer:GetSeconds() >= 1 then

		for _, message in pairs(self.messages) do
			message.duration = message.duration - 1
			
			if message.duration <= 0 then
				self:RemoveMessage(_)
				break
			end
		end
		
		self.timer:Restart()
	end
end


function NotificationAlert:Render(position)

	for i = #self.messages, 1, -1 do
		local message = self.messages[i]
		position.y = position.y - message.label:GetHeight() - self.margin.y * 2 - 2
		Render:FillArea(position, message.label:GetSize() + self.margin * 2, Color(0, 0, 0, 150))
		message.label:SetPosition(position + self.margin)
		message.label:Show()
	end	
end