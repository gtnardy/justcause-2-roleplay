class("ScreenJob")(Tela)

function ScreenJob:__init()

	YELLOW = Color(206, 194, 105)
	GREEN = Color(104, 127, 113)
	RED = Color(191, 49, 54)
	
	self:SetLanguages()
	self.nome = self.Languages.LABEL_JOB
	
	self.jobName = LocalPlayer:GetJobName()
	self.jobExperience = LocalPlayer:GetJobExperience()
	self.jobMaxExperience = LocalPlayer:GetJobMaxExperience()
	self.jobLevel = LocalPlayer:GetJobLevel()
	self.jobUnlocks = LocalPlayer:GetJobUnlocks()
	self.jobUnlocksList = LocalPlayer:GetJobUnlocksList()
	self.jobDetailedDescription = LocalPlayer:GetJobDetailedDescription()
	
	self.IMAGE_JOB_UNLOCK = Image.Create(AssetLocation.Resource, "JOB_UNLOCK")
	self.IMAGE_TUTORIAL_LEFT = Image.Create(AssetLocation.Resource, "TUTORIAL_LEFT")
	self.IMAGE_TUTORIAL_RIGHT = Image.Create(AssetLocation.Resource, "TUTORIAL_RIGHT")
	self.IMAGE_TUTORIAL_UP = Image.Create(AssetLocation.Resource, "TUTORIAL_UP")
	self.IMAGE_TUTORIAL_DOWN = Image.Create(AssetLocation.Resource, "TUTORIAL_DOWN")
	
	self.mouseAt = nil
	self.unlockSelected = 1
	
	self.labelDescriptionJob = Label.Create()
	self.labelDescriptionUnlock = Label.Create()
	self:ConfigureLabels()
	
	Events:Subscribe("NetworkObjectValueChange", self, self.ObjectValueChange)
	Events:Subscribe("SharedObjectValueChange", self, self.ObjectValueChange)
	
	Events:Subscribe("MouseUp", self, self.MouseUp)
	Events:Subscribe("KeyUp", self, self.KeyUp)
end


function ScreenJob:ConfigureLabels()

	-- DescriptionJob
	self.labelDescriptionJob:Hide()
	self.labelDescriptionJob:SetFont(AssetLocation.Disk, "Archivo.ttf")
	self.labelDescriptionJob:SetWidth(500)
	self.labelDescriptionJob:SetWrap(true)
	self.labelDescriptionJob:SetTextSize(16)
	self.labelDescriptionJob:SetText(self.jobDetailedDescription)
	self.labelDescriptionJob:SizeToContents()

	-- DescriptionUnlock
	self.labelDescriptionUnlock:Hide()
	self.labelDescriptionUnlock:SetFont(AssetLocation.Disk, "Archivo.ttf")
	self.labelDescriptionUnlock:SetWidth(440)
	self.labelDescriptionUnlock:SetWrap(true)
	self.labelDescriptionUnlock:SetTextSize(16)
	self.labelDescriptionUnlock:Subscribe("PostRender", self, self.LabelPostRender)

end


function ScreenJob:LabelPostRender()
	self.labelDescriptionJob:Hide()
	self.labelDescriptionUnlock:Hide()
end


function ScreenJob:ObjectValueChange(args)
	if args.object.__type == "LocalPlayer" and args.object == LocalPlayer then
		if args.key == "JobName" then
			self.jobName = LocalPlayer:GetJobName()
		elseif args.key == "JobUnlocks" then
			self.jobUnlocks = LocalPlayer:GetJobUnlocks()
		elseif args.key == "JobUnlocksList" then
			self.jobUnlocksList = LocalPlayer:GetJobUnlocksList()
		elseif args.key == "JobDetailedDescription" then
			self.jobDetailedDescription = LocalPlayer:GetJobDetailedDescription()
		elseif args.key == "JobLevel" then
			self.jobLevel = LocalPlayer:GetJobLevel()
		elseif args.key == "JobExperience" then
			self.jobExperience = LocalPlayer:GetJobExperience()
		elseif args.key == "JobExperienceNecessary" then
			self.jobMaxExperience = LocalPlayer:GetJobMaxExperience()
		end
		
		self:ConfigureLabels()
	end
end


