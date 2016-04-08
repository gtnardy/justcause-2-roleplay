class 'MenuPlus'

function MenuPlus:__init(args)
	
	self.posicao = Vector2(300, 200)
	self.largura = 250
	self.corTitulo = Color(0,0,0)
	self.corFundo = Color(100,147,200)
	self.titulo = "TITULO"
	self.margem = 5
	self.active = false

	if (args) then
	
		if (args.posicao) then
			self.posicao = args.posicao
		end	
		
		if (args.corFundo) then
			self.corFundo = args.corFundo
		end		
		
		if (args.corTitulo) then
			self.corTitulo = args.corTitulo
		end	
		
		if (args.titulo) then
			self.titulo = args.titulo
		end	
		
		if (args.argsLista) then
			self.lista = ListaPlus(args.argsLista)
		end		
		
		if (args.lista) then
			self.lista = args.lista
		end	
		
	end
	
	self.lista = ListaPlus()
	
	Events:Subscribe("Render", self, self.Render)

end


function MenuPlus:GetLista()

	return self.lista
end


function MenuPlus:GetActive()

	return self.active
	
end


function MenuPlus:SetActive(b)

	self.active = b
	self.lista:SetActive(b)
	
end


function MenuPlus:AddItem(item, i)
	
	if (i) then
		self.itens[i] = item
	else
		table.insert(self.itens, item)
	end

end


function MenuPlus:Render()
	
	if self.active then
	
		local altura = 60
		Render:FillArea(self.posicao, Vector2(self.largura, altura), self.corFundo)
		Render:DrawText(self.posicao + Vector2(self.margem, altura / 2 - Render:GetTextHeight(self.titulo, 22) / 2), self.titulo, self.corTitulo, 22)
		self.lista:Render(self.posicao + Vector2(0, altura), self.largura, self.margem)
		
		if (not self.lista:GetActive()) then
			self.lista:SetActive(true)
		end
		
	end
end



class 'ListaPlus'

function ListaPlus:__init(args)
	
	self.subTitulo = "MENU"
	
	self.active = false

	self.itemTopo = 1
	self.itemSelecionado = 1
	self.limiteItens = 7
	self.itens = {}
	
	self.lista = nil

	if (args) then
	
		if (args.subTitulo) then
			self.subTitulo = args.subTitulo
		end
		
		if (args.limiteItens) then
			self.limiteItens = args.limiteItens
		end
		
		if (args.lista) then
			self.lista = args.lista
		end
	end
	
	self.funcaoItemSelecionado = nil
	self.funcaoItemAlterado = nil
	
	self.eventKeyDown = nil
	self.eventKeyUp = nil
	
	
end


function ListaPlus:GetItemById(id)

	return self.itens[id]
end



function ListaPlus:ItemSelecionado(item)

	if self.funcaoItemSelecionado then
		self.funcaoItemSelecionado(item)
	end
end


function ListaPlus:ItemAlterado(item)

	if self.funcaoItemAlterado then
		self.funcaoItemAlterado(item)
	end
end


function ListaPlus:SubscribeItemSelecionado(func)

	self.funcaoItemSelecionado = func
end


function ListaPlus:SubscribeItemAlterado(func)

	self.funcaoItemAlterado = func
end


function ListaPlus:GetActive()

	return self.active

end


function ListaPlus:SetActive(args)

	self.active = args
	
	if (args) then
	
		self.eventKeyDown = Events:Subscribe("KeyDown", self, self.KeyDown)
		self.eventKeyUp = Events:Subscribe("KeyUp", self, self.KeyUp)	
	else
		if (self.eventKeyUp and self.eventKeyDown) then
			Events:Unsubscribe(self.eventKeyDown)
			Events:Unsubscribe(self.eventKeyUp)
			self.eventKeyUp = nil
			self.eventKeyDown = nil
		end
	end
	
	if (not args and self.lista) then
	
		self.lista:SetActive(false)
		self.lista = nil
	end

end


