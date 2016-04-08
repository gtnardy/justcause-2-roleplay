class 'InterfaceMenu'

function InterfaceMenu:__init()
	
	self.active = false
	
	self.progresso = Progresso()

	self.mapa = Mapa()
	self.botoes = {}
	
	local botaoStatus = Botao({texto = "PROGRESSO", tela = self.progresso})
	local botaoMapa = Botao({texto = "MAPA", tela = self.mapa})
	
	self.pedidos = Pedidos(self.mapa)
	local botaoPedidos = Botao({texto = "EMPREGO", tela = self.pedidos})
	
	self.botaoSelecionado = nil
	
	self:PressionarBotao(botaoMapa)
	
	self:AddBotao(botaoMapa)
	self:AddBotao(botaoStatus)
	self:AddBotao(Botao({texto = "STATUS"}))
	self:AddBotao(botaoPedidos)
	
	self.imagemMouse = Image.Create(AssetLocation.Game, "gui_jc2_cursor_dif.dds")
	self.imagemMouseMovimentando = Image.Create(AssetLocation.Game, "gui_jc2_cursor_cross_dif.dds")
	
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("MouseUp", self, self.MouseUp)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("Render", self, self.Render)

	Events:Subscribe("PostRender", self, self.PostRender)
	
	self.statusHUD = StatusHUD()
end


function InterfaceMenu:PressionarBotao(botao)

	if (botao.tela) then
				
		if (self.botaoSelecionado) then
			self.botaoSelecionado:SetSelecionado(false)
						
			if (self.botaoSelecionado.tela) then
				self.botaoSelecionado.tela:SetActive(false)
			end
							
		end
					
		self.botaoSelecionado = botao
		self.botaoSelecionado:SetSelecionado(true)
				
		self.botaoSelecionado.tela:SetActive(true)
	end
	
end


function InterfaceMenu:LocalPlayerInput(args)

	if (self.active) then return false end
	return true
end


function InterfaceMenu:MouseUp(args)

	if (args.button == 1) then
		
		for i, botao in pairs(self.botoes) do
		
			if (isIntersecting(Mouse:GetPosition(), botao:GetPosition() - Vector2(10, 10), botao:GetTamanho() + Vector2(20, 20))) then
				
				self:PressionarBotao(botao)

			end
			
		end

	end

end


function InterfaceMenu:KeyUp(args)
	
	if (args.key == 112) then

		self:SetActive(not(self.active))
		if self.active then
			self:PressionarBotao(self.botoes[1])
		end
		return
	end	
	
	if (args.key == 113) then

		self:SetActive(not(self.active))
		if self.active then
			self:PressionarBotao(self.botoes[2])
		end
		return
	end	
	
	if self.active then
		if (args.key == string.byte("Q")) then
			local indexBotao = 1
			
			for i, botao in ipairs(self.botoes) do	

				if (botao.texto == self.botaoSelecionado.texto) then
					indexBotao = i
				end
			end
			
			if (self.botoes[indexBotao-1]) then
				self:PressionarBotao(self.botoes[indexBotao-1])
			end
			
			return
		end	
		
		if (args.key == string.byte("E")) then
			local indexBotao = 1
			
			for i, botao in ipairs(self.botoes) do
				if (botao.texto == self.botaoSelecionado.texto) then
					indexBotao = i
				end
			end
			
			if (self.botoes[indexBotao+1]) then
				self:PressionarBotao(self.botoes[indexBotao+1])
			end
			
			return
		end
		

		if (args.key == 27) then
			self:SetActive(false)
			return
		end
	end
	if (args.key == 72) then
		self.statusHUD:SetActive(not self.statusHUD:GetActive())
		return
	end

end	


function InterfaceMenu:GetActive()

	return self.active

end


function InterfaceMenu:SetActive(b)

	Chat:SetEnabled(not(b))
	self.active = b
	Mouse:SetVisible(b)
	
	if (self.botaoSelecionado and self.botaoSelecionado.tela) then
		self.botaoSelecionado.tela:SetActive(b)
	end	

end


function InterfaceMenu:AddBotao(botao)

	table.insert(self.botoes, botao)
	
end


function InterfaceMenu:Render()

	if (self.active) then
	
		--Render:FillArea(Vector2(0, 0), Render.Size, Color(20,200,00))
	end
end


function InterfaceMenu:PostRender()

	if (self.active and Game:GetState() == GUIState.Game) then
		
		if (self.botaoSelecionado and self.botaoSelecionado.tela) then
		
			self.botaoSelecionado.tela:Render()
		end
		
		local pos = Vector2(200, 100)
		local botaoAnterior = nil
		
		for i, botao in pairs(self.botoes) do
			
			if (botaoAnterior) then
				pos = pos + Vector2(botaoAnterior.tamanho.x + 30, 0)
			end
			
			botao:Render(pos)

			botaoAnterior = botao

		end
		
		if (not self.statusHUD:GetActive()) then

			self.statusHUD:Render({boolean = true})
		end

	end
	
end


class 'Botao'

function Botao:__init(args)

	if not args then args = {} end
	
	if (args.texto) then
		self.texto = args.texto
	else
		self.texto = "BOTAO"
	end
	
	self.tamanho = Render:GetTextSize(self.texto, 20)
	self.selecionado = false
	
	self.tela = args.tela
	self.position = Vector2(0, 0)
	
end


function Botao:GetTela()

	return self.tela
end


function Botao:GetTamanho()

	return self.tamanho
end


function Botao:GetPosition()

	return self.position
end


function Botao:SetSelecionado(b)

	if (b and self.tela) then
		self.selecionado = b
	else
		self.selecionado = false
	end
end


function Botao:Render(pos)
	
	self.position = pos
	local cor = Color(255,255,255)
	
	if self.selecionado then
		cor = Color(255,199,66)
		local espessura = 1
		Render:FillArea(pos - Vector2(10, 10), Vector2(self.tamanho.x + 20, espessura), cor)
		Render:FillArea(pos + Vector2(-10, self.tamanho.y), Vector2(self.tamanho.x + 20, espessura), cor)
		
		Render:FillArea(pos - Vector2(10, 10), Vector2(espessura, self.tamanho.y + 10), cor)
		Render:FillArea(pos + Vector2(self.tamanho.x + 10, -10), Vector2(espessura, self.tamanho.y + 10 + espessura), cor)
	end
	
	DrawTextSombreado(pos, self.texto, cor, 20)

end


function isIntersecting(posP, posO, tamO)

	if (posP.x >= posO.x and posP.x <= posO.x + tamO.x and posP.y >= posO.y and posP.y <= posO.y + tamO.y) then
		return true
	end
	
	return false
	
end


function DrawTextSombreado(pos, txt, color, size)
	txt = tostring(txt)
	a = color.a / 2.55
	DrawTextGrande(pos - Vector2(1,0), txt, Color(0,0,0, a), size)
	DrawTextGrande(pos - Vector2(0,1), txt, Color(0,0,0, a), size)
	DrawTextGrande(pos - Vector2(1,1), txt, Color(0,0,0, a), size)
	DrawTextGrande(pos + Vector2(1,1), txt, Color(0,0,0, a), size)
	DrawTextGrande(pos + Vector2(0,1), txt, Color(0,0,0, a), size)
	DrawTextGrande(pos + Vector2(1,0), txt, Color(0,0,0, a), size)
	DrawTextGrande(pos, txt, color, size)
	
end


function DrawTextGrande(pos, txt, color, size)

	Render:DrawText(pos - Vector2(1,0), txt, color, size)
	Render:DrawText(pos, txt, color, size)
	
end