class 'ListaPlus'


function ListaPlus:__init(herdado)

	
	self.itens = {}
	self.itemSelecionado = 1
	self.maxColunas = 8
	self.posicao = Vector2(0,0)
	self.posicaoHerdada = Vector2(0,0)
	self.tamanho = Vector2(270,30)		
	self.menuHerdado = false
	self.listaHerdada = false
	self.rodape = true
	self.timer = Timer()
	
	if herdado then
		if herdado:GetTipo() == "menu" then
			self.menuHerdado = herdado
		else
			if herdado:GetTipo() == "lista" then
				self.listaHerdada = herdado
			end
		end

	end
	
	self.corItemFundoSelecionada = Color(255,255,255)	
	self.corItemFundo = Color(0,0,0)
	
	self.corItemTexto = Color(255,255,255)
	self.corItemTextoDesativado = Color(168,168,168)
	self.corItemTextoSelecionado = Color(0,0,0)
	
	self.tamanhoItemTexto = 15
	self.margem = 15
	
	self.tituloSub = "SubMenu"
	
	self.visivel = false
	self.ativo = false

	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("KeyDown", self, self.KeyDown)
	
end


function ListaPlus:SetRodape(args)

	self.rodape = args

end


function ListaPlus:GetAtivo()

	return self.ativo

end


function ListaPlus:GetTamanhoTexto()

	return self.tamanhoItemTexto

end


function ListaPlus:GetTamanho()

	return self.tamanho

end


function ListaPlus:GetPosicaoHerdada()

	return self.posicaoHerdada

end


function ListaPlus:GetPosicao()

	return self.posicao

end


function ListaPlus:GetTipo()

	return "lista"

end


function ListaPlus:KeyDown(args)

	if self.ativo and self.visivel then
	-- Chat:Print(tostring(self.timer:GetMilliseconds()), Color(1,1,1))
	

		if args.key == 38 then
		
			if self.itemSelecionado > 1 then
				self.itemSelecionado = self.itemSelecionado - 1
				
				Events:Fire("ItemAlterado", {self.itens[self.itemSelecionado]:GetValor(), self.itens[self.itemSelecionado]:GetTexto(), self.itens[self.itemSelecionado]:GetDescricao(), self.itemSelecionado})
		
			end
			
		end	
		
		
		if args.key == 40 then
		
			if self.itemSelecionado < #self.itens then
				self.itemSelecionado = self.itemSelecionado + 1
				
				Events:Fire("ItemAlterado", {self.itens[self.itemSelecionado]:GetValor(), self.itens[self.itemSelecionado]:GetTexto(), self.itens[self.itemSelecionado]:GetDescricao(), self.itemSelecionado})
						
			end
			
		end	
		
	
		if args.key == 13 then
			
			if self.listaHerdada and self.listaHerdada:GetAtivo() then
				return
			end
			
			self:Confirmado()

		end				
	
		if args.key == 39 then
			
			self:ProximoMenu()
			
		end		
		
		if args.key == 37 then
			
			self:Retorno()
			
		end	
		
		
	end


end


