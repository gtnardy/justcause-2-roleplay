class 'Experiencia'

function Experiencia:__init()
	
	self.level = 1
	self.experience = 0
	self.maxExperience = 0
	
	self.toEarnExperience = 0
	self:UpdateValues()
	
	self.textSize = 20
	
	self.levelBackground = Image.Create(AssetLocation.Resource, "Level_Background")
	
	Events:Subscribe("NetworkObjectValueChange", self, self.ObjectValueChange)
end


function Experiencia:ObjectValueChange(args)
	if args.object.__type == "LocalPlayer" then
		if args.key == "Experience" then
			self.toEarnExperience = tonumber(args.value) - self.experience
			if self.toEarnExperience < 0 then
				self.toEarnExperience = self.maxExperience - self.experience + tonumber(args.value)
			end
		elseif args.key == "Level" then
			--self.level = tonumber(args.value)
		elseif args.key == "MaxExperience" then
			self.maxExperience = tonumber(args.value)
		end
	end
end


function Experiencia:UpdateValues()
	self.level = LocalPlayer:GetLevel()
	self.experience = LocalPlayer:GetExperience()
	self.maxExperience = LocalPlayer:GetMaxExperience()
end


function Experiencia:Render(position)
	-- if Game:GetGUIState() == GUIState.PDA or Game:GetGUIState() == GUIState.ContextMenu or self.timerVisible:GetSeconds() < 10 then

		-- MaxExperience
		local maxExperience = " / " .. tostring(self.maxExperience)		
		position.x = position.x - Render:GetTextWidth(maxExperience, self.textSize)
		Render:DrawText(position + Vector2.One, maxExperience, Color(0, 0, 0, 100), self.textSize)
		Render:DrawText(position, maxExperience, Color(255, 255, 255), self.textSize)
		
		if self.toEarnExperience > 0 then
			self.toEarnExperience = self.toEarnExperience - 1
			self.experience = self.experience + 1
		end
		
		if self.experience >= self.maxExperience then
			self.level = LocalPlayer:GetLevel()
			self.maxExperience = LocalPlayer:GetMaxExperience()
			self.experience = 0
		end
		
		-- Experience
		local experience = tostring(self.experience) .. " XP"
		position.x = position.x - Render:GetTextWidth(experience, self.textSize)
		Render:DrawText(position + Vector2.One, experience, Color(0, 0, 0, 100), self.textSize)
		Render:DrawText(position, experience, Color(206, 194, 105), self.textSize)
		
		-- Bar
		local widthBar = Render:GetTextWidth(experience .. maxExperience, self.textSize) - 2
		Render:FillArea(position + Vector2(0, Render:GetTextHeight(experience, self.textSize)), Vector2(widthBar, 5), Color(0, 0, 0, 100))
		local widthExperienceBar = (self.experience / self.maxExperience) * widthBar - 1
		Render:FillArea(position + Vector2(1, Render:GetTextHeight(experience, self.textSize) + 1), Vector2(widthExperienceBar, 3), Color(206, 194, 105))
		Render:FillArea(position + Vector2(widthExperienceBar + 1, Render:GetTextHeight(experience, self.textSize)), Vector2(1, 5), Color.White)
		
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
