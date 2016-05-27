class 'Menu'

function Menu:__init()
	
	self.active = false
	
	self.actualScreen = 1
	
	self.botoes = {}
	
	self.ScreenMap = ScreenMapa()
	self.ScreenJob = ScreenJob()
	self.ScreenProgress = ScreenProgress()
	
	self:AddTela(self.ScreenMap)
	self:AddTela(self.ScreenJob)
	self:AddTela(self.ScreenProgress)
	
	self.IMAGE_TUTORIAL_Q = Image.Create(AssetLocation.Resource, "TUTORIAL_Q")
	self.IMAGE_TUTORIAL_E = Image.Create(AssetLocation.Resource, "TUTORIAL_E")
	
	self.GUIStateObject = SharedObject.Create("GUIState")
	
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
end


function Menu:AddTela(tela)

	local botao = Botao({texto = tela.nome, tela = tela})
	table.insert(self.botoes, botao)
end


function Menu:GetActive()
	return self.active
end


function Menu:SetActive(bool)
	if bool and Game:GetGUIState() != GUIState.Game then return end
	self.GUIStateObject:SetValue(tostring(GUIState.PDA), bool)
	self.active = bool
	Mouse:SetVisible(bool)
	if bool then
		if self.botoes[self.actualScreen] then
			self.botoes[self.actualScreen]:SetActive(true)
		end
	else
		for _, botao in ipairs(self.botoes) do
			botao:SetActive(false)
		end
	end
end


function Menu:PrevScreen()
	self:SetActiveScreen(self.actualScreen - 1)
end


function Menu:SetActiveScreen(screen)
	if self.botoes[screen] then
		self.botoes[self.actualScreen]:SetActive(false)
		self.actualScreen = screen
		self.botoes[self.actualScreen]:SetActive(true)
	end
end


function Menu:NextScreen()
	self:SetActiveScreen(self.actualScreen + 1)
end


function Menu:Toogle()
	self:SetActive(not self.active)
end


function Menu:KeyUp(args)
	if args.key == VirtualKey.F1 then
		if Game:GetGUIState() == GUIState.Menu then return end
		self:Toogle()
	elseif args.key == VirtualKey.F2 then
		if Game:GetGUIState() == GUIState.Menu then return end
		self:SetActiveScreen(2)
		self:Toogle()
	elseif args.key == string.byte("M") then
		if Game:GetGUIState() == GUIState.Menu then return end
		self:SetActiveScreen(1)
		self:Toogle()
	elseif args.key == string.byte("Q") then
		self:PrevScreen()
	elseif args.key == string.byte("E") then
		self:NextScreen()
	end
end


function Menu:LocalPlayerInput(args)
	if (self.active) then return false end
end


function Menu:Render()
	if (self.active and Game:GetGUIState() == GUIState.PDA) then
		local position = CONFORTOHUD + Vector2(60, 70)
		self.botoes[self.actualScreen].tela:Render()
		self.IMAGE_TUTORIAL_Q:SetPosition(position - Vector2(60, 0))
		self.IMAGE_TUTORIAL_Q:Draw()
		for _, botao in ipairs(self.botoes) do
			
			position.x = position.x + 30 + botao:Render(position)
		end
		self.IMAGE_TUTORIAL_E:SetPosition(position)
		self.IMAGE_TUTORIAL_E:Draw()
	end
end


function Menu:ModuleUnload()
	self.GUIStateObject:SetValue(tostring(GUIState.PDA), false)
end


class 'Botao'

function Botao:__init(args)
	
	self.active = false
	self.tela = args.tela
	self.texto = string.upper(args.tela.nome)
	self.sizeTexto = 18
	
	self.cor = Color(255, 255, 255)
end


function Botao:SetActive(bool)
	self.active = bool
	self.cor = bool and Color(206, 194, 105) or Color(255, 255, 255)

	self:SetTelaActive(bool)
end


function Botao:SetTelaActive(bool)
	if not self.tela then return end
	self.tela:SetActive(bool)
end


function Botao:GetActive()
	return self.active
end


function Botao:Render(posicao)
	local tamanhoTexto = Render:GetTextSize(self.texto, self.sizeTexto)
	local tamanhoBotao = tamanhoTexto + Vector2(10, 10)
	local posicaoTexto = tamanhoBotao / 2 - tamanhoTexto / 2
	
	if self.active then
		Render:FillArea(posicao - Vector2(10, 6), Vector2(tamanhoBotao.x + 20, 2), self.cor)
		Render:FillArea(posicao + Vector2(-10, tamanhoBotao.y), Vector2(tamanhoBotao.x + 20, 2), self.cor)
		Render:FillArea(posicao - Vector2(10, 6), Vector2(2, tamanhoBotao.y + 8), self.cor)
		Render:FillArea(posicao + Vector2(tamanhoBotao.x + 10, -6), Vector2(2, tamanhoBotao.y + 8), self.cor)
	end
	DrawTextShadow(posicao + posicaoTexto, self.texto, self.cor, self.sizeTexto)
	return tamanhoBotao.x
end


function DrawTextShadow(pos, text, color, size)

	Render:DrawText(pos - Vector2(1, 1), text, Color(0, 0, 0, 100), size)
	Render:DrawText(pos + Vector2(2, 1), text, Color(0, 0, 0, 100), size)
	Render:DrawText(pos, text, color, size)
	Render:DrawText(pos + Vector2(1, 0), text, color, size)
end