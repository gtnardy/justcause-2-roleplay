class 'Progresso'

function Progresso:__init()

	self.active = false
	self.posicao = Vector2(100, 150)
	self.tamanho = Render.Size - Vector2(200, 300)
	self.linhaCategorias = {} -- {cat1, cat2}

	self.ultimoMeiaTela = false
	self.ultimaTelaAltura = nil
	
	Events:Subscribe("MouseScroll", self, self.MouseScroll)
	Events:Subscribe("PostRender", self, self.Render)
	alturaScroll = 0
	self.alturaTela = 0
end


function Progresso:SetCategoria(categoria, i, posicao)

	if not self.linhaCategorias[i] then
		self.linhaCategorias[i] = {}
	end
	self.linhaCategorias[i][posicao] = categoria
end


function Progresso:MouseScroll(args)

	if (self.active) then
		alturaScroll = math.min(math.max(-self.alturaTela + self.tamanho.y, alturaScroll + args.delta * 15), 0)

	end

end


function Progresso:AddCategoria(categoria)

	local ultimaLinha = self.linhaCategorias[#self.linhaCategorias]
	
	if ( ultimaLinha and not ultimaLinha[2]) then
	
		ultimaLinha[2] = categoria

	else
		table.insert(self.linhaCategorias, {categoria})
	end

	
end


function Progresso:Render()

	if (self.active) then
	
		Render:FillArea(Vector2(0, 0), Render.Size,Color(0, 41, 57, 200))
		
		self.tamanho = Render.Size - Vector2(200, 200)
		
		local pos = Vector2(0, 0)
		local espacamentoMeio = 20
		t2 = Transform2()
		t2:Translate(self.posicao + Vector2(0, alturaScroll))
		Render:SetTransform(t2)
		Render:SetClip(true, self.posicao, self.tamanho)
		
		local heightTitulo = 25
		self.ultimoMeiaTela = true
		
		for c, linhaCategoria in ipairs(self.linhaCategorias) do
		
			pos.x = 0
			local categoriaEsquerda = linhaCategoria[1]
			local categoriaDireita = linhaCategoria[2]

			local altura = categoriaEsquerda:GetAltura()

			if (categoriaDireita) then
				alturaDireita = categoriaDireita:GetAltura()
				if alturaDireita > altura then
					altura = alturaDireita
				end
			end
			

			-- local largura = self.tamanho.x
			local largura = self.tamanho.x / 2 - espacamentoMeio / 2
			if (categoriaEsquerda.meiaTela) then
			
				categoriaEsquerda:Render(pos, largura, Vector2(largura, altura))
				
			else
				categoriaEsquerda:Render(pos, largura, Vector2(self.tamanho.x, altura))

			end
			
			if (categoriaDireita) then
				pos.x = self.tamanho.x / 2 + espacamentoMeio / 2
				if (categoriaDireita.meiaTela) then
					categoriaDireita:Render(pos, largura, Vector2(self.tamanho.x, altura))
				else
					categoriaDireita:Render(pos, largura, Vector2(self.tamanho.x, altura), true)
				end
			end
			
			pos.y = pos.y + altura + espacamentoMeio
			-- if (pos.y - self.alturaTela > self.tamanho.y) then 

				-- break
			-- end

		end
		
		if (textoLegenda) then

			Render:FillArea(Vector2(Render.Width / 2 - Render:GetTextWidth(textoLegenda, 16) / 2, Render.Height - 150 - alturaScroll) - Vector2(100, 150) - Vector2(5, 5), Render:GetTextSize(textoLegenda, 16) + Vector2(10, 10), Color(0,0,0,150))
			DrawTextSombreado(Vector2(Render.Width / 2 - Render:GetTextWidth(textoLegenda, 16) / 2, Render.Height - 150 - alturaScroll) - Vector2(100, 150), textoLegenda, Color(255,255,255), 16)
		end
		
		textoLegenda = nil
		
		self.alturaTela = pos.y
		--alturaScroll

		-- local posBarra = (alturaScroll * self.tamanho.y) / self.alturaTela
		-- Render:FillArea(Vector2(self.tamanho.x - 5, posBarra), Vector2(5, 10), Color(230,230,230))
		Render:SetClip(false)
		Render:ResetTransform()
		
	end

end

function Progresso:GetActive()

	return self.active

end


function Progresso:SetActive(boo)

	self.active = boo

end

class 'Categoria'

function Categoria:__init(args)

	self.titulo = "TITULO"
	self.tituloSize = 18
	self.cor = Color(255,255,255)
	self.altura = 50
	self.itens = {}
	self.meiaTela = false
	self.espacamento = 20
	
	if (args) then
		if (args.titulo) then self.titulo = args.titulo end
		if (args.cor) then self.cor = args.cor end
		if (args.meiaTela) then self.meiaTela = args.meiaTela end
		if (args.itens) then 
			for i, item in ipairs(args.itens) do
				self:AddItem(item)
			end
		end
	end

end


function Categoria:GetAltura()

	return self.altura
end


function Categoria:AddItem(item)

	table.insert(self.itens, item)
	self.altura = self.altura + item:GetAltura() + self.espacamento 
end


function Categoria:Render(posicao, larguraConteudo, tamanho, conjunta)
	
	local pos = Vector2(posicao.x, posicao.y)
	local heightTitulo = 25
	if (not conjunta) then
		Render:FillArea(pos, Vector2(tamanho.x, heightTitulo), Color(0, 0, 0))

		-- Quadrado em volta titulo
		Render:FillArea(pos - Vector2(0,1), Vector2(Render:GetTextWidth(self.titulo, self.tituloSize) + 13, heightTitulo + 2), self.cor)
		Render:FillArea(pos + Vector2(2, 2), Vector2(Render:GetTextWidth(self.titulo, self.tituloSize), heightTitulo) - Vector2(-9, 4), Color(0, 0, 0))
				
		-- Titulo
		DrawTextSombreado(pos + Vector2(6, heightTitulo/2 + 2 - Render:GetTextHeight(self.titulo, self.tituloSize) / 2), self.titulo, self.cor, self.tituloSize)
						
		Render:FillArea(pos + Vector2(0, heightTitulo), tamanho + Vector2(0, - heightTitulo), Color(0,0,0, 100))

		Render:FillArea(pos + Vector2(0, heightTitulo + 10), Vector2(3, tamanho.y - heightTitulo - 10), self.cor)
	end
	
	pos.y = pos.y + heightTitulo * 2
	
	local alturaTotalItens = 0
	
	for i, item in ipairs(self.itens) do
	
		local alturaItem = item:GetAltura()
		item:Render(pos, larguraConteudo)
		alturaTotalItens = alturaTotalItens + alturaItem + self.espacamento
		pos.y = pos.y + self.espacamento + alturaItem

	end
	
	self.altura = alturaTotalItens + heightTitulo * 2
end

class 'Item'

function Item:__init(args)

	self.texto = "ITEM"
	self.cor = Color(255,255,255)
	self.experiencia = 0
	self.experienciaNecessaria = 0
	self.contadorAtual = 0
	self.contadorMaximo = 0
	self.exibirBarra = false
	self.posicao = Vector2(0, 0)
	self.tamanhoTexto = 16
	self.altura = 0
	self.alturaDesbloqueios = 0
	self.espacamento = 0
	self.desbloqueios = {}
	self.imagem = nil
	self.active = false
		
	if (args) then
		if (args.texto) then self.texto = args.texto end
		if (args.cor) then self.cor = args.cor end
		if (args.exibirBarra) then self.exibirBarra = args.exibirBarra end
		if (args.experiencia) then self.experiencia = args.experiencia end
		if (args.tamanhoTexto) then self.tamanhoTexto = args.tamanhoTexto end
		if (args.posicao) then self.posicao = args.posicao end
		if (args.experienciaNecessaria) then self.experienciaNecessaria = args.experienciaNecessaria end
		if (args.imagem) then self.imagem = args.imagem end
		if (args.active) then self.active = args.active end
		if (args.contadorMaximo) then self.contadorMaximo = args.contadorMaximo end
		if (args.contadorAtual) then self.contadorAtual = args.contadorAtual end
		if (args.desbloqueios) then self:SetDesbloqueios(args.desbloqueios) end

	end
	self:AtualizarAltura()
end


function Item:AtualizarAltura()
	
	self.altura = Render:GetTextHeight(self.texto, self.tamanhoTexto) + Render:GetTextHeight(self.contadorAtual .. "/"..self.contadorMaximo, self.tamanhoTexto) + self.espacamento
	
end


function Item:SetDesbloqueios(desbloqueios)
	for d, desbloq in ipairs(desbloqueios) do
		self:AddDesbloqueio(desbloq)
	end
end


function Item:AddDesbloqueio(desbloqueio)

	table.insert(self.desbloqueios, desbloqueio)
	if (desbloqueio.active) then
		self.contadorAtual = self.contadorAtual + 1
	end
	self.contadorMaximo = self.contadorMaximo + 1

end


function Item:GetAltura()

	return math.max(self.altura, self.alturaDesbloqueios)

end

function Item:Render(pos, largura)

	local width = Render:GetTextWidth(self.texto, self.tamanhoTexto)

	local posicao = pos + Vector2(Render.Width / 30, 0) + self.posicao
	
	local larguraMaxima = pos.x + largura - Render.Width / 30
	
	
	local posicaoDesbloqueio = Vector2(pos.x + largura / 2, pos.y)
	if (posicaoDesbloqueio.x <= posicao.x + width + 20) then
		posicaoDesbloqueio = Vector2(posicao.x + width + 20, pos.y)
	end

	local posicaoDesbloqueioDinamica = posicaoDesbloqueio
	
	local cor = self.cor
	if (not self.active) then
		cor = cor / 2
	end
	
	for d, desbloqueio in ipairs(self.desbloqueios) do
	
		if posicaoDesbloqueioDinamica.x >= larguraMaxima then
		
			posicaoDesbloqueioDinamica = Vector2(posicaoDesbloqueio.x, posicaoDesbloqueioDinamica.y + desbloqueio.tamanho.x + 3)
		end
		
		desbloqueio:Render(posicaoDesbloqueioDinamica, cor)
		posicaoDesbloqueioDinamica = posicaoDesbloqueioDinamica + Vector2(desbloqueio.tamanho.x + 3, 0)
		
	end

	self.alturaDesbloqueios = posicaoDesbloqueioDinamica.y - pos.y + 10
	
	if (self.exibirBarra) then
	
		local tamanhoBarra = self.experiencia * width / self.experienciaNecessaria
		Render:FillArea(posicao - Vector2(0, 6), Vector2(width, 3), cor / 2)
		Render:FillArea(posicao - Vector2(0, 6), Vector2(tamanhoBarra, 3), cor)
	end
	DrawTextSombreado(posicao, self.texto, cor, self.tamanhoTexto)
	
	posicao = posicao + Vector2(0, self.espacamento + Render:GetTextHeight(self.texto, self.tamanhoTexto))
	
	DrawTextSombreado(posicao, self.contadorAtual .. "/"..self.contadorMaximo, cor, self.tamanhoTexto)
	

end

class 'Desbloqueio' 


function Desbloqueio:__init(args)
	
	self.tamanho = Vector2(14, 14)
	self.active = false
	self.letra = ""

	if (args) then
		if (args.texto) then self.texto = args.texto end
		if (args.active) then self.active = args.active end
		if (args.letra) then self.letra = args.letra end
		if (args.render) then self.renderizar = args.render end

	end

end


function Desbloqueio:Render(pos, cor)
	
	if (not self.active) then cor = cor/ 2 end
	if self.renderizar then
	
		self.renderizar(pos, cor)
	else
		Render:FillArea(pos - self.tamanho / 2, self.tamanho , cor)
		if self.letra then
			DrawTextGrande(pos - Render:GetTextSize(self.letra, 14) / 2 + Vector2(0, 1), self.letra, Color(0,0,0), 14)
		end
	end
	
	if (self.texto) then
		local posMouse = Mouse:GetPosition() - Vector2(100, 150 + alturaScroll)
		local raio = self.tamanho.x / 2
		if (posMouse.x >= pos.x - raio and posMouse.x <= pos.x + raio and posMouse.y >= pos.y - raio and posMouse.y <= pos.y + raio) then
			textoLegenda = self.texto
		end
	end
	
end