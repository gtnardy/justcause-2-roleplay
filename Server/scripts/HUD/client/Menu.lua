class 'Menu'

function Menu:__init()
	
	self.active = false
	
	self.botoes = {}
	self.mapa = Mapa()
	self:AddTela(self.mapa)
	
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
		if self.botoes[1] then
			self.botoes[1]:SetActive(true)
		end
	else
		for _, botao in ipairs(self.botoes) do
			botao:SetActive(false)
		end
	end
end


function Menu:Toogle()
	self:SetActive(not self.active)
end


function Menu:KeyUp(args)
	if args.key == VirtualKey.F1 or args.key == string.byte("M") then
		if Game:GetGUIState() == GUIState.Menu then return end
		self:Toogle()
	end
end


function Menu:LocalPlayerInput(args)
	if (self.active) then return false end
end


function Menu:Render()
	if (self.active and Game:GetGUIState() == GUIState.PDA) then
		local position = CONFORTOHUD + Vector2(0, 70)
		for _, botao in ipairs(self.botoes) do
			if botao.tela then
				botao.tela:Render()
			end
			
			position.x = position.x + 10 + botao:Render(position)
		end
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
	self.cor = bool and Color(222, 184, 34) or Color(255, 255, 255)

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