function ListaPlus:KeyDown(args)

	if (self.active and not Chat:GetActive()) then

		if args.key == 38 then
		
			self.itemSelecionado = math.max(self.itemSelecionado - 1, 1)
			
			if (self.itemSelecionado - self.itemTopo + 1 <= 2) then
				self.itemTopo = math.max(1, self.itemSelecionado - 1)
			end
			
			self:ItemAlterado(item)
			--Events:Fire("ItemAlterado", item)
			
			return
		end		
		
		if args.key == 40 then
			
			self.itemSelecionado = math.min(self.itemSelecionado + 1, #self.itens)

			if (self.itemSelecionado - self.itemTopo >= self.limiteItens-1) then

				self.itemTopo = math.min(self.itemTopo + 1, #self.itens - self.limiteItens+1)--math.min(self.itemSelecionado - self.limiteItens + 2, #self.itens - self.limiteItens+1)
			end
			
			self:ItemAlterado(item)
			--Events:Fire("ItemAlterado", item)
			
			return
		end
	end

end


function ListaPlus:KeyUp(args)

	if (self.active and not Chat:GetActive()) then

		if args.key == 13 then
			
			self:EnterPressionado()
			return
		end		
		
		if args.key == 8 or args.key == 37 then
			
			self:BackspacePressionado()
			return
		end		
	end		

end


function ListaPlus:BackspacePressionado()
	
	self:SetActive(false)
	
end


function ListaPlus:EnterPressionado()

	local item = self.itens[self.itemSelecionado]
	
	if (not item) then return end
	if (not item.active) then return end
	
	if (item.lista) then
		
		self:SetActive(false)
		self.lista = item.lista
		self.lista:SetActive(true)

	else
		self:ItemSelecionado(item)


	end
	
end


function ListaPlus:AddItem(item, i)
	
	if (i) then
		self.itens[i] = item
	else
		table.insert(self.itens, item)
	end

end


function ListaPlus:Render(posicao, largura, margem)
	
	if (self.lista) then

		self.lista:Render(posicao, largura, margem)
		
		if (not self.lista:GetActive()) then
			self:SetActive(true)
			self.lista = nil
		end
		
		return
	end
	
	local altura = 26
	local size = 15
	
	-- SubTitulo
	Render:FillArea(posicao, Vector2(largura, altura), Color(0,0,0, 200))
	Render:DrawText(posicao + Vector2(margem, altura / 2 - Render:GetTextHeight(self.subTitulo, size) / 2), self.subTitulo, Color(255,255,255), size)
	
	-- Fundo Itens
	Render:FillArea(posicao + Vector2(0, altura),  Vector2(largura, altura * math.min(self.limiteItens, #self.itens)), Color(0,0,0, 150))
	
	local inicio = self.itemTopo
	local fim = math.min(self.itemTopo + self.limiteItens-1, #self.itens)
	
	local linha = 0
	for index = self.itemTopo, fim, 1 do
		linha = linha + 1
		local item = self.itens[index]
		
		if (item) then
			local corTexto = Color(240,240,240)
			
			-- Fundo Branco
			if (self.itemSelecionado == index) then

				corTexto = Color(20,20,20)
				Render:FillArea(posicao + Vector2(0, altura * linha),  Vector2(largura, altura), Color(255, 255, 255))
			end
			
			if (not item.active) then
				corTexto = Color(100, 100, 100)
			end
			
			-- Texto
			Render:DrawText(posicao + Vector2(margem, altura * linha + altura / 2 - Render:GetTextHeight(item.texto, size) / 2), item.texto, corTexto, size)
			-- TextoSecundario
			Render:DrawText(posicao + Vector2(largura - margem - Render:GetTextWidth(item.textoSecundario, size), altura * linha + altura / 2 - Render:GetTextHeight(item.textoSecundario, size) / 2), item.textoSecundario, corTexto, size)
		end
	end
	
	-- Rodape
	
	Render:FillArea(posicao + Vector2(0, altura * (math.min(self.limiteItens, #self.itens)+1)), Vector2(largura, altura), Color(0,0,0, 200))	
	Render:FillArea(posicao + Vector2(0, 2 + altura + altura * (math.min(self.limiteItens, #self.itens)+1)), Vector2(largura, 3), Color(255,255,255, 200))	
	
	local itemSelecionado = self.itens[self.itemSelecionado]
	if (itemSelecionado) then
		Render:FillArea(posicao + Vector2(0, 5 + altura + altura * (math.min(self.limiteItens, #self.itens)+1)), Vector2(largura, margem * 2 + Render:GetTextHeight(tostring(itemSelecionado.descricao), size)), Color(0,0,0, 200))
		Render:DrawText(posicao + Vector2(margem, margem + 5 + altura + altura * (math.min(self.limiteItens, #self.itens)+1)), tostring(itemSelecionado.descricao), Color(255,255,255), size)
	end
	
end


class 'ItemPlus'

function ItemPlus:__init(args)
	

	self.texto = "Item"
	self.textoSecundario = ""
	self.descricao = ""
	
	self.active = true
	
	self.lista = nil
	self.valor = nil
	
	if args then
	
		if args.texto then
			self.texto = args.texto
		end
		
		if args.descricao then
			self:SetDescricao(args.descricao)
		end
		
		if args.textoSecundario then
			self.textoSecundario = args.textoSecundario
		end		
		
		if args.valor then
			self.valor = args.valor
		end
		
	end

end


function ItemPlus:SetActive(arg)

	self.active = arg
end


function ItemPlus:GetLista()

	return self.lista
end


function ItemPlus:SetLista(arg)

	self.lista = arg
end


function ItemPlus:SetValor(arg)

	self.valor = arg
end


function ItemPlus:SetTextoSecundario(arg)

	self.textoSecundario = arg
end


function ItemPlus:SetTexto(arg)

	self.texto = arg
end


function ItemPlus:SetDescricao(msg)

	local arrayMensagens = tostring(msg):split(" ")
	local msgFormatada = ""
	local linha = ""
	
	for i = 1, #arrayMensagens do
	
		if arrayMensagens[i]:find("\n") then
		
			arrayMensagens[i] = string.gsub(arrayMensagens[i], "\n", "")
			msgFormatada = msgFormatada .. "\n" .. linha
			linha = ""
		else
		
			if Render:GetTextWidth(linha .." ".. arrayMensagens[i]) >= 250 then
				if msgFormatada == "" then
					msgFormatada = linha 
				else
					msgFormatada = msgFormatada .. "\n" .. linha 
				end
				linha = ""
			end
		end
		
		linha = linha .. arrayMensagens[i].. " "
		
	end
	
	if string.len(linha) > 0 then
		msgFormatada = msgFormatada .. "\n" .. linha
	end

	self.descricao = msgFormatada
	

end