function ListaPlus:Render()

	if self.menuHerdado then
		 if not (self.menuHerdado:GetAtivo()) then
			self.visivel = false
			self.ativo = false
			-- else
		-- self.visivel = self.menuHerdado:GetAtivo()	
		-- self.ativo = self.menuHerdado:GetAtivo()
		 end	
	end
	
	if self.listaHerdada then
	
		if not (self.listaHerdada:GetVisivel()) then
			self.visivel = false
			self.ativo = false
		end
		
	end
	
	if self.visivel then
	
		if self.menuHerdado then
			self.posicaoHerdada = self.menuHerdado:GetPosicao() + Vector2(0, self.menuHerdado:GetTamanho().y)
			self.tamanho = Vector2(self.menuHerdado:GetTamanho().x, self.tamanho.y)
		end	
		
		if self.listaHerdada then

			self.posicaoHerdada = self.listaHerdada:GetPosicao() + Vector2(self.listaHerdada:GetTamanho().x, 0) + self.listaHerdada:GetPosicaoHerdada()
			self.tamanho = self.listaHerdada:GetTamanho()
		end
	
		Render:FillArea(self.posicaoHerdada + self.posicao, self.tamanho, self.corItemFundo - Color(0,0,0,100))
		Render:DrawText(self.posicaoHerdada + self.posicao + Vector2(self.margem, Render:GetTextHeight(self.tituloSub, self.tamanhoItemTexto) / 2), self.tituloSub, self.corItemTexto, self.tamanhoItemTexto)
					
					
		local colunas = #self.itens
		
	
		if #self.itens > self.maxColunas then
			colunas = self.maxColunas
		
		end	
		
		Render:FillArea(self.posicaoHerdada + Vector2(self.posicao.x, self.posicao.y + self.tamanho.y * (colunas + 1)), self.tamanho, self.corItemFundo - Color(0,0,0,100))
		
		if #self.itens > self.maxColunas then
		
			Render:DrawText(self.posicaoHerdada + Vector2(self.posicao.x, self.posicao.y + self.tamanho.y * (colunas + 1)) + self.tamanho / 2 - Render:GetTextSize("...", 25) / 2, "...", Color(255,255,255), 25)
		
		end	
		

		if self.rodape then
			Render:FillArea(self.posicaoHerdada + Vector2(self.posicao.x, self.posicao.y + self.tamanho.y * (colunas + 2)+ 2), Vector2(self.tamanho.x, 3), Color(255,255,255,200))	
			
			if self.itens[self.itemSelecionado] then
				Render:FillArea(self.posicaoHerdada + Vector2(self.posicao.x, self.posicao.y + self.tamanho.y * (colunas + 2)+ 5), Vector2(self.tamanho.x, Render:GetTextHeight(self.itens[self.itemSelecionado]:GetDescricao(), self.tamanhoItemTexto)) + Vector2(0, self.margem * 2), self.corItemFundo - Color(0,0,0,100))
				Render:DrawText(self.posicaoHerdada + Vector2(self.posicao.x, self.posicao.y + self.tamanho.y * (colunas + 2)+ 5) + Vector2(self.margem, self.margem), self.itens[self.itemSelecionado]:GetDescricao(), self.corItemTexto, self.tamanhoItemTexto)
			else
				Render:FillArea(self.posicaoHerdada + Vector2(self.posicao.x, self.posicao.y + self.tamanho.y * (colunas + 2)+ 5), self.tamanho, self.corItemFundo - Color(0,0,0,100))		
			end
		end
					
		for l = 1, #self.itens do
		
			if l > self.maxColunas then
				return
			end

			
			local atual = l			
			
			if self.itemSelecionado >= self.maxColunas then
				atual = atual + (self.itemSelecionado - (self.maxColunas))
			end			
			
			if not self.itens[atual] then
				return
			end
			
			corT = self.corItemTexto
			corF = self.corItemFundo - Color(0,0,0,125)
			
			if atual == self.itemSelecionado then
				corT = self.corItemTextoSelecionado
				corF = self.corItemFundoSelecionada
			end
			
			if not self.itens[atual]:GetAtivo() then
				corT = self.corItemTextoDesativado
			end
			
			Render:FillArea(self.posicaoHerdada + Vector2(self.posicao.x, self.posicao.y + self.tamanho.y * (l)), self.tamanho, corF)
			Render:DrawText(self.posicaoHerdada + Vector2(self.posicao.x, self.posicao.y + self.tamanho.y * (l)) + Vector2(self.margem, Render:GetTextHeight(self.itens[atual]:GetTexto(), self.tamanhoItemTexto) / 2), self.itens[atual]:GetTexto(), corT, self.tamanhoItemTexto)
			
			if self.itens[atual]:GetTexto2() then
				Render:DrawText(self.posicaoHerdada + Vector2(self.tamanho.x - Render:GetTextWidth(self.itens[atual]:GetTexto2(), self.tamanhoItemTexto), self.tamanho.y * (l)) + Vector2(-self.margem, Render:GetTextHeight(self.itens[atual]:GetTexto(), self.tamanhoItemTexto) / 2), self.itens[atual]:GetTexto2(), corT, self.tamanhoItemTexto)			
			end
		
		end	

		
	end

end


function ListaPlus:Retorno()
	
	if self.listaHerdada then
		self:SetAtivo(false)
		self:SetVisivel(false)
		self.listaHerdada:SetAtivo(true)
	end

end


function ListaPlus:ProximoMenu()

	if not self.ativo then
		return
	end
	
	local item = self.itens[self.itemSelecionado]
	
	if not item then
		return false
	end
	
	local lista = item:GetLista()
	
	if lista then
		self:SetAtivo(false)
		lista:SetVisivel(true)
		lista:SetAtivo(true)
	end
	
	if self.listaHerdada then
		self.listaHerdada:SetAtivo(false)
	end

end


function ListaPlus:Enter()

	if not self.ativo then
		return
	end
	
	if self.listaHerdada and self.listaHerdada:GetAtivo() then
		return
	end	
	
	local item = self.itens[self.itemSelecionado]
	
	if not item then
		return false
	end
		
	if item:GetLista() then

		self:ProximoMenu()	
		
	else
		
		self:Confirmado()	
		
	end



end


function ListaPlus:Confirmado()
	
	if self.itens[self.itemSelecionado] and not self.itens[self.itemSelecionado]:GetLista() then

		Events:Fire("ItemSelecionado", {self.itens[self.itemSelecionado]:GetValor(), self.itens[self.itemSelecionado]:GetTexto(), self.itens[self.itemSelecionado]:GetDescricao(), self.itemSelecionado})
		
	end

end


function ListaPlus:SetAtivo(booleano)

	self.ativo = booleano

end


function ListaPlus:GetVisivel()

	return self.visivel

end


function ListaPlus:SetVisivel(booleano)

	self.visivel = booleano

end


function ListaPlus:SetTituloSub(texto)

	self.tituloSub = texto

end


function ListaPlus:SetCorSelecionada(color)

	self.corSelecionada = color

end


function ListaPlus:SetTamanho(vector2)

	self.tamanho = Vector2(vector2.x, vector2.y)

end


function ListaPlus:SetMaxColunas(num)

	self.maxColunas = num

end


function ListaPlus:SetPosicao(vector2)

	self.posicao = Vector2(vector2.x, vector2.y)

end


function ListaPlus.GetItemById(pos)

	if self.itens[pos] then
		return self.itens[pos]
	else
		return nil
	end

end


function ListaPlus:AddItem(pos, texto)

	self.itens[pos] = ItemPlus()
	self.itens[pos]:SetTexto(texto)
	return self.itens[pos]

end
