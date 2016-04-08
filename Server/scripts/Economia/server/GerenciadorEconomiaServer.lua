class 'GerenciadorEconomiaServer'

function GerenciadorEconomiaServer:__init()

	
	self.pedidos = {}
	self.pedidosEspera = {}
	
	self.delay = 0.1
	self.timer = Timer()
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("PostTick", self, self.PostTick)
	
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	
	Network:Subscribe("AtualizarEmpresaAtual", self, self.AtualizarEmpresaAtual)
end


function GerenciadorEconomiaServer:ClientModuleLoad(args)

	Network:Send(args.player, "AtualizarPedidos", {pedidos = self.pedidos})
	
end


function GerenciadorEconomiaServer:ModuleLoad()
	
	self.produtor = ProdutorServer()
	self.empresa = EmpresaServer()
	
end


function GerenciadorEconomiaServer:AtualizarEmpresaAtual(args, player)
	
	local pedidos = {}
	for _, pedido in pairs(self.pedidos) do
		table.insert(pedidos, pedido)
	end
	
	local pedidosEspera = {}
	for _, pedido in pairs(self.pedidosEspera) do
		table.insert(pedidosEspera, pedido)
	end
	
	Network:Send(player, "AtualizarEmpresaAtual", {empresa = self.empresa.empresas[args.idEmpresa], pedidos = pedidos, pedidosEspera = pedidosEspera})
	
end


function GerenciadorEconomiaServer:PostTick()
	
	if self.timer:GetMinutes() >= self.delay then

		for _, produtor in pairs(self.produtor.produtores) do
			
			produtor.mercadoria.tempoRestante = produtor.mercadoria.tempoRestante - self.delay
		
			if produtor.mercadoria.tempoRestante <= 0 then
				self.produtor:ProduzirMercadoria(produtor)
			end
		end
		

		for idPedidoEspera, pedidoEspera in ipairs(self.pedidosEspera) do
			
			self:NovoPedido(idPedidoEspera)
		end
		
		for idEmpresa, empresa in pairs(self.empresa.empresas) do

			for idMercadoria, mercadoria in pairs(empresa.mercadorias) do
				mercadoria.tempoRestante = mercadoria.tempoRestante - self.delay
				
				if mercadoria.tempoRestante <= 0 then
				
					self.empresa:ProduzirMercadoria(empresa, mercadoria)
						
					if empresa.pedidoAutomatico == 1 then
					
						if not self:GetPedidoEspera(empresa.id, idMercadoria, 2) then
							local dados_mercadoria = self.empresa.mercadorias[mercadoria.idMercadoria]
							
							for idMercadoriaReceita, mercadoriaReceita in pairs(dados_mercadoria.mercadoriasReceita) do
								
								local mercadoriaEmpresa = empresa.mercadorias[idMercadoriaReceita]
								
								if not (mercadoriaEmpresa and mercadoriaEmpresa.quantidade > mercadoriaReceita.tempoProducao / 5) then
									
									if not self:GetPedidoEspera(empresa.id, idMercadoriaReceita, 2) and not self:GetPedido(idEmpresa, idMercadoriaReceita, 2) then
										self:NovoPedidoEspera(2, empresa, idMercadoriaReceita)
									end
								end
							end
						end
						
					end
				end
			end
			
		end
		
		self.timer:Restart()
	end
end


function GerenciadorEconomiaServer:GetFornecedorDisponivel(idMercadoria, quantidade)

	for idProdutor, produtor in pairs(self.produtor.produtores) do
		
		if produtor.mercadoria.idMercadoria == idMercadoria
		and produtor.mercadoria.quantidade >= quantidade then
			
			return {tipo = 1, fornecedor = produtor}
		end
	end
	
	for idEmpresa, empresa in pairs(self.empresa.empresas) do
		
		if empresa.mercadoria.idMercadoria == idMercadoria
		and empresa.mercadoria.producao == 1
		and empresa.mercadoria.quantidade >= quantidade then
			
			return {tipo = 2, fornecedor = empresa}
		end
	end
	
	return false
	
end


function GerenciadorEconomiaServer:NovoPedido(idPedidoEspera)

	local pedido = self.pedidosEspera[idPedidoEspera]
	if not pedido then return end

	local receptorArray = pedido.receptor
	local idMercadoria = pedido.idMercadoria
	
	local quantidade = 0
	if pedido.quantidade then
		quantidade = pedido.quantidade
	else
	
		-- CALCULO DE QUANTIDADE
		local quantasMercadorias = 1
		local quantidadeMercadoria = 0
		for _, mercadoria in pairs(receptorArray.receptor.mercadorias) do
			quantasMercadorias = quantasMercadorias + 1
			quantidadeMercadoria = quantidadeMercadoria + mercadoria.quantidade
		end
		
		quantidade = math.min(receptorArray.receptor.armazem - quantidadeMercadoria, receptorArray.receptor.armazem / quantasMercadorias)
		--
	end
	local fornecedorDisponivel = self:GetFornecedorDisponivel(idMercadoria, quantidade)

	if fornecedorDisponivel then
	
		table.remove(self.pedidosEspera, idPedidoEspera)
		
		local pagamento = 0
		local distancia = fornecedorDisponivel.fornecedor.posicao:Distance(receptorArray.receptor.posicao)
		local dados_mercadoria = self.empresa.mercadorias[idMercadoria]
		pagamento = distancia / 1000 * dados_mercadoria.valor + (dados_mercadoria.valor * dados_mercadoria.percentual)
		
		-- pode ser empresa to loja tambem
		table.insert(self.pedidos, {
			fornecedor = fornecedorDisponivel,
			receptor = receptorArray,
			idMercadoria = idMercadoria,
			quantidade = quantidade,
			pagamento = pagamento,
			distancia = distancia,
			tempoRestante = 70,
		})
		
		self:AtualizarPedido(#self.pedidos)

	end
	
end


function GerenciadorEconomiaServer:NovoPedidoEspera(tipo, receptor, idMercadoria, quantidade)
	Console:Print(">> novo pedido espera")
	
	table.insert(self.pedidosEspera, {
		receptor = {tipo = tipo, receptor = receptor},
		idMercadoria = idMercadoria,
		quantidade = quantidade,
		}
	)
	
end


function GerenciadorEconomiaServer:AtualizarPedido(idPedido)
	
	local pedido = self.pedidos[idPedido]
	
	for player in Server:GetPlayers() do
		-- validar player id carreira
		Network:Send(player, "AtualizarPedido", {id = idPedido, pedido = pedido})
	end

end


function GerenciadorEconomiaServer:GetPedidoEspera(id, idMercadoria, tipo)
	
	for _, pedido in ipairs(self.pedidosEspera) do

		if pedido.receptor.tipo == tipo and pedido.receptor.receptor.id == id and pedido.idMercadoria == idMercadoria then
			
			return true
		end
	end
	return false
	
end


function GerenciadorEconomiaServer:GetPedido(id, idMercadoria, tipo)
	
	for _, pedido in ipairs(self.pedidos) do
		if pedido.receptor.tipo == tipo and pedido.receptor.receptor.id == id and pedido.idMercadoria == idMercadoria then
			return true
		end
	end
	return false
	
end


gerenciadorEconomiaServer = GerenciadorEconomiaServer()