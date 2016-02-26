class 'CharacterCustomization'

function CharacterCustomization:__init()
	self.active = false
	
	self.listSkins = {
		{24, 72},
		{10, 46},
		{13, 47},
		{28, 14},
		{76, 94},
	}
	
	self:SetLanguages()
	self:ConfirmationScreenText()
	self:ConfigureContextMenu()
	self.confirmEvent = function() end
end


function CharacterCustomization:ConfirmationScreenText()
	
	self.ConfirmationScreenText = ConfirmationScreenText({text = self.Languages.TEXT_CONFIRMATIONSCREEN})
	self.ConfirmationScreenText.confirmEvent = function()
		self.confirmEvent()
	end
end



function CharacterCustomization:ConfigureContextMenu()
	self.ContextMenu = ContextMenu({
		headerText = self.Languages.TEXT_HEADER,
		headerBackgroundColor = Color(45, 91, 145),
		headerColor = Color.White,
		subtitle = self.Languages.TEXT_ITEMS,
	})
	
	self.ContextMenu.list.subtitleNumeric = false
	
	-- Language
	local itemLanguage = ContextMenuItem({text = self.Languages.LANGUAGE, listInLine = true})
	local listLanguages = ContextMenuList({subtitle = self.Languages.LANGUAGE})
	itemLanguage.list = listLanguages
	local itemLanguagePortugues = ContextMenuItem({text = "Português"})
	listLanguages:AddItem(itemLanguagePortugues)
	local itemLanguageEnglish = ContextMenuItem({text = "English"})
	listLanguages:AddItem(itemLanguageEnglish)

	
	self.ContextMenu.list:AddItem(itemLanguage)
	
	-- Gender
	local itemGenders = ContextMenuItem({text = self.Languages.GENDER, listInLine = true})
	local listGenders = ContextMenuList({subtitle = self.Languages.GENDER})
	itemGenders.list = listGenders
	local itemGenderMale = ContextMenuItem({text = self.Languages.MALE, data = 1})
	listGenders:AddItem(itemGenderMale)
	local itemGenderFemale = ContextMenuItem({text = self.Languages.FEMALE, data = 2})
	listGenders:AddItem(itemGenderFemale)

	
	self.ContextMenu.list:AddItem(itemGenders)
	
	-- Appearence
	local itemAppearence = ContextMenuItem({text = self.Languages.APPEARENCE, listInLine = true})
	local listAppearence = ContextMenuList({subtitle = self.Languages.APPEARENCE})
	itemAppearence.list = listAppearence
	
	for _, skin in pairs(self.listSkins) do
		local itemSkin = ContextMenuItem({text = tostring(_), data = {skin = skin}})
		listAppearence:AddItem(itemSkin)
		itemSkin.selectEvent = function()
			Network:Send("UpdateSkin", {idSkin = skin[listGenders.items[listGenders.indexSelected].data]})
		end
	end
	
	self.ContextMenu.list:AddItem(itemAppearence)
	
	-- Gender Changing
	itemGenderMale.selectEvent = function()
		Network:Send("UpdateSkin", {idSkin = listAppearence.items[listAppearence.indexSelected].data.skin[1]})
	end
	
	itemGenderFemale.selectEvent = function()
		Network:Send("UpdateSkin", {idSkin = listAppearence.items[listAppearence.indexSelected].data.skin[2]})
	end
	
	-- Confirmation
	local itemConfirmation = ContextMenuItem({text = self.Languages.TEXT_CONFIRMATION, backgroundColor = Color(45, 91, 145, 150)})
	self.ContextMenu.list:AddItem(itemConfirmation)
	itemConfirmation.pressEvent = function()
		self:Confirm()
	end
	
	-- Language Update
	local updateLanguages = function()
		self.ContextMenu.list.subtitle.text = self.Languages.TEXT_ITEMS
		self.ContextMenu.headerText = self.Languages.TEXT_HEADER
		itemLanguage.text = self.Languages.LANGUAGE
		itemAppearence.text = self.Languages.APPEARENCE
		itemGenders.text = self.Languages.GENDER
		itemGenderMale.text = self.Languages.MALE
		itemGenderFemale.text = self.Languages.FEMALE
		itemConfirmation.text = self.Languages.TEXT_CONFIRMATION
	end
	
	itemLanguagePortugues.selectEvent = function()
		LocalPlayer:SetValue("Language", "pt")
		Network:Send("UpdateLanguage", "pt")
		updateLanguages()
	end
	
	itemLanguageEnglish.selectEvent = function()
		LocalPlayer:SetValue("Language", "en")
		Network:Send("UpdateLanguage", "en")
		updateLanguages()
	end
end


function CharacterCustomization:Confirm()
	self:SetActive(false)
	self.ConfirmationScreenText:SetActive(true)
end


function CharacterCustomization:SetActive(bool)
	self.active = self.ContextMenu:SetActive(bool, true)
end


function CharacterCustomization:SetLanguages()
	self.Languages = Languages()
	self.Languages:SetLanguage("LANGUAGE", {["en"] = "Language", ["pt"] = "Idioma"})
	self.Languages:SetLanguage("GENDER", {["en"] = "Gender", ["pt"] = "Sexo"})
	self.Languages:SetLanguage("MALE", {["en"] = "Male", ["pt"] = "Homem"})
	self.Languages:SetLanguage("FEMALE", {["en"] = "Female", ["pt"] = "Mulher"})
	self.Languages:SetLanguage("APPEARENCE", {["en"] = "Appearence", ["pt"] = "Aparência"})
	self.Languages:SetLanguage("TEXT_ITEMS", {["en"] = "ITEMS", ["pt"] = "ITENS"})
	self.Languages:SetLanguage("TEXT_HEADER", {["en"] = "Character Creation", ["pt"] = "Criação do Personagem"})
	self.Languages:SetLanguage("TEXT_CONFIRMATION", {["en"] = "Save and Continue", ["pt"] = "Salvar e Continuar"})
	self.Languages:SetLanguage("TEXT_CONFIRMATIONSCREEN", {["en"] = "Enter your character's name (MAX 12 characteres):", ["pt"] = "Digite o nome de seu personagem (MAX de 12 caracteres):"})
end