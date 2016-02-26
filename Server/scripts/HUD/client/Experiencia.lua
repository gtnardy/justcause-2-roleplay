class 'Experiencia'

function Experiencia:__init()
	
	self.level = 1
	self.experience = 0
	self.maxExperience = 100
	
	self:UpdateValues()
	
	self.textSize = 20
	
	self.levelBackground = Image.Create(AssetLocation.Resource, "Level_Background")
	
	Events:Subscribe("NetworkObjectValueChange", self, self.ObjectValueChange)
end


function Experiencia:ObjectValueChange(args)
	if args.object.__type == "LocalPlayer" then
		if args.key == "Experience" then
			self.experience = tonumber(args.value)
		elseif args.key == "Level" then
			self.level = tonumber(args.value)
		elseif args.key == "MaxExperience" then
			self.maxExperience = tonumber(args.value)
		end
	end
end


function Experiencia:UpdateValues()
	self.level = LocalPlayer:GetValue("Level") and LocalPlayer:GetValue("Level") or 1
	self.experience = LocalPlayer:GetValue("Experience") and LocalPlayer:GetValue("Experience") or 0
	self.maxExperience = LocalPlayer:GetValue("MaxExperience") and LocalPlayer:GetValue("MaxExperience") or 100
end


function Experiencia:Render(position)
	-- if Game:GetGUIState() == GUIState.PDA or Game:GetGUIState() == GUIState.ContextMenu or self.timerVisible:GetSeconds() < 10 then

		-- MaxExperience
		local maxExperience = " / " .. tostring(self.maxExperience)		
		position.x = position.x - Render:GetTextWidth(maxExperience, self.textSize)
		Render:DrawText(position + Vector2.One, maxExperience, Color(0, 0, 0, 100), self.textSize)
		Render:DrawText(position, maxExperience, Color(255, 255, 255), self.textSize)
		
		-- Experience
		local experience = tostring(self.experience) .. " XP"
		position.x = position.x - Render:GetTextWidth(experience, self.textSize)
		Render:DrawText(position + Vector2.One, experience, Color(0, 0, 0, 100), self.textSize)
		Render:DrawText(position, experience, Color(206, 194, 105), self.textSize)
		
		-- Level
		local level = tostring(self.level)
		position.x = position.x - 30 - self.levelBackground:GetSize().x
		position.y = position.y + 10 - self.levelBackground:GetSize().y / 2
		self.levelBackground:SetPosition(position)
		self.levelBackground:Draw()
		position = position + self.levelBackground:GetSize() / 2 - Render:GetTextSize(level, self.textSize) / 2
		Render:DrawText(position + Vector2.One, level, Color(0, 0, 0, 100), self.textSize)
		Render:DrawText(position, level, Color(206, 194, 105), self.textSize)
		
		-- if self.moneyChanged then
			-- if self.timerMoneyChanged:GetSeconds() >= 5 then
				-- self.moneyChanged = nil
			-- end
			-- Render:DrawText(position, money, Color(255, 255, 255), self.textSize)
		-- end
	-- end
end
