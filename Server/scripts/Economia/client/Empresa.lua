class 'Empresa'

function Empresa:__init()

	self.active = false
	self.menu = nil
	self:CriarMenu()
	
	self.mercadorias = {}
	
	self.empresas = {}
	self.empresaAtual = nil
	self.empresaPropria = nil
	
	Network:Subscribe("AtualizarEmpresaAtual", self, self.AtualizarEmpresaAtual)
	Network:Subscribe("AtualizarPlayer", self, self.AtualizarPlayer)
	
	Events:Subscribe("KeyUp", self, self.KeyUp)	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	
	Events:Subscribe("AtualizarSpots", self, self.AtualizarSpots)
end


function Empresa:CriarMenu()

	local argsMenu = {
		largura = 400,
		posicao = Vector2(Render.Width / 2 - 150, 200),
		corFundo = Color(25, 181, 254),
		corTitulo = Color(255, 255, 255),
		titulo = "Empresa",
		argsLista = {subTitulo = "MENU"}
	}
	
	self.menu = MenuPlus(argsMenu)
	
end


function Empresa:AtualizarMenu(empresaArray)

	self.menu:Limpar()
	local lista = self.menu.lista
	if not empresaArray then return end

	local valorEmpresa = 1000
	local souDono = false
	if empresaArray.idDono == LocalPlayer:GetSteamId().id then
		souDono = true
	end
	
	local souFuncionario = false
	if not souDono then
		for _, player in ipairs(empresaArray.funcionarios) do
		
			if player.idPlayer == LocalPlayer:GetSteamId().id then
				souFuncionario = true
			end
		end
	end
	
	self.menu.titulo = tostring(empresaArray.nome)
	
	local itemInformacoes = ItemPlus({
		texto = "Informacoes", 
		descricao = "Informacoes sobre a empresa.",
	})	
	
	local listaItemInformacoes = ListaPlus({subTitulo = "INFORMACOES"})
	itemInformacoes:SetLista(listaItemInformacoes)
	
	listaItemInformacoes:AddItem(ItemPlus{
		texto = "",
	})
	local itemProducao = ItemPlus({
		texto = "Producao", 
		descricao = "Ver as mercadorias produzidas.",
	})		
	
	local listaProducao = ListaPlus({subTitulo = "PRODUCAO"})
	itemProducao:SetLista(listaProducao)
	
	local itemListaProducao = ItemPlus({
		texto = "Listar Mercadorias", 
		descricao = "Listar todos as mercadorias produzidas pela empresa.",
	})
	
	listaProducao:AddItem(itemListaProducao)
	
	if souDono then
		local textoSecundario = "Sim"
		if empresaArray.pedidoAutomatico == 0 then
			textoSecundario = "Nao"
		end
		local itemPedidoAutomatico = ItemPlus({
			texto = "Pedido Automatico", 
			textoSecundario = textoSecundario,
			descricao = "Fazer os pedidos automaticamente das mercadorias necessarias para a producao. Isso lhe gerara uma taxa de % na compra.",
			valor = {id = 1}
		})
		
		listaProducao:AddItem(itemPedidoAutomatico)
		listaProducao:SubscribeItemSelecionado(
			function(item)
				if item.valor.id == 1 then
					local pedidoAutomatico = 1
					if empresaArray.pedidoAutomatico == 1 then
						pedidoAutomatico = 0
					end
					Network:Send("AlterarPedidoAutomatico", {pedidoAutomatico = pedidoAutomatico})
				end
			end
		)
		
		local itemMeusPedidos = ItemPlus({
			texto = "Meus Pedidos", 
			textoSecundario = "...",
			descricao = "Listar os atuais pedidos de sua empresa.",
		})
		
		local listaMeusPedidos = ListaPlus({subTitulo = "PEDIDOS"})
		itemMeusPedidos:SetLista(listaMeusPedidos)
		
		for _, pedido in pairs(empresaArray.pedidos) do
			local dados_mercadoria = self.mercadorias[pedido.idMercadoria]
			listaMeusPedidos:AddItem(ItemPlus{
				texto = dados_mercadoria.nome,
				textoSecundario = "x"..pedido.quantidade,
				descricao = "Pedido no aguardo do transportador.\nExpiracao: "..pedido.tempoRestante.."."
			})
		end	
		
		for _, pedidoEspera in pairs(empresaArray.pedidosEspera) do
			local dados_mercadoria = self.mercadorias[pedidoEspera.idMercadoria]
			listaMeusPedidos:AddItem(ItemPlus{
				texto = dados_mercadoria.nome,
				textoSecundario = "EM ESPERA",
				descricao = "O pedido esta na fila de espera, possuem muitos pedidos dessa mercadoria ou nao possuem produtoes disponiveis no momento."
				
			})
		end
		listaProducao:AddItem(itemMeusPedidos)
	end
	
	local listaListaProducao = ListaPlus({subTitulo = "LISTAGEM DE MERCADORIAS"})
	itemListaProducao:SetLista(listaListaProducao)
	
	for _, mercadoria in ipairs(empresaArray.mercadorias) do
		local itemMercadoria = ItemPlus({
			texto = tostring(mercadoria.nome),
			textoSecundario = "x"..tostring(mercadoria.quantidade),
		})
		listaListaProducao:AddItem(itemMercadoria)
		
		if souDono then
			local listaItemMercadoria = ListaPlus({subTitulo = string.upper(mercadoria.nome)})
			itemMercadoria:SetLista(listaItemMercadoria)
			
			local itemMercadoriasNecessarias = ItemPlus({
				texto = "Mercadorias Necessarias",
				textoSecundario = "...",
				descricao = "Ver as mercadorias necessarias para a producao."
			})
			
			listaItemMercadoria:AddItem(itemMercadoriasNecessarias)
			
			local listaItemMercadoriasNecessarias = ListaPlus({subTitulo = "MERCADORIAS NECESSARIAS"})
			itemMercadoriasNecessarias:SetLista(listaItemMercadoriasNecessarias)
			
			for idMercadoriaNecessaria, mercadoriaNecessaria in pairs(self.mercadorias[mercadoria.idMercadoria].mercadoriasReceita) do
				listaItemMercadoriasNecessarias:AddItem(ItemPlus{
					texto = self.mercadorias[idMercadoriaNecessaria].nome,
					textoSecundario = "x"..mercadoriaNecessaria.quantidade,
				})
			end
			
			local itemRemoverMercadoria = ItemPlus{
				texto = "Remover Mercadoria",
				descricao = "Parar de produzir essa mercadoria, liberando o espaco para outras.",
			}
			
			listaItemMercadoria:AddItem(itemRemoverMercadoria)
			
			local listaItemVenderMercadoria = ListaPlus({subTitulo = "VENDER MERCADORIA"})
			itemRemoverMercadoria:SetLista(listaItemVenderMercadoria)
			
			listaItemVenderMercadoria:AddItem({
				texto = "Remover Mercadoria",
				descricao = "Confirma a remocao?",
				valor = {idEmpresaMercadoria = mercadoria.idEmpresaMercadoria}
			})
			
			listaItemVenderMercadoria:SubscribeItemSelecionado(
				function(item)
					
					Network:Send("RemoverMercadoria", {idEmpresaMercadoria = item.valor.idEmpresaMercadoria})
				
				end
			)
		end
	end
	
	if souDono then
		local itemNovaProducao = ItemPlus({
			texto = "Nova Producao", 
			textoSecundario = "...",
			descricao = "Comprar nova producao",
		})
		
		listaProducao:AddItem(itemNovaProducao)
			
		local listaNovaProducao = ListaPlus({subTitulo = "MERCADORIAS"})
		itemNovaProducao:SetLista(listaNovaProducao)
		
		--for _, mercadoria in pairs(--mercadoriasdisponiveis) do
		
		--end
	end
	
	if #empresaArray.funcionarios > 0 then
	
		local itemFuncionarios = ItemPlus({
			texto = "Funcionarios", 
			descricao = "Ver os funcionarios da empresa.",
		})		
		
		local listaFuncionarios = ListaPlus({subTitulo = "FUNCIONARIOS"})
		itemFuncionarios:SetLista(listaFuncionarios)
		
		local itemListaFuncionarios = ItemPlus({
			texto = "Listar Funcionarios", 
			descricao = "Listar todos os funcionarios da empresa.",
		})
			
		local listaListaFuncionarios = ListaPlus({subTitulo = "LISTAGEM DE FUNCIONARIOS"})
		itemListaFuncionarios:SetLista(listaListaFuncionarios)
		
		for _, funcionario in ipairs(empresaArray.funcionarios) do
			local itemFuncionario = ItemPlus({
				texto = funcionario.nome,
				textoSecundario = "Nv. "..funcionario.nivelFuncionario,
			})
			listaListaFuncionarios:AddItem(itemFuncionario)
		end
		
		lista:AddItem(itemFuncionarios)
	else
		local itemComprar = ItemPlus({
			texto = "Comprar", 
			textoSecundario = "...",
			descricao = "Comprar a empresa.",
		})	
		
		local listaItemComprar = ListaPlus({subTitulo = "COMPRAR"})
		itemComprar:SetLista(listaItemComprar)
		
		listaItemComprar:AddItem(ItemPlus({
			texto = "Comprar",
			textoSecundario = "R$ "..valorEmpresa,
			descricao = "Confirmar a compra?",
		}))
		
		listaItemComprar:SubscribeItemSelecionado(
			function(item)
				Network:Send("ComprarEmpresa", {idEmpresa = empresaArray.idEmpresa})
			end
		)
	end
	
	local itemSair = ItemPlus()
	
	if souDono then
		itemSair = ItemPlus({
			texto = "Vender", 
			descricao = "Vender a empresa.",
		})
		
		local listaItemVender = ListaPlus({subTitulo = "VENDER"})
		itemSair:SetLista(listaItemVender)
		
		local itemVenderPara = ItemPlus({
			texto = "Vender para...",
			textoSecundario = "...",
			descricao = "Vender para uma pessoa.",
		})
		
		listaItemVender:AddItem(itemVenderPara)		
		
		local listaVenderPlayer = ListaPlus({subTitulo = "VENDER PARA..."})
		itemVenderPara:SetLista(listaVenderPlayer)
		
		for player in Client:GetStreamedPlayers() do
			listaVenderPlayer:AddItem(ItemPlus({
				-- adicionar streamed players
			}))
		end
		
		listaItemVender:AddItem(ItemPlus({
			texto = "Vender",
			textoSecundario = "R$ "..valorEmpresa / 1.5,
			descricao = "Vender por R$ "..valorEmpresa / 1.5,
		}))
		
		listaItemVender:SubscribeItemSelecionado(
			function(item)
				Network:Send("VenderEmpresa")
			end
		)
		
	else
		if souFuncionario then
			itemSair = ItemPlus({
				texto = "Sair", 
				descricao = "Deixar de ser funcionario da empresa.",
				valor = {id = 2},
			})
		end
	end
	
	lista:SubscribeItemSelecionado(
		function(item)
			if item.valor.id == 2 then
				Network:Send("SairEmpresa")
			end
		end
	)
	lista:AddItem(itemInformacoes)
	lista:AddItem(itemProducao)
	lista:AddItem(itemSair)
