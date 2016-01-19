class 'CustomChat'

function CustomChat:__init()

	self.windowSize = Vector2(400, 200)
	self.windowPosition = Vector2(Render.Width - self.windowSize.x - 20, Render.Height / 3)
	self.margin = Vector2(80, 20)
	self.textSize = 16
	self.textColorDefault = Color(255, 255, 255)
	--self.scroll = 0
	
	self.visible = true
	self.typing = false
	self.messages = {}
	
	self.timerFade = Timer()
	
	self.TextBox = TextBox.Create() 
	self:Configure()
	
	Events:Subscribe("PostRender", self, self.Render)
	Events:Subscribe("ChatPrint", self, self.ChatPrint)
	Events:Subscribe("PrintChat", self, self.PrintChat)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("KeyDown", self, self.KeyDown)
	--Events:Subscribe("MouseScroll", self, self.MouseScroll)
	
	Network:Subscribe("PlayerChat", self, self.PlayerChat)
	Network:Subscribe("ChatPrint", self, self.ChatPrint)
	
	Chat:SetActive(false)
	Chat:SetEnabled(false)
end


function CustomChat:ChatPrint(args)

	local array = {}
	for i = 1, #args, 2 do
		local text = args[i]
		local color = args[i+1]
		if text and color then
			table.insert(array, {text = text, color = color})

		end
	end
	self:PrintChat(array)
end


function CustomChat:PlayerChat(args)
	local playerName = {text = tostring(args.player), color = args.player:GetColor()}
	local texto = {text = ": "..args.text, color = Color(255, 255, 255)}
	self:PrintChat({playerName, texto})
end


function CustomChat:ChatSend(text)
	Events:Fire("PlayerChat", {player = LocalPlayer, text = text})
	Events:Fire("LocalPlayerChat", {text = text})
	Network:Send("PlayerChat", {player = LocalPlayer, text = text})
end


function CustomChat:Configure()
	self.TextBox:SetVisible(false)
	self.TextBox:Subscribe("EscPressed", self, self.TextBox_Close)
	self.TextBox:Subscribe("ReturnPressed", self, self.TextBox_ReturnPressed)
	self.TextBox:Subscribe("TabPressed", self, self.TextBox_Close)
end


function CustomChat:PrintChat(texts)
	
	local arrayWords = {} -- word: , color:
	
	for _, text in pairs(texts) do 
	
		local textSplitted = self:Split(text.text)
		for w, word in pairs(textSplitted) do
			local color = Color(text.color.r, text.color.g, text.color.b, 200)
			table.insert(arrayWords, {text = word, color = color})
			table.insert(arrayWords, {text = " ", color = color})
		end
		table.remove(arrayWords, #arrayWords)
		
		--table.insert(arrayWords, {text = word, color = text.color})
	end
	
	-- local sameColors = {}
	-- for _, word in pairs(arrayWords) do
	
		-- if #sameColors > 0 and word.color == sameColors[#sameColors].color then
			-- sameColors[#sameColors].text = sameColors[#sameColors].text .. word.word
		-- else
			-- table.insert(sameColors, {text = word.word, color = word.color})
		-- end
	-- end
	
	for _, word in pairs(arrayWords) do
		--Chat:Print(tostring(word.text), word.color)
	end
	
	self:CalculateLines(arrayWords)
	
	self.timerFade:Restart()
	
	if (#self.messages > 10) then
		table.remove(self.messages, 1)
	end
end


function CustomChat:CalculateLines(arrayWords)

	local lineWidth = 0
	local arrayLine = {}
	for _, word in pairs(arrayWords) do
		lineWidth = lineWidth + Render:GetTextWidth(word.text, self.textSize)
		if lineWidth > self.windowSize.x then

			if _ == #arrayWords then
				table.insert(self.messages, arrayLine)
				arrayLine = {}
				table.insert(arrayLine, word)
				table.insert(self.messages, arrayLine)
			else
				table.insert(self.messages, arrayLine)
				self:CalculateLines(self:GetHalfArray(arrayWords, _))
			end
			arrayLine = {}
			break
		else
			table.insert(arrayLine, word)
		end
	end
	
	if #arrayLine > 0 then
		table.insert(self.messages, arrayLine)
	end
end


function CustomChat:GetHalfArray(arrayWords, i)
	
	local newArray = {}
	for i = i, #arrayWords do
		table.insert(newArray, arrayWords[i])
	end
	return newArray
end


function CustomChat:Split(str)

	local array = {}
	for word in string.gmatch(str, "%S+") do
		table.insert(array, word)
	end

	return array
end


function CustomChat:KeyDown(args)

	if args.key == VirtualKey.Return and self.visible and self:GetGameState() then

		self.timerFade:Restart()
		Chat:SetActive(false)
		Chat:SetEnabled(false)
		self.typing = true
		self.TextBox:Focus()
		self.TextBox:Show()
		Mouse:SetVisible(true)
		self.TextBox:SetText("")
		return false
	end
end


function CustomChat:TextBox_ReturnPressed()
	
	local text = self.TextBox:GetText()
	if string.len(text) > 0 then

		self:ChatSend(text)
	end
	self:TextBox_Close()
end


function CustomChat:TextBox_Close()
	
	self.TextBox:SetText("")
	self.typing = false
	self.TextBox:SetVisible(false)
	Mouse:SetVisible(false)
end


function CustomChat:LocalPlayerInput(args)

	if self.typing then
		return false
	end
end


-- function CustomChat:MouseScroll(args)

	-- self.scroll = math.max(math.min(self.scroll + args.delta * 12, #self.messages * self.margin.y - self.windowSize.y), 0)
-- end


function CustomChat:Render()

	if (self.visible and self.timerFade:GetSeconds() < 30 and self:GetGameState()) then
		self.windowPosition = Vector2(Render.Width - self.windowSize.x - self.margin.x, Render.Height / 3)
		
		self.TextBox:SetPosition(Vector2(Render.Width - self.margin.x - self.TextBox:GetWidth(), self.windowPosition.y + self.windowSize.y))
		Render:SetClip(true, self.windowPosition, self.windowSize)
		
		local linePosition = self.windowPosition + Vector2(self.windowSize.x , 0) - Vector2(0, #self.messages * self.margin.y - self.windowSize.y)
		--Render:FillArea(self.windowPosition, self.windowSize, Color(0, 0, 0, 50))
		for m, message in pairs(self.messages) do
			
			for t = #message, 1, -1 do
				local text = message[t]
				linePosition = self:AppendTextPosition(linePosition, tostring(text.text))
				self:DrawTextShadowed(linePosition, text.text, text.color, self.textSize)
			end
			
			linePosition = Vector2(self.windowPosition.x + self.windowSize.x , linePosition.y + self.margin.y)
		end
	end
end


function CustomChat:DrawTextShadowed(position, text, color, size)
	
	Render:DrawText(position + Vector2(1, 1), text, Color(0, 0, 0), size)
	Render:DrawText(position, text, color, size)
end


function CustomChat:AppendTextPosition(linePosition, text)
	
	return linePosition - Vector2(Render:GetTextWidth(text, self.textSize), 0)
end


function CustomChat:GetGameState()
	if(Game:GetState() != GUIState.PDA and Game:GetState() != GUIState.Loading and Game:GetState() != GUIState.Menu) then
		return true
	end
	return false
end


CustomChat = CustomChat()