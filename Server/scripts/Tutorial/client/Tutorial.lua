class 'Tutorial'

function Tutorial:__init()
	
	self.active = false
	self.tutorialsActive = false
	
	self:ConfigureTutorials()
	self.actualTutorial = 0
	
	self.cameraPosition = Vector3(-6732.5, 222, -3591)
	self.cameraAngle = Angle(-1.9, 0, 0)
	
	self.timer = Timer()
	
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("CalcView", self, self.CalcView)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("RemovedInformationAlert", self, self.RemovedInformationAlert)
	Network:Subscribe("TutorialNewPlayer", self, self.TutorialNewPlayer)
	
end


function Tutorial:ConfigureTutorials()
	self.tutorials = {}
	
	self:AddTutorial("TUTORIAL_001", 20, nil, nil)
	
	self:AddTutorial("TUTORIAL_002", 20, nil, function()
		Events:Fire("SetObjective", {texts = {
										{text = self.Languages.TEXT_ENTER_IN .. " ", color = Color.White},
										{text = self.Languages.TEXT_VEHICLE, color = Color(46, 204, 113)},
										{text = ".", color = Color.White},
									}
								})
	end)
	
	self:AddTutorial("TUTORIAL_003", 20, function()
		return LocalPlayer:InVehicle() and LocalPlayer:GetVehicle():GetDriver() == LocalPlayer
	end, function()
		Events:Fire("SetObjective", {texts = {
										{text = self.Languages.TEXT_GOTO_M .. " ", color = Color.White},
										{text = self.Languages.TEXT_GAS_STATION, color = Color(52, 152, 219)},
										{text = ".", color = Color.White},
									},
									color = Color(52, 152, 219),
									name = self.Languages.TEXT_GAS_STATION,
									position = Vector3(-7100, 211, -3677),
								})
	end)
	
	
	self:AddTutorial("TUTORIAL_004", 5, function()
		return Vector3.Distance(Vector3(-7100, 211, -3677), LocalPlayer:GetPosition()) <= 5
	end, function()
		Events:Fire("RemoveObjective")
	end)

end


function Tutorial:AddTutorial(id, duration, condition, callback)
	table.insert(self.tutorials, {id = id, duration = duration, condition = condition, callback = callback})
end


function Tutorial:StartTutorial()
	self.tutorialsActive = true
	self:NextTutorial()
end


function Tutorial:NextTutorial()
	local tutorial = self.tutorials[self.actualTutorial]
	if tutorial and tutorial.callback then tutorial.callback() end
	
	self.actualTutorial = self.actualTutorial + 1
	tutorial = self.tutorials[self.actualTutorial]
	if tutorial then
		if self.Languages[tutorial.id] then
			Events:Fire("AddInformationAlert", {id = tutorial.id, message = self.Languages[tutorial.id], duration = tutorial.duration, priority = true})
		end
	else
		self.tutorialsActive = false
	end
end


function Tutorial:RemovedInformationAlert(args)
	if not self.tutorialsActive then return end
	if args.id:sub(1, 8) != "TUTORIAL" then return end
	local id = tonumber(args.id:sub(-3))

	local tutorial = self.tutorials[id]
	
	if tutorial then
		if (not tutorial.condition) or tutorial.condition() then
			self:NextTutorial()
		end
	end
end


function Tutorial:LocalPlayerInput(args)
	if self.active then return false end
end


function Tutorial:TutorialNewPlayer()
	self:SetActive(true)
end


function Tutorial:ModuleLoad()
	self:SetLanguages()
	self.CharacterCustomization = CharacterCustomization()
	self.CharacterCustomization.confirmEvent = function()
		self:CharacterCreated()
	end
	--self:StartTutorial()
end


function Tutorial:CharacterCreated()
	Network:Send("NewPlayerCreated", {name = self.CharacterCustomization.ConfirmationScreenText.TextBox:GetText()})
	self.SoundStart = ClientSound.Create(AssetLocation.Game, {bank_id = 25, sound_id = 47, position = Camera:GetPosition(), angle = Angle()})
	self.SoundStart:SetParameter(0, 1)
	self:SetActive(false)
	self:StartTutorial()
end


function Tutorial:ModuleUnload()
	Game:SetHUDHidden(false)
end


function Tutorial:SetActive(bool)
	Game:SetHUDHidden(bool)
	self.active = bool
	self.CharacterCustomization:SetActive(bool)
end


function Tutorial:PostTick()
	if not self.tutorialsActive then return end
	
	if self.timer:GetSeconds() > 1 then
		local tutorial = self.tutorials[self.actualTutorial]
		if tutorial and tutorial.condition then
			if tutorial.condition() then
				self:NextTutorial()
			end
		end
		self.timer:Restart()
	end
end


function Tutorial:Render()
	if self.SoundStart and self.SoundStart:IsValid() then
		self.SoundStart:SetPosition(Camera:GetPosition())
	end
	if not self.active then return end
end


function Tutorial:CalcView()
	if not self.active then return end
	Camera:SetPosition(self.cameraPosition)
	Camera:SetAngle(self.cameraAngle)
end


function Tutorial:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("TEXT_GOTO_M", {["en"] = "Go to the", ["pt"] = "Vá para o"})
	self.Languages:SetLanguage("TEXT_GOTO_F", {["en"] = "Go to the", ["pt"] = "Vá para a"})
	self.Languages:SetLanguage("TEXT_GAS_STATION", {["en"] = "Gas Station", ["pt"] = "Posto de Combustível"})
	self.Languages:SetLanguage("TEXT_ENTER_IN", {["en"] = "Find and enter a", ["pt"] = "Encontre e entre em um"})
	self.Languages:SetLanguage("TEXT_VEHICLE", {["en"] = "Vehicle", ["pt"] = "Veículo"})
	
	self.Languages:SetLanguage("TUTORIAL_001", {["en"] = "Language", ["pt"] = "Seja bem vindo a sua maior experiencia com Roleplay! Este servidor foi construído com inspiração em grandes servidores de SA-MP e MTA, como também recentes lançamentos assim como GTA:V, ARMA III e Just Cause 3! Este guia irá lhe auxiliar a começar com tudo no servidor!"})
	self.Languages:SetLanguage("TUTORIAL_002", {["en"] = "en", ["pt"] = "Todos os cidadãos precisam estar devidamente habilitados para dirigir, mas não se preocupe, até o nível 5 você não será multado se pego sem carteira de habilitação! Encontre e entre em um veículo para prosseguirmos!"})
	self.Languages:SetLanguage("TUTORIAL_004", {["en"] = "Language", ["pt"] = "Perfei... eer, não é a melhore coisa mas dá para o gasto. Você poderá visitar uma concessionária quando quiser para adquirir um carro só para você! Note que seu Combustível é exibido no canto inferior direito da tela, vá até o Posto de Combustível para abastecê-lo."})
	self.Languages:SetLanguage("TUTORIAL_005", {["en"] = "Language", ["pt"] = "Seus status de Fome e Sede aparecem no canto inferior direito da tela, assim como seu Combustível. Caso você comece a passar Fome ou Sede, irá vagarosamente perder vida até morrer!"})
	
	self.Languages:SetLanguage("TUTORIAL_006", {["en"] = "en", ["pt"] = "pt3"})
end


Tutorial = Tutorial()