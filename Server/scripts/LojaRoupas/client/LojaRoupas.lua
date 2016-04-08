class 'LojaRoupas'

function LojaRoupas:__init()
	
	self.lojas = {}
	self.menu = nil
	self:CriarMenu()
	self.naLoja = false
	self.active = false
	
	self.vestimentasCompradas = {}
	
	Network:Subscribe("AtualizarVestimentasCompradas", self, self.AtualizarVestimentasCompradas)
	Network:Subscribe("EnterCheckpoint", self, self.EnterCheckpoint)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	
	self.lojasItens = {
		[16] = {
			[1] = {1, 2, 3, 4, 5, 6},
			[2] = {1, 2, 3, 4, 5},
			[3] = {},
		},
	}
	
	self.infosTipoItem = {}
	self.infosTipoItem[1] = {nome = "Roupas"}
	self.infosTipoItem[2] = {nome = "Chapeus"}
	self.infosTipoItem[3] = {nome = "Oculos"}
	
	self.listaVestimentas = ListaVestimentas()
	
end


function LojaRoupas:AtualizarVestimentasCompradas( args )

	self.vestimentasCompradas = {}
	for _, linha in ipairs(args) do
	
		local tipo = tonumber(linha.tipo)
		local idVestimenta = tonumber(linha.idVestimenta)
		
		if (not self.vestimentasCompradas[tipo]) then
			self.vestimentasCompradas[tipo] = {}
		end
		
		self.vestimentasCompradas[tipo][idVestimenta] = true
	end

end


function LojaRoupas:LocalPlayerInput( args )

	if self.active then
		return false
	end
	
end


function LojaRoupas:KeyUp(args)

	if args.key == string.byte("J") then
	
		if self.naLoja then

			self:SetActive(not self.active)
			
		elseif (self.active) then
		
			self:SetActive(false)
		end
	end

end


function LojaRoupas:AtualizarMenu(args)
	-- idLocal, descricao
	self.menu:Limpar()
	
	local lista = self.menu.lista
	local itens = self.lojasItens[args.idLocalTipo]

	if (itens) then
		
		local funcaoItemSelecionado = function(item)
				
			if (LocalPlayer:GetMoney() < item.valor.preco) then
				Chat:Print("Voce nao possui dinheiro suficiente para comprar esta peca: "..item.valor.nome.."!", Color(255,0,0))
				return
			end
					
			Network:Send("ComprarVestimenta", {item = item.valor})
					
		end		
		
		local funcaoItemAlterado = function(item)
				
			Network:Send("VestirVestimenta", {item = item.valor})
					
		end
		
		for tipo, itensTipo in ipairs(itens) do
			if (itensTipo and #itensTipo > 0) then
				local infosTipo = self.infosTipoItem[tipo]
				
				local itemTipo = ItemPlus({
					texto = infosTipo.nome,
					descricao = "Ver "..string.lower(infosTipo.nome).."...",
				})
				
				local listaTipo = ListaPlus({subTitulo = string.upper(infosTipo.nome), exibirSubTituloSecundario = true})
				listaTipo:SubscribeItemSelecionado(funcaoItemSelecionado)			
				listaTipo:SubscribeItemAlterado(funcaoItemAlterado)	
				
				for _, idItem in ipairs(itensTipo) do
				
					local itemUtensilho = self.listaVestimentas.vestimentas[tipo][idItem]
					if (itemUtensilho) then
					
						local textoSecundario = "R$ "..itemUtensilho.preco
						local descricao = "Comprar '".. itemUtensilho.nome .."' por R$ "..itemUtensilho.preco.."!"
						local preco = itemUtensilho.preco
						if (self.vestimentasCompradas[tipo] and self.vestimentasCompradas[tipo][idItem]) then
							textoSecundario = "Ja possui"
							descricao = "Vestir '".. itemUtensilho.nome .."."
							preco = 0
						end
						
						listaTipo:AddItem(ItemPlus({
							texto = itemUtensilho.nome,
			
							textoSecundario = textoSecundario,
							descricao = descricao,
							valor = {
								id = idItem,
								preco = preco,
								nome = itemUtensilho.nome,
								tipo = tipo,
							}
						}))
					end
				end
				itemTipo:SetLista(listaTipo)
				lista:AddItem(itemTipo)			
			end
		end
		
	end
	
end


function LojaRoupas:CriarMenu()

	local argsMenu = {
		posicao = Render.Size / 2 - Vector2(75, 200),
		largura = 300,
		corFundo = Color(37, 116, 169),
		corTitulo = Color(255, 255, 255),
		titulo = "Loja de Roupas",
		argsLista = {subTitulo = "ITENS", exibirSubTituloSecundario = true}
	}

	
	self.menu = MenuPlus(argsMenu)
end


function LojaRoupas:EnterCheckpoint(args)

	if (args) then
		self:AtualizarMenu(args)
		self.naLoja = true
	else
		self.naLoja = false
		self:SetActive(false)
	end
	
end


function LojaRoupas:Render()

	if self.active then
		if not self.menu:GetActive() then
			self:SetActive(false)
		end
	end
	
end


function LojaRoupas:SetActive(args)

	self.active = args
	if self.menu then
		self.menu:SetActive(args)
	end
	if not args then
		Network:Send("AtualizarVestimentas")
	end
	
end

lojaRoupas = LojaRoupas()