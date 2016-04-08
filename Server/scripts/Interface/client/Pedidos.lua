class 'Pedidos'

function Pedidos:__init(mapa)

	self.active = false
	self.posicao = Vector2(100, 150)
	self.tamanho = Render.Size - Vector2(200, 300)
	self.mapa = mapa
	
	self.ultimaTelaAltura = nil
	
	self.pedidos = {}
	
	self:SetItem(1, {mercadoria = {nome = "MERCADORIA 1", id = 1, quantidade = 50}, fornecedor = {nome = "CARREGAMENTO 1", posicao = Vector3(0, 2000, 0)}, receptor = {nome = "DESCARREGAMENTO 1",posicao = Vector3(1000, 200, 1000)}})
	self:SetItem(2, {mercadoria = {nome = "MERCADORIA 2", id = 1, quantidade = 50}, fornecedor = {posicao = Vector3(0, 2000, 0)}, receptor = {posicao = Vector3(1000, 200, 1000)}})
	self:SetItem(3, {mercadoria = {nome = "MERCADORIA 3", id = 1, quantidade = 50}, fornecedor = {posicao = Vector3(0, 2000, 0)}, receptor = {posicao = Vector3(1000, 200, 1000)}})
	self:SetItem(4, {mercadoria = {nome = "MERCADORIA 4", id = 1, quantidade = 50}, fornecedor = {posicao = Vector3(0, 2000, 0)}, receptor = {posicao = Vector3(1000, 200, 1000)}})
	self:SetItem(5, {mercadoria = {nome = "MERCADORIA 4", id = 1, quantidade = 50}, fornecedor = {posicao = Vector3(0, 2000, 0)}, receptor = {posicao = Vector3(1000, 200, 1000)}})
	self:SetItem(6, {mercadoria = {nome = "MERCADORIA 4", id = 1, quantidade = 50}, fornecedor = {posicao = Vector3(0, 2000, 0)}, receptor = {posicao = Vector3(1000, 200, 1000)}})
	self:SetItem(7, {mercadoria = {nome = "MERCADORIA 4", id = 1, quantidade = 50}, fornecedor = {posicao = Vector3(0, 2000, 0)}, receptor = {posicao = Vector3(1000, 200, 1000)}})
	self:SetItem(8, {mercadoria = {nome = "MERCADORIA 10", id = 1, quantidade = 50}, fornecedor = {posicao = Vector3(0, 2000, 0)}, receptor = {posicao = Vector3(1000, 200, 1000)}})

	Events:Subscribe("MouseScroll", self, self.MouseScroll)
	Events:Subscribe("PostRender", self, self.Render)
	
	self.margem = 10
	self.alturaScroll = 0
	self.alturaTela = 0
end


function Pedidos:MouseScroll(args)

	if (self.active) then
		self.alturaScroll = math.min(math.max(-self.alturaTela + self.tamanho.y, self.alturaScroll + args.delta * 15), 0)
	end
end


function Pedidos:SetItem(i, args)

	self.pedidos[i] = ItemPedido(args)
	
end


function Pedidos:Render()

	if (self.active) then
	
		self.mapa:Render()
		
		--Render:FillArea(Vector2(0, 0), Render.Size,Color(0, 41, 57, 200))
		
		self.tamanho = Render.Size - Vector2(200, 200)
		
		local tamanhoItem = Vector2(self.tamanho.x / 2.5, 100)
		local posicaoItem = Vector2(self.tamanho.x - tamanhoItem.x, 0)
		
		t2 = Transform2()
		t2:Translate(self.posicao + Vector2(0, self.alturaScroll))
		Render:SetTransform(t2)
		Render:SetClip(true, self.posicao, self.tamanho)
		
		-- QUADRO INFORMATIVO
		--DrawQuadrado(Vector2(tamanhoItem.x + self.margem * 2, -self.alturaScroll), Vector2(self.tamanho.x - tamanhoItem.x, self.tamanho.y), "INFORMACOES", Color(255,255,0))
		
		
		
		for i, itemPedido in pairs(self.pedidos) do

			itemPedido:Render(posicaoItem, tamanhoItem)

			posicaoItem.y = posicaoItem.y + tamanhoItem.y + self.margem

		end
		
		self.alturaTela = posicaoItem.y

		Render:SetClip(false)
		Render:ResetTransform()
		
	end

end

function Pedidos:GetActive()

	return self.active

end


function Pedidos:SetActive(boo)

	self.active = boo

end


class 'ItemPedido'

