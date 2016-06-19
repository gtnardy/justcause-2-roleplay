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
	Network:Subscribe("TutorialNewPlayer", self, self.TutorialNewPlayer)
	
end


function Tutorial:ConfigureTutorials()
	self.tutorials = {}
	
	self:AddTutorial("TUTORIAL_001", 20, nil, nil)
	
	self:AddTutorial("TUTORIAL_002", 20, function()
		return LocalPlayer:InVehicle() and LocalPlayer:GetVehicle():GetDriver() == LocalPlayer
		
	end, function()
		Events:Fire("SetObjective", {texts = {
										{text = self.Languages.TEXT_ENTER_IN .. " ", color = Color.White},
										{text = self.Languages.TEXT_VEHICLE, color = Color(46, 204, 113)},
										{text = ".", color = Color.White},
									}
								})
	end)
	
	
	 --

	self:AddTutorial("TUTORIAL_003", 20, function()
		return Vector3.Distance(Vector3(-7100, 211, -3677), LocalPlayer:GetPosition()) <= 15
		
	end, function()
		Events:Fire("SetObjective", {texts = {
										{text = self.Languages.TEXT_GOTO_M .. " ", color = Color.White},
										{text = self.Languages.TEXT_GAS_STATION, color = Color(52, 152, 219)},
										{text = ".", color = Color.White},
									},
									color = Color(52, 152, 219),
									name = self.Languages.TEXT_GAS_STATION,
									position = Vector3(-7100, 211, -3677),
									removeOnEnter = true,
								})
	end)
	
	
	self:AddTutorial("TUTORIAL_004", 15, function()
		return Vector3.Distance(Vector3(-7100, 211, -3677), LocalPlayer:GetPosition()) > 15
	end, function()
		Events:Fire("SetObjective", {texts = {
										{text = self.Languages.TEXT_PRESS .. " ", color = Color.White},
										{text = "F ", color = Color(52, 152, 219)},
										{text = self.Languages.TEXT_TO_FUEL .. " ", color = Color.White},
										{text = self.Languages.TEXT_GET_OUT_GAS, color = Color.White},
									}
								})
	end)
	
	self:AddTutorial("TUTORIAL_005", 20, function()
		return Vector3.Distance(Vector3(-8886.95, 265.5, -3435.3), LocalPlayer:GetPosition()) <= 5
	end, function()
		Events:Fire("SetObjective", {texts = {
										{text = self.Languages.TEXT_GOTO_F .. " ", color = Color.White},
										{text = self.Languages.TEXT_FOOD_STORE, color = Color(52, 152, 219)},
										{text = ".", color = Color.White},
									},
									color = Color(52, 152, 219),
									name = self.Languages.TEXT_FOOD_STORE,
									position = Vector3(-8886.95, 265.5, -3435.3),
									removeOnEnter = true,
								})
	end)
	
	
	self:AddTutorial("TUTORIAL_006", 15, function()
		return Vector3.Distance(Vector3(-8886.95, 265.2, -3435.3), LocalPlayer:GetPosition()) > 5
	end, function()
		Events:Fire("SetObjective", {texts = {
										{text = self.Languages.TEXT_BUY_SOME .. " ", color = Color.White},
										{text = self.Languages.TEXT_SNACKS .. " ", color = Color(52, 152, 219)},
										{text = self.Languages.TEXT_GET_OUT_SHOP, color = Color.White},
									}
								})
	end)
	
	
	self:AddTutorial("TUTORIAL_007", 20, nil, function()
		Events:Fire("SetObjective", {texts = {
										{text = self.Languages.TEXT_OPEN_INVENTORY .. " ", color = Color.White},
									}
								})
	end)
	
	self:AddTutorial("TUTORIAL_008", 20, nil, nil)
	
	self:AddTutorial("TUTORIAL_009", 20,  function()
		return Vector3.Distance(Vector3(-9961.1, 208.2, -3297.7), LocalPlayer:GetPosition()) > 5
	end, function()
		Events:Fire("SetObjective", {texts = {
										{text = self.Languages.TEXT_GOTO_F .. " ", color = Color.White},
										{text = self.Languages.TEXT_JOB_AGENCY, color = Color(52, 152, 219)},
										{text = ".", color = Color.White},
									},
									color = Color(52, 152, 219),
									name = self.Languages.TEXT_JOB_AGENCY,
									position = Vector3(-9961.1, 208.2, -3297.7),
									removeOnEnter = true,
								})
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
	if tutorial then
		Events:Fire("RemoveInformationAlert", {id = tutorial.id})
	end
	
	self.actualTutorial = self.actualTutorial + 1
	
	local tutorial = self.tutorials[self.actualTutorial]
	if tutorial then
		if tutorial.callback then tutorial.callback() end
		
		if self.Languages[tutorial.id] then
			Events:Fire("AddInformationAlert", {id = tutorial.id, message = self.Languages[tutorial.id], duration = tutorial.duration, priority = true})
		end
	else
		self.tutorialsActive = false
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
	self:StartTutorial()
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
		if tutorial then
			tutorial.duration = tutorial.duration - 1
			if (tutorial.condition and tutorial.condition()) or (not tutorial.condition and tutorial.duration <= 0) then
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
	self.Languages:SetLanguage("TEXT_JOB_AGENCY", {["en"] = "Job Agency", ["pt"] = "Agência de Empregos"})
	self.Languages:SetLanguage("TEXT_FOOD_STORE", {["en"] = "Food Store", ["pt"] = "Lanchonete"})
	self.Languages:SetLanguage("TEXT_OPEN_INVENTORY", {["en"] = "Open your inventory pressing I.", ["pt"] = "Abra seu inventário pressionando I."})
	self.Languages:SetLanguage("TEXT_ENTER_IN", {["en"] = "Find and enter a", ["pt"] = "Encontre e entre em um"})
	self.Languages:SetLanguage("TEXT_VEHICLE", {["en"] = "Vehicle", ["pt"] = "Veículo"})
	self.Languages:SetLanguage("TEXT_BUY_SOME", {["en"] = "Buy some", ["pt"] = "Compre alguns"})
	self.Languages:SetLanguage("TEXT_SNACKS", {["en"] = "Snacks", ["pt"] = "Snacks"})
	self.Languages:SetLanguage("TEXT_TO_FUEL", {["en"] = "to fuel", ["pt"] = "para abastecer"})
	self.Languages:SetLanguage("TEXT_PRESS", {["en"] = "Press", ["pt"] = "Pressione"})
	self.Languages:SetLanguage("TEXT_GET_OUT_SHOP", {["en"] = "and leave the store.", ["pt"] = "e saia da loja."})
	self.Languages:SetLanguage("TEXT_GET_OUT_GAS", {["en"] = "and leave the Gas Station.", ["pt"] = "e saia do Posto."})
	
	self.Languages:SetLanguage("TUTORIAL_001", {["en"] = "Language", ["pt"] = "Seja bem vindo a sua maior experiencia com Roleplay! Este servidor foi construído com inspiração em grandes servidores de SA-MP e MTA, como também recentes lançamentos assim como GTA:V, ARMA III e Just Cause 3! Este guia irá lhe auxiliar a começar com tudo no servidor!"})
	self.Languages:SetLanguage("TUTORIAL_002", {["en"] = "en", ["pt"] = "Todos os cidadãos precisam estar devidamente habilitados para dirigir, mas não se preocupe, até o nível 5 você não será multado se pego sem carteira de habilitação! Encontre e entre em um veículo para prosseguirmos!"})
	self.Languages:SetLanguage("TUTORIAL_003", {["en"] = "Language", ["pt"] = "Perfei... eer, não é a melhore coisa mas dá para o gasto. Você poderá visitar uma concessionária quando quiser para adquirir um carro só para você! Note que seu Combustível é exibido no canto inferior direito da tela, vá até o Posto de Combustível para abastecê-lo."})
	self.Languages:SetLanguage("TUTORIAL_004", {["en"] = "Language", ["pt"] = "Pressione F para abastecer 10 Litros de combustível. Abasteça quantas vezes precisar, ou até enxer o tanque. Saia do posto para prosseguirmos."})
	self.Languages:SetLanguage("TUTORIAL_005", {["en"] = "Language", ["pt"] = "Seus status de Fome e Sede aparecem no canto inferior direito da tela, assim como seu Combustível. Caso você comece a passar Fome ou Sede, irá vagarosamente perder vida até morrer! Vá para a lanchonete e compre alguns snacks."})
	self.Languages:SetLanguage("TUTORIAL_006", {["en"] = "Language", ["pt"] = "Pressione F para acessar a Loja e compre alguns snacks. Após isso, saia da loja para prosseguirmos."})
	self.Languages:SetLanguage("TUTORIAL_007", {["en"] = "en", ["pt"] = "Você poderá ver tudo que comprou em seu Inventário. Pressione I para acessar seu inventário e coma algum snack."})
	self.Languages:SetLanguage("TUTORIAL_008", {["en"] = "en", ["pt"] = "Nesse mesmo menu do inventário, você poderá usar seu GPS, chamar um Taxi e entre outras coisas uteis durante o jogo."})
	self.Languages:SetLanguage("TUTORIAL_009", {["en"] = "en", ["pt"] = "Excelente! Agora que você já conhece os básicos do jogo, vá a uma Agência de Empregos para conseguri seu primeiro emprego!"})
end


Tutorial = Tutorial()