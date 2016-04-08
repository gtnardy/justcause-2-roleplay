class 'Inventario'

function Inventario:__init()

	self.active = false
	self.menu = nil
	self:AtualizarMenu()
	
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("Render", self, self.Render)
	Network:Subscribe("AtualizarInventario", self, self.AtualizarInventario)

end


function Inventario:KeyUp(args)

	if (args.key == string.byte("I")) then
		self:SetActive(not self.active)
	end

end


function Inventario:Render()

	if self.active then
		if self.menu then
		
			if (not self.menu:GetActive()) then
				self:SetActive(false)
			end

		end
	end

end


function Inventario:SetActive(args)

	self.active = args	

	if self.menu then
	
		self.menu:SetActive(args)
	end
	
end


function Inventario:AtualizarInventario(args)

	if (args.itens) then
		
		local descricaoTipoItem = {}
		descricaoTipoItem[1] = "Ingerir "
		
		local itemSelecionado = self.menu.lista.itemSelecionado
		self.menu:Limpar()
		local lista = self.menu.lista
		
		for i, linha in ipairs(args.itens) do
			
			local descricao = ""
			if (descricaoTipoItem[tonumber(linha.tipo)]) then
				descricao = descricaoTipoItem[tonumber(linha.tipo)] .. " "
			end
			descricao = descricao ..linha.nome.."."
			
			local item = ItemPlus({
				texto = linha.nome,
				textoSecundario = linha.quantidade,
				descricao = descricao,
				valor = {
					idInventario = tonumber(linha.idPlayerInventario),
					idItem = tonumber(linha.idItem),
					tipo = tonumber(linha.tipo),
					nome = linha.nome
				}
			})
			
			lista:AddItem(item)
		
			lista:SubscribeItemSelecionado(
				function(item)
					
					if (item.valor.tipo == 1) then
					
						Network:Send("IngerirAlimento", {idInventario = item.valor.idInventario})
						
					end
										
					if (item.valor.tipo == 2) then
					
						Network:Send("UsarGalao", {idInventario = item.valor.idInventario})
						
					end
					
				end
			)
			
		end
		
		if #lista.itens >= itemSelecionado then
			lista.itemSelecionado = itemSelecionado
		end
	
	end

end


function Inventario:AtualizarMenu(args)

	local argsMenu = {
		posicao = Render.Size / 2 - Vector2(300, 250),
		corFundo = Color(37, 116, 169),
		corTitulo = Color(255, 255, 255),
		titulo = "Inventario",
		argsLista = {subTitulo = "ITENS", exibirSubTituloSecundario = true}
	}

	
	self.menu = MenuPlus(argsMenu)


end

inventario = Inventario()