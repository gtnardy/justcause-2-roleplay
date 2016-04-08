class 'TelaFretes'

function TelaFretes:__init()

	self.active = false
	
	self.posicao = Vector2(0, 20)
	self.tamanho = Vector2(Render.Width / 1.7, Render.Height / 1.2 )
	self.tamanhoCategoria = Render.Size / 10
	
	self.margem = 3
	
	
	self.categoriaAtual = 1
	self.categoriaAtualObj = nil
	
	self.categoriaAtualMenu = 1

	self.categoriasVeiculos = CategoriaVeiculos()
	
	self.mapa = Mapa()
	
	self.categorias = {}
	
	self.corFundo = Color(13, 12, 13, 190)
	
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("KeyDown", self, self.KeyDown)
	Events:Subscribe("PostRender", self, self.Render)
	Events:Subscribe("AtualizarSpots", self, self.AtualizarSpots)

	
	self.markers = {}
	self.markers[1] = Image.Create(AssetLocation.Base64, "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")
	
	
	self.flags = {}
	self.flags[1] = Image.Create(AssetLocation.Base64, "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")
	
	self.flags[2] = Image.Create(AssetLocation.Base64, "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")
	self.flags[3] = Image.Create(AssetLocation.Base64, "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")
	
	-- self.flags[1] = Image.Create(AssetLocation.Base64, "")
	
	-- self.valoresMercadorias = {
	
		-- "Baixo", "Razoavel", "Medio", "Alto", "Muito Alto"
	-- }
	
	-- self.flags[1] = Image.Create(AssetLocation.Base64, "")
	
	
	self.spotsEntregas = {} -- indexes

end