end


function Empresa:KeyUp(args)

	if args.key == string.byte("J") then
		if self.empresaAtual then
		
			self:SetActive(not self.active)
		end
	
	end

end


function Empresa:SetActive(args)

	if args then
		self:AtualizarMenu()
		Network:Send("AtualizarEmpresaAtual", {idEmpresa = self.empresaAtual.idEmpresa})
	end
	
	self.active = args
	if self.menu then
		self.menu:SetActive(args)
	end	
	
end


function Empresa:AtualizarEmpresaAtual(args)

	args.empresa.pedidos = args.pedidos
	args.empresa.pedidosEspera = args.pedidosEspera
	self:AtualizarMenu(args.empresa)

end


function Empresa:AtualizarPlayer(args)
	
	if args.empresaPropria != nil then
		self.empresaPropria = args.empresaPropria

	end
	
	if args.mercadorias then
		self.mercadorias = args.mercadorias
	end
		
	if args.empresas then
		self.empresas = args.empresas
		self:AtualizarSpots()
	end
	
end


function Empresa:AddSpot(empresa)

	local idImagem = 3
	local tipo = -3
	local nome = "Empresa"
	if self.empresaPropria and self.empresaPropria.idEmpresa == empresa.idEmpresa then
		nome = "Sua Empresa"
		idImagem = 4
		tipo = -4
	else
		if #empresa.funcionarios == 0 then
			nome = "Empresa a Venda"
			idImagem = 2
		end
	end
	local descricao = ""

	Events:Fire("AddSpot", {nome = nome, tipo = tipo, descricao = descricao, posicao = empresa.posicao, grupo = "Empresa", index = empresa.idEmpresa, idImagem = idImagem})

