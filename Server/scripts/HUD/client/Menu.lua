class 'Menu'

function Menu:__init()
	
	self.active = false
	
	self.botoes = {}
	self.mapa = Mapa()
	self:AddTela(self.mapa)
	
	self.GUIStateObject = SharedObject.Create("GUIState")
		
	Events:Subscribe("PostRender", self, self.Render)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
end


function Menu:AddTela(tela)

	local botao = Botao({texto = tela.nome, tela = tela})
	table.insert(self.botoes, botao)
end


function Menu:GetActive()
	return self.active
end


function Menu:SetActive(bool)
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
		self:Toogle()
	end
end


function Menu:LocalPlayerInput(args)
	if (self.active) then return false end
end


function Menu:Render(args)
	if (self.active and Game:GetGUIState() == GUIState.PDA) then

		for _, botao in ipairs(self.botoes) do
			if botao.tela then
				botao.tela:Render()
			end
			botao:Render(Vector2(100 + botao.tamanhoBotao.x * _ + 10, 100))
		end
		Render:ResetFont()
	end
end


class 'Botao'

function Botao:__init(args)
	
	self.active = false
	self.tela = args.tela
	self.texto = string.upper(args.tela.nome)
	self.sizeTexto = 18
	
	self.tamanhoTexto = Render:GetTextSize(self.texto, self.sizeTexto)
	self.tamanhoBotao = self.tamanhoTexto + Vector2(10, 10)
	self.posicaoTexto = self.tamanhoBotao / 2 - self.tamanhoTexto / 2
	
	self.cor = Color(255, 255, 255)
end


function Botao:SetActive(bool)
	self.active = bool
	if bool then
		self.cor = Color(255, 255, 0)
	else
		self.cor = Color(255, 255, 255)
	end
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
	if self.active then
		Render:FillArea(posicao - Vector2(10, 6), Vector2(self.tamanhoBotao.x + 20, 2), self.cor)
		Render:FillArea(posicao + Vector2(-10, self.tamanhoBotao.y), Vector2(self.tamanhoBotao.x + 20, 2), self.cor)
		Render:FillArea(posicao - Vector2(10, 6), Vector2(2, self.tamanhoBotao.y + 8), self.cor)
		Render:FillArea(posicao + Vector2(self.tamanhoBotao.x + 10, -6), Vector2(2, self.tamanhoBotao.y + 8), self.cor)
	end
	DrawTextShadow(posicao + self.posicaoTexto, self.texto, self.cor, self.sizeTexto)
end


function DrawTextShadow(pos, text, color, size)

	Render:DrawText(pos - Vector2(1, 1), text, Color(0, 0, 0, 100), size)
	Render:DrawText(pos + Vector2(2, 1), text, Color(0, 0, 0, 100), size)
	Render:DrawText(pos, text, color, size)
	Render:DrawText(pos + Vector2(1, 0), text, color, size)
end