function ItemPedido:__init(args)

	self.mercadoria = {id = 0, nome = "MERCADORIA", quantidade = 0}
	self.fornecedor = {nome = "CARREGADOR", posicao = Vector3(0, 0, 0)}
	self.receptor = {nome = "DESCARREGADOR", posicao = Vector3(0, 0, 0)}
	
	self.margem = 10
	
	self.tamanhoTitulo = 16
	self.cor = Color(253,173,1)
	self.tamanhoTexto = 15
	self.tempoRestante = 0
	self.pagamento = 0
	self.distancia = 1

	self.alturaTitulo = 25
	self.active = false
		
	if (args) then
		if (args.mercadoria) then self.mercadoria = args.mercadoria end
		if (args.fornecedor) then self.fornecedor = args.fornecedor end
		if (args.receptor) then self.receptor = args.receptor end
		if (args.distancia) then self.distancia = args.distancia end
		if (args.tempoRestante) then self.tempoRestante = args.tempoRestante end
		if (args.pagamento) then self.pagamento = args.pagamento end
	end
	
	
end


function ItemPedido:Render(posicao, tamanho)
	
	local titulo = tostring(self.mercadoria.nome) .. " (" ..tostring(self.mercadoria.quantidade) .. " kg)"
	self:DrawQuadrado(posicao, tamanho, titulo, self.cor)
	
	local textoTrajeto = tostring(self.fornecedor.nome) .. " -> "..tostring(self.receptor.nome)
	DrawTextSombreado(posicao + Vector2(tamanho.x / 2 - Render:GetTextWidth(textoTrajeto, self.tamanhoTexto) / 2, self.alturaTitulo + self.margem), textoTrajeto, Color(230, 230, 230), self.tamanhoTexto)
		
	local textoExpiracao1 = "Pedido expira em "
	DrawTextSombreado(posicao + Vector2(self.margem, tamanho.y - self.margem - Render:GetTextHeight(textoExpiracao1, self.tamanhoTexto)), textoExpiracao1, Color(200, 200, 200), self.tamanhoTexto)
	
	local textoExpiracao2 = self.tempoRestante .. " m"
	DrawTextSombreado(posicao + Vector2(self.margem + Render:GetTextWidth(textoExpiracao1, self.tamanhoTexto), tamanho.y - self.margem - Render:GetTextHeight(textoExpiracao1, self.tamanhoTexto)), textoExpiracao2, Color(255, 255, 255), self.tamanhoTexto)
		
	local textoPagamento = "R$ "..self.pagamento..".-"
	local textoPagamentoKilometro = "R$ ".. self.pagamento/self.distancia/1000 .." / km"
	
	DrawTextSombreado(posicao + Vector2(tamanho.x / 1.5 + self.margem, tamanho.y - self.margem - Render:GetTextHeight(textoPagamentoKilometro, self.tamanhoTexto)), textoPagamentoKilometro, Color(255, 255, 255), self.tamanhoTexto)
	DrawTextSombreado(posicao + Vector2(tamanho.x / 1.5 + self.margem, tamanho.y - self.margem - Render:GetTextHeight(textoPagamento, self.tamanhoTexto) * 2), textoPagamento, self.cor, self.tamanhoTexto)
	
	-- local posMouse = Mouse:GetPosition() - Vector2(100, 150 + self.alturaScroll)
	-- local raio = largura / 2
	-- if (posMouse.x >= pos.x - raio and posMouse.x <= pos.x + raio and posMouse.y >= pos.y - raio and posMouse.y <= pos.y + raio) then
		-- textoLegenda = self.texto
	-- end
end


function ItemPedido:DrawQuadrado(posicao, tamanho, titulo, cor)


	Render:FillArea(posicao, Vector2(tamanho.x, self.alturaTitulo), Color(0, 0, 0))
	
	-- Quadrado em volta titulo
	Render:FillArea(posicao - Vector2(0, 1), Vector2(Render:GetTextWidth(titulo, self.tamanhoTitulo) + 13, self.alturaTitulo + 2), cor)
	Render:FillArea(posicao + Vector2(2, 2), Vector2(Render:GetTextWidth(titulo, self.tamanhoTitulo), self.alturaTitulo) - Vector2(-9, 4), Color(0, 0, 0))
	
	-- Titulo
	DrawTextSombreado(posicao + Vector2(6, self.alturaTitulo / 2 + 2 - Render:GetTextHeight(titulo, self.tamanhoTitulo) / 2), titulo, cor, self.tamanhoTitulo)
	
	Render:FillArea(posicao + Vector2(0, self.alturaTitulo), tamanho + Vector2(0, - self.alturaTitulo), Color(0,0,0, 175))

	Render:FillArea(posicao + Vector2(0, self.alturaTitulo + 10), Vector2(3, tamanho.y - self.alturaTitulo - 10), cor)	
	
end