function TelaFretes:Render()

	if Game:GetState() == GUIState.Game then
		if self.categoriaAtualObj then
			self.categoriaAtualObj:SetVisivel(self.active)
		end
		
		if self.active and self.categoriaAtualObj then

			if not self.mapa then return end
			self.tamanho = Vector2(Render.Width / 1.4, Render.Height / 1.2 )
			self.tamanhoCategoria = Vector2(Render.Width / 16, Render.Height / 9)
			
			local posFundo = Vector2(0, self.tamanhoCategoria.y) + Render.Size / 2 - self.tamanho / 2
			
			-- Borda Fundo
			Render:FillArea(posFundo - Vector2(self.margem, self.margem), self.tamanho + Vector2(self.margem, self.margem) * 2 - Vector2(0, self.tamanhoCategoria.y), Color(0,0,0,100))
			
			-- Fundo
			Render:FillArea(posFundo, self.tamanho - Vector2(0, self.tamanhoCategoria.y), Color(5,37,47))
			
			-- Mapa
			
			self.mapa:SetSize(self.tamanho - Vector2(0, self.tamanhoCategoria.y))
			self.mapa:SetPosition(posFundo + Vector2(self.tamanho.x - self.mapa:GetSize().x, 0))
			self.mapa:Draw()
			
			-- Categorias
			-- local quantidade = 8

			if #self.categorias > 4 then
				self.tamanhoCategoria.x = (self.tamanho.x - self.margem * #self.categorias * 3) / #self.categorias
			else
				self.tamanhoCategoria.x = Render.Width / 16
			end
			
			for c = 1, #self.categorias do
				
				local cor = Color(218, 223, 225, 50)
				if c == self.categoriaAtual then
					cor = cor + Color(0,0,0,150)
				end
				
				local pos = posFundo - Vector2(-(c-1) * (self.tamanhoCategoria.x + self.margem * 3) - self.margem, self.tamanhoCategoria.y)
				Render:FillArea(pos - Vector2(self.margem, self.margem), self.tamanhoCategoria + Vector2(self.margem * 2, self.margem), Color(5,5,5, 100))
				Render:FillArea(pos, self.tamanhoCategoria, cor)

				if self.categorias[c].imagem then
					
					self.categorias[c].imagem:SetPosition(posFundo - Vector2(-(c-1) * (self.tamanhoCategoria.x + self.margem * 3) - self.margem - self.tamanhoCategoria.x / 2 + self.categorias[c].imagem:GetSize().x / 2, self.tamanhoCategoria.y - self.margem))
					self.categorias[c].imagem:Draw()
					
				end
				
				-- Render:DrawText(pos + Vector2(self.tamanhoCategoria.x / 2, 0), tostring(self.categorias[c].nome), Color(1,1,1))
			end
			
			-- Fundo Itens
			
				-- Borda Fundo Itens
				-- Render:FillArea(posFundo + Vector2(self.tamanho.x / 20, 0) - Vector2(self.margem, 0), Vector2(self.margem * 2, self.margem) + Vector2(self.tamanho.x / 3, (self.tamanho.y - self.tamanhoCategoria.y)  / 1.5), Color(0, 0, 0, 50))
				
			local alturaEntrega = 45

			Render:FillArea(posFundo + Vector2(self.tamanho.x / 20, 0) - Vector2(self.margem * 2, 0), Vector2(self.tamanho.x / 3, alturaEntrega / 2) + Vector2(self.margem * 4, self.margem), Color(0, 0, 0, 125))
			
			local size = 15
			for _, e in pairs(self.categoriaAtualObj.entregas) do
			
				local cor = Color(0, 0, 0, 50)
				if _ == self.categoriaAtualObj.entregaSelecionada then
					cor = Color(218,220,225, 100)
				end
				
				local posItem = posFundo + Vector2(self.tamanho.x / 20, alturaEntrega / 2 + self.margem +(_-1) * (alturaEntrega + self.margem))
				Render:FillArea(posItem - Vector2(self.margem, 0), Vector2(self.tamanho.x / 3, alturaEntrega) + Vector2(self.margem * 2, self.margem), Color(0,0,0,50))
				Render:FillArea(posItem, Vector2(self.tamanho.x / 3, alturaEntrega), cor)
				
				
				self:DrawShadowText(posItem + Vector2(self.tamanho.x / 3 / 2 - Render:GetTextWidth(tostring(e.mercadoria.nome), size) / 2, self.margem), tostring(e.mercadoria.nome), Color(249, 105, 14), size)
				
				local txtExpiracao = "Expiracao: ".. tostring(e.tempo).. " min"
				self:DrawShadowText(posItem + Vector2(self.margem, alturaEntrega - Render:GetTextHeight(txtExpiracao, size)), txtExpiracao, Color(255, 248, 238), size)

				local txtPagamento = "R$ ".. tostring(e.capacidadeMinima * e.pagamento).." +"
				self:DrawShadowText(posItem + Vector2(self.tamanho.x / 3 - Render:GetTextWidth(txtPagamento, size) - self.margem, alturaEntrega - Render:GetTextHeight(txtPagamento, size)), txtPagamento, Color(249, 105, 14), size)
					
				local txtPagamentoKm = " (R$ "..tostring(math.floor((e.capacidadeMinima * e.pagamento) / (e.distancia / 1000) )) .. " / km)"
				self:DrawShadowText(posItem + Vector2(self.tamanho.x / 3 - Render:GetTextWidth(txtPagamentoKm, size - 3) - self.margem, alturaEntrega - Render:GetTextHeight(txtPagamento, size)  - Render:GetTextHeight(txtPagamentoKm, size - 3)), txtPagamentoKm, Color(255, 248, 238), size - 3)
				
			end
			
			-- informacoes
			Render:FillArea(posFundo + Vector2(self.tamanho.x / 20, self.tamanho.y - self.tamanhoCategoria.y - alturaEntrega / 2) - Vector2(self.margem * 2, 0), Vector2(self.tamanho.x / 3, alturaEntrega / 2) + Vector2(self.margem * 4, 0), Color(0, 0, 0, 125))

		
			local posMapaPlayer = self.mapa:Vector3ParaMapa(LocalPlayer:GetPosition())

			self.markers[1]:SetPosition(posMapaPlayer - Vector2(self.markers[1]:GetSize().x / 3, self.markers[1]:GetSize().y))
			self.markers[1]:Draw()
			local entregaSelecionada = self.categoriaAtualObj:GetEntregaSelecionada()
			
			if entregaSelecionada then
				-- Render:FillCircle(self.mapa:Vector3ParaMapa(entregaSelecionada.descargas[1]), 3, Color(255,0,0))
				for iE = 1, #entregaSelecionada.descargas do
					
					if iE == 1 then
						self.flags[1]:SetPosition(self.mapa:Vector3ParaMapa(entregaSelecionada.descargas[1]) - Vector2(0, self.flags[1]:GetSize().y))
						self.flags[1]:Draw()
					else
						if iE == #entregaSelecionada.descargas then
							self.flags[3]:SetPosition(self.mapa:Vector3ParaMapa(entregaSelecionada.descargas[iE]) - Vector2(0, self.flags[3]:GetSize().y))
							self.flags[3]:Draw()
						else
							self.flags[2]:SetPosition(self.mapa:Vector3ParaMapa(entregaSelecionada.descargas[iE]) - Vector2(0, self.flags[2]:GetSize().y))
							self.flags[2]:Draw()
						end
					end
					
				end
				
				local posDescricao = posFundo + Vector2(self.tamanho.x / 20, self.tamanho.y - self.tamanhoCategoria.y - alturaEntrega / 2 - alturaEntrega * 1.5)
				
				Render:FillArea(posDescricao - Vector2(self.margem, self.margem), Vector2(self.tamanho.x / 3, alturaEntrega * 2.1) + Vector2(self.margem * 2, 0), Color(0, 0, 0, 50))
				
				
				local sizeDescricao = size - 2
				
				local txtDistancia = "Percurso: "
				self:DrawShadowText(posDescricao, txtDistancia, Color(255, 248, 238), sizeDescricao)
				self:DrawShadowText(posDescricao + Vector2(Render:GetTextWidth(txtDistancia, sizeDescricao), 0), tostring(entregaSelecionada.distancia).."m", Color(249, 105, 14), sizeDescricao)
							
				posDescricao = posDescricao + Vector2(0, Render:GetTextHeight(txtDistancia, sizeDescricao) )
				local txtValorMercadoria = "Valor da Mercadoria: "
				self:DrawShadowText(posDescricao, txtValorMercadoria, Color(255, 248, 238), sizeDescricao)
				self:DrawShadowText(posDescricao + Vector2(Render:GetTextWidth(txtValorMercadoria, sizeDescricao), 0), "R$ "..tostring(entregaSelecionada.mercadoria.valor) .. " / kilo", Color(249, 105, 14), sizeDescricao)
				-- self:DrawShadowText(posFundo + Vector2(self.tamanho.x / 20 + Render:GetTextWidth(txtValorMercadoria, sizeDescricao) + Render:GetTextWidth("R$ "..tostring(entregaSelecionada.mercadoria.valor), sizeDescricao), Render:GetTextHeight(txtDistancia, sizeDescricao) + self.margem + self.tamanho.y - self.tamanhoCategoria.y - alturaEntrega / 2 - alturaEntrega * 1.5), " / kilo", Color(255, 248, 238), sizeDescricao)
				
				posDescricao = posDescricao + Vector2(0, Render:GetTextHeight(txtValorMercadoria, sizeDescricao))
				local txtTipoMercadoria = "Tipo da Mercadoria: "
				self:DrawShadowText(posDescricao, txtTipoMercadoria, Color(255, 248, 238), sizeDescricao)
				self:DrawShadowText(posDescricao + Vector2( Render:GetTextWidth(txtTipoMercadoria, sizeDescricao), 0), tostring(entregaSelecionada.mercadoria.nomeTipoMercadoria), Color(249, 105, 14), sizeDescricao)
				
				posDescricao = posDescricao + Vector2(0, Render:GetTextHeight(txtTipoMercadoria, sizeDescricao) )
				local txtPagamentoKilo = "Pagamento por kilo: "
				self:DrawShadowText(posDescricao, txtPagamentoKilo, Color(255, 248, 238), sizeDescricao)
				self:DrawShadowText(posDescricao + Vector2( Render:GetTextWidth(txtPagamentoKilo, sizeDescricao), 0), "R$ "..tostring(entregaSelecionada.pagamento), Color(249, 105, 14), sizeDescricao)
				
							
				posDescricao = posDescricao + Vector2(0, Render:GetTextHeight(txtPagamentoKilo, sizeDescricao) )
				local txtPagamento = "Pagamento por ".. entregaSelecionada.capacidadeMinima  .." Kg (minimo) de mercadoria: "
				self:DrawShadowText(posDescricao, txtPagamento, Color(255, 248, 238), sizeDescricao)
				self:DrawShadowText(posDescricao + Vector2( Render:GetTextWidth(txtPagamento, sizeDescricao), 0), "R$ "..tostring(entregaSelecionada.capacidadeMinima * entregaSelecionada.pagamento) .. "", Color(249, 105, 14), sizeDescricao)
				
				
				
			end
		


			
					-- if tonumber(m.idCategoria) == tonumber(self.categorias[self.categoriaAtual].idCategoria) then

			
			Render:FillArea(posFundo - Vector2(0, self.margem), Vector2(self.tamanho.x, self.margem), Color(5,5,5,200))
		end
	end

end


function TelaFretes:DrawShadowText(pos, text, cor, size)
	
	if not size then
		size = 15
	end
	Render:DrawText(Vector2(1,1) + pos, text, Color(0,0,0,120), size)
	Render:DrawText(pos, text, cor, size)


end


function TelaFretes:KeyDown(args)

	if args.key == string.byte("P") then

		self:SetActive(not self:GetActive())
		
	end
	

	if self.active then
		
		-- left
		if args.key == 37 then
			
			if self.categoriaAtual > 1 then
				self.categoriaAtual = self.categoriaAtual - 1
			else
				self.categoriaAtual = #self.categorias
			end
			
			
		end
		
		-- right
		if args.key == 39 then
			
			if self.categoriaAtual < #self.categorias then
				self.categoriaAtual = self.categoriaAtual + 1
			else
				self.categoriaAtual = 1
			end
			
		end
		
		if self.categoriaAtualObj then
			self.categoriaAtualObj:SetActive(false)
		end
		
		self.categoriaAtualObj = self.categorias[self.categoriaAtual]
		
		if self.categoriaAtualObj then
			self.categoriaAtualObj:SetActive(true)
		end
		

	end
	
end

function TelaFretes:SetActive(boo)
	
	self.active = boo

end


function TelaFretes:GetActive()

	return self.active

end


function TelaFretes:Limpar()

	self.categorias = {}
	self.itens = {}

end


function TelaFretes:AddCategoria(args)

	table.insert(self.categorias, CategoriaFrete(args))

end


function TelaFretes:AtualizarSpots()

	for _, args in ipairs(self.spotsEntregas) do
		Events:Fire("AddSpot", args)
	
	end
end


function TelaFretes:ModuleUnload()

	for _, args in ipairs(self.spotsEntregas) do
		Events:Fire("DeleteSpot", {index = args.index, grupo = args.grupo})
	
	end

end


function TelaFretes:AddSpot(args)

	table.insert(self.spotsEntregas, args)
	Events:Fire("AddSpot", args)


end


function TelaFretes:SetEntregas(entregas)

	self:ModuleUnload()
	
	for _, e in pairs(entregas) do
		
		local argsSpot = {}
		
		for _2, m in pairs(e.mercadorias) do
			
			for _3, c in pairs(self.categorias) do

				if tonumber(m.idCategoria) == c.idCategoria then
					-- if self.valoresMercadorias[tonumber(m.valor)] then
						-- m.valor = self.valoresMercadorias[tonumber(m.valor)]
					-- end	
					
					local pagamento = self:GetPagamento(e.distancia, m.valor, e.pagamento)
					local capacidadeMinima = self:GetCapacidadeMinimaCategoria(c.idCategoria)
					
					argsSpot.nome = "Entrega de ".. m.nome
					argsSpot.descricao = "Percurso: "..e.distancia .."m\nPagamento: R$".. capacidadeMinima * pagamento
					argsSpot.posicao = e.descargas[1]
					
					argsSpot.idImagem = 1
					argsSpot.grupo = "entrega"
					argsSpot.index = _
					
					c:AddEntrega(Entrega({id = e.id, descargas = e.descargas, pagamento = pagamento, mercadoria = m, tempo = e.tempo, distancia = e.distancia, pagamentoMercadoria = self:GetPagamentoMinimoMercadoria(m, c.idCategoria), capacidadeMinima = capacidadeMinima}))
				end
			
			end
		
		end
		
		self:AddSpot(argsSpot)
				--AddSpot-- args: descricao, nome, posicao, imagem, index
	end
	

end


function TelaFretes:GetPagamento(distancia, valorMercadoria, percentual)

	return math.floor(tonumber(distancia) / 1000 * valorMercadoria * tonumber(percentual) * 10)  / 10
	
end



function TelaFretes:GetCapacidadeMinimaCategoria(c)

	if self.categoriasVeiculos then
	
		return self.categoriasVeiculos:GetCapacidadeCategoriaMenor(tonumber(c))
	
	else
		return 0
	end
	
end


function TelaFretes:GetPagamentoMinimoMercadoria(m, c)

	if self.categoriasVeiculos then


		return self.categoriasVeiculos:GetCapacidadeCategoriaMenor(tonumber(c)) * tonumber(m.valor)
	
	else
		return -1
	end

end


function TelaFretes:GetCategoriaAtual()
	if self.categorias[self.categoriaAtual] then
		return self.categorias[self.categoriaAtual].idCategoria
	end

end


function TelaFretes:GetPosition()

	return self.posicao

end