end


function Empresa:AtualizarSpots(args)

	for idEmpresa, empresa in ipairs(self.empresas) do
	
		--descricao, nome, posicao, idImagem, grupo, index,
		self:AddSpot(empresa)

	end
end


function Empresa:ModuleUnload()

	Events:Fire("DeleteSpot", {grupo = "Empresa"})

end


function Empresa:AtualizarEmpresa(args)

	self.empresas[args.empresa.idEmpresa] = args.empresa
	
	self:AddSpot(args.empresa)
	-- Events:Fire("AddSpot", {nome = nome, descricao = descricao, tipo = -3, posicao = args.empresa.posicao, grupo = "Empresa", index = args.empresa.idEmpresa, idImagem = idImagem})
	self:AtualizarMenu(self.empresaAtual)
end


function Empresa:Render()

	local empresaAtual = nil
	
	for _, empresa in pairs(self.empresas) do
	
		local pos = empresa.posicao + Vector3(0, 1, 0)
		local dist = pos:Distance(LocalPlayer:GetPosition())

		if dist <= 150 then
		
			local pos_2d, success = Render:WorldToScreen(pos)
			if success then 
			
				local escala = self:CalculateAlpha(dist, 10, 150)

				local alpha = escala--math.max(0, escala * 1 * (1.0 - (aim * 10)))
				
				-- local imagemDesenhar = self.imagemempresaLiberada
				-- if self.empresaPropria and self.empresaPropria.idempresa == empresa.idempresa then
					-- imagemDesenhar = self.imagemempresaPropria
				-- else
					-- if #empresa.moradores > 0 then
						-- imagemDesenhar = self.imagemempresaBloqueada
					-- end
				-- end
				-- imagemDesenhar:SetSize(self.imagemempresaTamanho * escala)
				-- imagemDesenhar:SetPosition(pos_2d - imagemDesenhar:GetSize() / 2)
				-- imagemDesenhar:SetAlpha(alpha)
				-- imagemDesenhar:Draw()
				if dist <= 50 then
					local texto = "Empresa ID "..empresa.idEmpresa .. " - "
					if #empresa.funcionarios > 0 then
						texto = texto .. "Dono: "..empresa.funcionarios[1].nome
					else
						texto = texto .. "A venda - R$ "
					end
					local size = 18
					Render:DrawText(pos_2d - Vector2(Render:GetTextWidth(texto, size, escala) / 2, 40 * escala), texto, Color(255, 255, 255), size, escala)
				end				
			end
			
			if dist < 5 then
		
				empresaAtual = empresa
			end

		end
	end
	
	self.empresaAtual = empresaAtual
	
	if self.active then
		if self.menu and not self.menu:GetActive() then
			self:SetActive(false)
		end
	end
end


function Empresa:LocalPlayerInput(args)

	if self.active then return false end

end



function Empresa:CalculateAlpha( dist, bias, max )

    local alpha = 1

    if dist > bias then
        alpha =  1.0 - ( dist - bias ) /
                       ( max  - bias )
    end

    return alpha
end


empresa = Empresa()