function ScreenJob:Render()
	
	local position = Vector2(80, 200)
	
	-- Background
	Render:FillArea(Vector2(0, 0), Render.Size, Color(1, 39, 51))
	
	-- Title
	Render:DrawText(position, string.upper(self.jobName), YELLOW, 46)
	
	-- Description
	position.y = position.y + 40
	self.labelDescriptionJob:SetPosition(position)
	self.labelDescriptionJob:Show()
	
	-- Level
	position.y = position.y + 150
	Render:DrawText(position, self.Languages.LABEL_LEVEL, YELLOW, 22)
	
	-- Level Text
	Render:DrawText(position + Vector2(Render:GetTextWidth(self.Languages.LABEL_LEVEL, 22) + 10, -2), tostring(self.jobLevel), Color.White, 36)
	
	-- Level Bar
	position.y = position.y + 25
	Render:FillArea(position, Vector2(Render:GetTextWidth(self.Languages.LABEL_LEVEL, 22), 2), YELLOW)
	
	-- Experience
	position.y = position.y + 15
	local xpText = tostring(self.jobExperience) .. " XP"
	Render:DrawText(position, xpText, GREEN, 20)
	Render:DrawText(position + Vector2(Render:GetTextWidth(xpText, 20), 0), " / " .. tostring(self.jobMaxExperience), Color.White, 20)
	
	-- Bar Experience
	position.y = position.y + 20
	local tamMaxBar = Render:GetTextWidth(xpText .. " / " .. tostring(self.jobMaxExperience), 20)
	local tamBar = ((tamMaxBar - 2) * self.jobExperience) / self.jobMaxExperience

	Render:FillArea(position, Vector2(tamMaxBar, 5), Color(0, 0, 0, 150))
	Render:FillArea(position + Vector2(1, 1), Vector2(tamBar, 3), GREEN)
	Render:FillArea(position + Vector2(tamBar, 0), Vector2(1, 5), Color.White)
	
	-- Unlocks
	position.y = position.y + 100
	Render:DrawText(position, self.Languages.LABEL_UNLOCKS, YELLOW, 22)
	
	-- Bar Unlocks
	position.y = position.y + 25
	Render:FillArea(position, Vector2(Render:GetTextWidth(self.Languages.LABEL_UNLOCKS, 22), 2), YELLOW)
	
	position.y = position.y + 15
	
	local unlockPos = position + Vector2(20, 20)
	Render:FillArea(unlockPos - Vector2(2, 2), Vector2(80 * (#self.jobUnlocksList - 1), 5), Color(255, 255, 255, 75))
	
	local mouseAt = nil
	for _, unlock in pairs(self.jobUnlocksList) do
		if self.jobUnlocks[_] and self.jobUnlocks[_].unlocked then
			Render:FillCircle(unlockPos, 20, Color(0, 0, 0, 100))
		else
			self.IMAGE_JOB_UNLOCK:SetPosition(unlockPos - self.IMAGE_JOB_UNLOCK:GetSize() / 2)
			self.IMAGE_JOB_UNLOCK:Draw()
		end
		
		if self.mouseAt == _ then
			Render:DrawCircle(unlockPos, 25, Color(255, 255, 255, 200))
			Render:DrawCircle(unlockPos, 24, Color(255, 255, 255, 200))
		elseif self.unlockSelected == _ then
			Render:DrawCircle(unlockPos, 25, YELLOW)
			Render:DrawCircle(unlockPos, 24, YELLOW)
		end
		
		-- GetMouseAt
		if Vector2.Distance(Mouse:GetPosition(), unlockPos) <= 22 then
			mouseAt = _
		end
		
		unlockPos.x = unlockPos.x + 80
	end
	self.mouseAt = mouseAt
	
	self:RenderUnlock(self.mouseAt and self.mouseAt or self.unlockSelected)

	self:RenderTutorial()
end


function ScreenJob:RenderTutorial()
	local tutorialSize = Vector2(155, 32)
	local position = Render.Size - tutorialSize - Vector2(80, 45)
	Render:FillArea(position, tutorialSize, Color(0, 0, 0, 150))
	
	Render:DrawText(position + Vector2(6, 6), self.Languages.LABEL_SELECT, Color.White, 20)
	position.x = position.x + Render:GetTextWidth(self.Languages.LABEL_SELECT, 20) + 10
	position.y = position.y + 3
	self.IMAGE_TUTORIAL_LEFT:SetPosition(position)
	self.IMAGE_TUTORIAL_LEFT:Draw()
	position.x = position.x + 30
	-- self.IMAGE_TUTORIAL_UP:SetPosition(position)
	-- self.IMAGE_TUTORIAL_UP:Draw()
	-- position.x = position.x + 30
	-- self.IMAGE_TUTORIAL_DOWN:SetPosition(position)
	-- self.IMAGE_TUTORIAL_DOWN:Draw()
	-- position.x = position.x + 30
	self.IMAGE_TUTORIAL_RIGHT:SetPosition(position)
	self.IMAGE_TUTORIAL_RIGHT:Draw()
end


function ScreenJob:RenderUnlock(unlock)
	if not unlock then return end
	
	local unlockData = self.jobUnlocksList[unlock]
	if not unlockData then return end
	
	local position = Vector2(Render.Width - 580, 170)
	
	-- Background
	Render:FillArea(position, Vector2(500, Render.Height - 300), Color(0, 0, 0, 75))
	
	-- Title
	position = position + Vector2(30, 35)
	Render:DrawText(position, string.upper(unlockData.name), Color.White, 38)
	
	-- Subtitle
	position.y = position.y + 35
	local unlocked = self.Languages.LABEL_LOCKED
	local unlockedColor = RED
	if self.jobUnlocks[unlock] and self.jobUnlocks[unlock].unlocked then
		unlocked = self.Languages.LABEL_UNLOCKED
		unlockedColor = GREEN
	end
	Render:DrawText(position, unlocked, unlockedColor, 16)
	
	-- Description
	position.y = position.y + 50
	self.labelDescriptionUnlock:SetText(unlockData.description)
	self.labelDescriptionUnlock:SizeToContents()
	self.labelDescriptionUnlock:SetPosition(position)
	self.labelDescriptionUnlock:Show()
	
	-- Requirements
	if (self.jobUnlocks[unlock] and not self.jobUnlocks[unlock].unlocked) then

		position.y = Render.Height - 260 
		Render:FillArea(position, Vector2(440, 2), Color(255, 255, 255, 150))
		position.y = position.y + 10
		Render:DrawText(position, self.Languages.LABEL_REQUIREMENTS, Color.White, 16)
		
		position.y = position.y + 30
		Render:DrawText(position, self.Languages.LABEL_MINIMUM_LEVEL_NECESSARY .. " " .. tostring(self.jobUnlocks[unlock].minimumLevel) .. " " .. self.Languages.LABEL_IN_JOB, GREEN, 16)
	end
	
end


function ScreenJob:MouseUp(args)
	if (not self.active) or (not self.mouseAt) then return end
	self.unlockSelected = self.mouseAt
end


function ScreenJob:KeyUp(args)
	if not self.active then return end
	
	if args.key == VirtualKey.Left then
		if self.jobUnlocksList[self.unlockSelected - 1] then
			self.unlockSelected = self.unlockSelected - 1
		end
	elseif args.key == VirtualKey.Right then
		if self.jobUnlocksList[self.unlockSelected + 1] then
			self.unlockSelected = self.unlockSelected + 1
		end
	end
end


function ScreenJob:SetActive(bool)
	self.active = bool
end


function ScreenJob:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("LABEL_JOB", {["en"] = "Job", ["pt"] = "Emprego"})
	self.Languages:SetLanguage("LABEL_UNLOCKS", {["en"] = "Unlocks", ["pt"] = "Desbloqueios"})
	self.Languages:SetLanguage("LABEL_UNLOCKED", {["en"] = "Unlocked", ["pt"] = "Desbloqueado"})
	self.Languages:SetLanguage("LABEL_LEVEL", {["en"] = "Level", ["pt"] = "Nível"})
	self.Languages:SetLanguage("LABEL_SELECT", {["en"] = "Select", ["pt"] = "Selecionar"})
	self.Languages:SetLanguage("LABEL_LOCKED", {["en"] = "Locked", ["pt"] = "Bloqueado"})
	self.Languages:SetLanguage("LABEL_REQUIREMENTS", {["en"] = "Requirements", ["pt"] = "Requisitos"})
	self.Languages:SetLanguage("LABEL_MINIMUM_LEVEL_NECESSARY", {["en"] = "You must have level", ["pt"] = "É necessário possuir o nível"})
	self.Languages:SetLanguage("LABEL_IN_JOB", {["en"] = "in this job.", ["pt"] = "nesse emprego."})
	-- Jobs Unlocks
	self.Languages:SetLanguage("JOB_UNLOCK_1_1", {["en"] = "Taximetro", ["pt"] = "Taximetro"})
end