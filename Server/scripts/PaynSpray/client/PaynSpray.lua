class 'PaynSpray'

function PaynSpray:__init()
	
	self.noPaynSpray = false
	self.active = false
	
	self.veiculoAtual = nil
	self.veiculo = nil
	
	self.sound = nil
	
	self.menu = nil
	self:GerarMenu()
	
	self:GerarMenuPlaca()

	self.database = Database()
	
	Network:Subscribe("EntrouPaynSpray", self, self.EntrouPaynSpray)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("AtualizarVeiculoAtual", self, self.AtualizarVeiculoAtual)
	Events:Subscribe("LocalPlayerEnterVehicle", self, self.LocalPlayerEnterVehicle)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	
end


function PaynSpray:LocalPlayerEnterVehicle(args)

	if self.active and args.is_driver then
	
		self.veiculo = args.vehicle
		
	end
end


function PaynSpray:AtualizarVeiculoAtual(args)

	self.veiculoAtual = args

end


function PaynSpray:LocalPlayerInput(args)

	if self.active and not(args.input == Action.LookLeft or args.input == Action.LookDown or args.input == Action.LookRight or args.input == Action.LookUp) then
	
		return false
	end

end


function PaynSpray:KeyUp(args)

	
	if args.key == string.byte("J") then
	
		--if self.active or self.noPaynSpray then
			self:SetActive(not self.active)
		--end

	end
	
end


function PaynSpray:ModuleUnload()

	if self.sound then
		self.sound:Remove()
	end
	
	if self.active then
		Network:Send("AtualizarVeiculo", {motorista = LocalPlayer, self:GetVeiculoAtual()})
	end
	
end


function PaynSpray:Render()

	if self.active then

		if self.menuPlaca:GetVisible() then
		
			self.menuPlaca:Focus() 
			Render:FillArea(self.menuPlaca:GetPosition() - Vector2(25, 30), self.menuPlaca:GetSize() + Vector2(50,60), Color(0,0,0,100))
			Render:DrawText(self.menuPlaca:GetPosition() - Vector2(0, 20), "Digite o novo texto da placa:", Color(255,255,255))
		
		end	
		if self.menu and not self.menu:GetActive() then
			self:SetActive(false)
		end
	end
	
end


function PaynSpray:EntrouPaynSpray(boo)

	self.noPaynSpray = boo
	
end


function PaynSpray:SetActive(args)

	if not args or LocalPlayer:InVehicle() then
	
		self.menuPlaca:SetVisible(false)
		local veiculo = self:GetVeiculoAtual()

		Network:Send("EntrarPaynSpray", {boolean = args, veiculo = veiculo})
		if args then
		
			self.veiculoAtual = nil
			Events:Fire("GetVeiculoAtual")

			self:AtualizarMenu()
		else
	
			if self.sound then
				self.sound:Remove()	
				self.sound = nil
			end
			Network:Send("AtualizarVeiculo", {motorista = LocalPlayer, veiculo = veiculo})
		end
		
		self.active = args
		
		if self.menu then

			self.menu:SetActive(args)

		end
	else
		Chat:Print("Voce precisa estar em um veiculo para acessar o Pay 'n' Spray!", Color(255,0,0))
	end
	
end


function PaynSpray:GerarMenu()

	local argsMenu = {
		posicao = Vector2(Render.Width / 5, 150),
		corFundo = Color(1, 152, 117),
		corTitulo = Color(255, 255, 255),
		titulo = "Pay 'n' Spray",
		argsLista = {subTitulo = "CATEGORIAS"}
	}
	
	self.menu = MenuPlus(argsMenu)

end


function PaynSpray:GerarMenuPlaca()

	self.menuPlaca = TextBox.Create()
	self.menuPlaca:SetTextSize(self.menuPlaca:GetTextSize() * 2)
	self.menuPlaca:SetSize(self.menuPlaca:GetSize() * 2)
	self.menuPlaca:SetPosition(Render.Size / 2 - self.menuPlaca:GetSize() / 2)
	self.menuPlaca:Subscribe("ReturnPressed", self, self.AlterarPlaca)
	self.menuPlaca:Subscribe("EscPressed", self, function() self.menuPlaca:SetVisible(false) end)
	self.menuPlaca:SetVisible(false)

end


function PaynSpray:AlterarPlaca()
	
	if string.len(self.menuPlaca:GetText()) > 50 then
		Chat:Print("O texto nao pode passar de 50 caracteres!", Color(255,0,0))
		return
	end
	
	Network:Send("AlterarPlaca", {player = LocalPlayer, texto = self.menuPlaca:GetText(), preco = 300})
	
	local veiculo = self:GetVeiculoAtual()
	
	Events:Fire("AtualizarUtensilhoVeiculo", {id = veiculo:GetId(), utensilho = "placa", valor = self.menuPlaca:GetText(), veiculo = veiculo})
	self.menuPlaca:SetVisible(false)
	
	
end


function PaynSpray:AtualizarMenu()

	local souDono = false
	if self.veiculoAtual and self.veiculoAtual.idDono == LocalPlayer:GetSteamId().id then
		souDono = true
	end
	
	local veiculo = LocalPlayer:GetVehicle()
	
	self.menu:Limpar()
	local lista = self.menu.lista
	
	local healthVehicle = 1
	if veiculo then
		healthVehicle = veiculo:GetHealth()
	end
	
	local repararActive = true
	if healthVehicle == 1 then
		repararActive = false
	end
	
	local precoRepararMotor = math.floor(500 - 500 * healthVehicle)
	
	local itemRepararMotor = ItemPlus({
		texto = "Reparar Motor",
		textoSecundario = "R$ "..precoRepararMotor,
		descricao = "Reparar a vida do veiculo.",
		active = repararActive,
		valor = {id = 1, preco = precoRepararMotor}
	})	
	
	local itemRepararEstrutura = ItemPlus({
		texto = "Reparar Estrutura",
		textoSecundario = "R$ 300",
		descricao = "Reparar a estrutura do veiculo. (Nao afeta a vida).",
		valor = {id = 2, preco = 300}
	})	
	
	local itemPintura = ItemPlus({
		texto = "Pintura",
		descricao = "Alterar a cor do veiculo.",
	})	
	
	local listaPintura = ListaPlus({subTitulo = "CORES", exibirSubTituloSecundario = true})
	itemPintura:SetLista(listaPintura)
	
	
	
	for _, cor in ipairs(self.database.cores) do
	
		local active = true
		
		local textoSecundario = "R$ "..cor[3]
		if self.veiculoAtual and not souDono then
			active = false
		end
	
		if veiculo:GetColors() == cor[2] then
			active = false
			textoSecundario = "ATUAL"
		end
		
		listaPintura:AddItem(ItemPlus({
			texto = cor[1],
			active = active,
			textoSecundario = textoSecundario,
			valor = {cor = cor[2], preco = cor[3]}
		}))

	end
	
	listaPintura:SubscribeItemAlterado(
		function(item)
			if item then
				Network:Send("VisualizarPinturaVeiculo", {cor1 = item.valor.cor, cor2 = item.valor.cor})
			end
		end
	)

	listaPintura:SubscribeItemSelecionado(
		function(item)
		
			if self:PossuiDinheiro(item.valor.preco) then
				Network:Send("ComprarPinturaVeiculo", {player = LocalPlayer, cor1 = item.valor.cor, cor2 = item.valor.cor, preco = item.valor.preco})
				for _, itemLista in ipairs(listaPintura.itens) do
					if not itemLista.active then
						itemLista.active = true
						itemLista.textoSecundario = "R$" ..itemLista.valor.preco
					end
				end
				item.active = false
				item.textoSecundario = "ATUAL"
			end

		end
	)
	
	local itemPlaca = ItemPlus({
		texto = "Placa",
		descricao = "Placa personalizada.",
	})	
	
	local listaPlaca = ListaPlus({subTitulo = "PLACA"})
	itemPlaca:SetLista(listaPlaca)
	
	local active = true
	local descricao =  "Alterar o texto da placa."
	if (self.veiculoAtual and not souDono) or not self.veiculoAtual then
		active = false
		descricao = "Apenas e possivel alterar a placa de veiculos proprios!"
	end
	listaPlaca:AddItem(ItemPlus({
		texto = "Texto",
		active = active,
		textoSecundario = "R$ 400",
		descricao = descricao,
		valor = {preco = 400}
	}))
	
	listaPlaca:SubscribeItemSelecionado(
		function(item)
			if self:PossuiDinheiro(item.valor.preco) then
				self.menuPlaca:SetVisible(true)
				self.menuPlaca:Focus() 
				listaPlaca:SetActive(false)
			end

		end
	)
	
	local modificacoes = self.database.modificacoes[veiculo:GetModelId()]
	local active = false
	if modificacoes and #modificacoes > 0 then
		active = true
	end
	
	local itemModificacoes = ItemPlus({
		texto = "Modificacoes",
		active = active,
		descricao = "Modificacoes do veiculo.",
	})		
	
	if modificacoes and #modificacoes > 0 then
	
		local templateVeiculo = veiculo:GetTemplate()
		local descricao = ""
		if not self.veiculoAtual then
			descricao = "A pre-visualizacao apenas esta disponivel para veiculos proprios!"
		end
		local listaModificacoes = ListaPlus({subTitulo = "MODIFICACOES", exibirSubTituloSecundario = true})
		itemModificacoes:SetLista(listaModificacoes)	
		for _, dados in ipairs(modificacoes) do
		
			
			local textoSecundario = "R$ "..dados.preco
			local active = true
			
			if templateVeiculo == dados.template then
				active = false
				textoSecundario = "ATUAL"
			end
			
			if self.veiculoAtual and not souDono then
				active = false
			end
			
			listaModificacoes:AddItem({
				texto = dados.texto,
				active = active,
				textoSecundario = textoSecundario,
				valor = {template = dados.template, preco = dados.preco},
				descricao = descricao,
			})
		end
		
		listaModificacoes:SubscribeItemSelecionado(
			function(item)
				if self:PossuiDinheiro(item.valor.preco) then
				
					Network:Send("ComprarModificacaoVeiculo", {player = LocalPlayer, template = item.valor.template, preco = item.valor.preco})
					
					for _, itemLista in ipairs(listaModificacoes.itens) do
						if not itemLista.active then
							itemLista.active = true
							itemLista.textoSecundario = "R$ "..itemLista.valor.preco
						end
					end
					
					item.active = false
					item.textoSecundario = "ATUAL"				
					
				end
			end
		)
		
		listaModificacoes:SubscribeItemAlterado(
			function(item)
				if item then
					Network:Send("VisualizarModificacaoVeiculo", {player = LocalPlayer, template = item.valor.template})
				end
			end
		)
	end
	
	local itemLuzes = ItemPlus({
		texto = "Luzes",
		descricao = "Iluminacao do veiculo.",
	})	
	
	local listaLuzes = ListaPlus({subTitulo = "LUZES"})
	itemLuzes:SetLista(listaLuzes)
	
	local itemNeon = ItemPlus({
		texto = "Neon",
		descricao = "Neon",
	})	
	
	local listaNeon = ListaPlus({subTitulo = "CORES", exibirSubTituloSecundario = true})
	itemNeon:SetLista(listaNeon)
	
	local corNeonVeiculo = nil
	if self.veiculoAtual and souDono then
		corNeonVeiculo = self.veiculoAtual.utensilhos.corNeon
	end
	
	local active = true
	if self.veiculoAtual and not souDono then
		active = false
	end
	
	listaNeon:AddItem(ItemPlus({
		texto = "Nenhum",
		active = active,
		textoSecundario = "GRATIS",
		valor = {cor = "", preco = 0}
	}))
		
	for _, cor in ipairs(self.database.coresNeon) do
	
		local active = true
		local descricao = "Neon da cor ".. cor[1].."."
		
		local textoSecundario = "R$ "..cor[3]
		if self.veiculoAtual and not souDono or not self.veiculoAtual then
			active = false
			descricao = "Apenas e possivel adicionar luzes em veiculos proprios!"
		end
	
		if corNeonVeiculo and corNeonVeiculo == cor[2] then
			active = false
			textoSecundario = "ATUAL"
		end	
	
		listaNeon:AddItem(ItemPlus({
			texto = cor[1],
			active = active,
			textoSecundario = textoSecundario,
			valor = {cor = cor[2], preco = cor[3]},
			descricao = descricao,
		}))

	end
	
	listaNeon:SubscribeItemAlterado(
		function(item)
			if item then
				local veiculo = LocalPlayer:GetVehicle()
				if veiculo then
					Events:Fire("AtualizarUtensilhoVeiculo", {id = veiculo:GetId(), utensilho = "corNeon", valor = item.valor.cor, veiculo = veiculo})
				end
			end

		end
	)
	
	listaNeon:SubscribeItemSelecionado(
		function(item)
			if self:PossuiDinheiro(item.valor.preco) then
			
				Network:Send("ComprarNeonVeiculo", {player = LocalPlayer, preco = item.valor.preco, cor = item.valor.cor})
				for _, itemLista in ipairs(listaNeon.itens) do
					if not itemLista.active then
						itemLista.active = true
						itemLista.textoSecundario = "R$ "..itemLista.valor.preco
					end
				end
				item.active = false
				item.textoSecundario = "ATUAL"
				
			end

		end
	)
	
	listaLuzes:AddItem(itemNeon)
	
	local active = true
	local possuoHidraulica = false
	if self.veiculoAtual then
	
		if souDono then
			if self.veiculoAtual.utensilhos.hidraulica and self.veiculoAtual.utensilhos.hidraulica == 1 then
				possuoHidraulica = true
			end
		else
		
			active = false
		end
	end
	
	local itemHidraulica = ItemPlus({
		texto = "Hidraulica",
		active = active,
		descricao = "Suspensao Hidraulica.",
	})
	
	local listaItemHidraulica = ListaPlus({subTitulo = "HIDRAULICA"})
	itemHidraulica:SetLista(listaItemHidraulica)
	
	itemHidraulicaDesativado = ItemPlus({
		texto = "Desativado",
		active = possuoHidraulica,
		valor = {id = 1}
	})
	
	itemHidraulicaInstalacao = ItemPlus({
		texto = "Instalacao",
		active = not possuoHidraulica,
		textoSecundario = "R$ 10000",
		valor = {id = 2, preco = 10000}
	})
	
	listaItemHidraulica:AddItem(itemHidraulicaDesativado)
	listaItemHidraulica:AddItem(itemHidraulicaInstalacao)
	
	listaItemHidraulica:SubscribeItemAlterado(
		function(item)
			if item and item.valor.id == 2 then
				Events:Fire("AtivarHidraulica", {x = 0, z = 7})
			end
		end
	)	
	listaItemHidraulica:SubscribeItemSelecionado(
		function(item)
		
			if item.valor.id == 1 then
				Network:Send("ComprarHidraulica", {hidraulica = 0, player = LocalPlayer})
				item:SetActive(false)
				itemHidraulicaInstalacao:SetActive(true)
			end
			
			if item.valor.id == 2 then
				if self:PossuiDinheiro(item.valor.preco) then
					Network:Send("ComprarHidraulica", {hidraulica = 1, player = LocalPlayer, preco = item.valor.preco})
					item:SetActive(false)
					itemHidraulicaDesativado:SetActive(true)					
				end
			end
		end
	)
	
	local active = true
	local buzinaAtual = false
	if self.veiculoAtual then
	
		if souDono then
			if self.veiculoAtual.utensilhos.buzina then
				buzinaAtual = self.veiculoAtual.utensilhos.buzina
			end
		else
		
			active = false
		end
	end	
	
	local itemBuzina = ItemPlus({
		texto = "Buzina",
		active = active,
		descricao = "Buzina customizada.",
	})
	
	local listaItemBuzina = ListaPlus({subTitulo = "BUZINAS"})
	itemBuzina:SetLista(listaItemBuzina)
	
	local activePadrao = false
	if buzinaAtual then
		activePadrao = true
	end
	listaItemBuzina:AddItem(ItemPlus({
		texto = "Padrao",
		textoSecundario = "GRATIS",
		active = activePadrao,
		valor = {preco = 0}
	}))
		
	for _, array in ipairs(self.database.buzinas) do
		local active = true
		--local textoSecundario = "R$ "..array.preco
		if buzinaAtual and buzinaAtual.bank_id == array.bank_id and buzinaAtual.sound_id == array.sound_id then
			active = false
			--textoSecundario = "ATUAL"
		end
		listaItemBuzina:AddItem(ItemPlus({
			texto = array.texto,
			textoSecundario = "R$ "..array.preco,
			active = active,
			valor = {bank_id = array.bank_id, sound_id = array.sound_id, preco = array.preco}
		}))
	end
	
	listaItemBuzina:SubscribeItemAlterado(
		function(item)
			-- ALTEREI O MENUPLUS PARA LANCAR O ITEMALTERADO AO SAIR DA LISTA
			if item then
				if self.sound then
					self.sound:Remove()
					self.sound = nil
				end
				if item.valor.bank_id then
					
					self.sound = ClientSound.Create(AssetLocation.Game, {
						position = LocalPlayer:GetPosition(),
						angle = Angle(),
						bank_id = item.valor.bank_id,
						sound_id = item.valor.sound_id,
						variable_id_focus = 0,
					})

				end
			else
				if self.sound then
					self.sound:Remove()
					self.sound = nil
				end
			end
		
		end
	)
	
	listaItemBuzina:SubscribeItemSelecionado(
		function(item)
		
			if item.valor then
				if self:PossuiDinheiro(item.valor.preco) then
				
					Network:Send("ComprarBuzina", {player = LocalPlayer, bank_id = item.valor.bank_id, sound_id = item.valor.sound_id, preco = item.valor.preco})
					
					for _, item in pairs(listaItemBuzina.itens) do
						item:SetActive(true)
					end
					item:SetActive(false)
				end
			end
		
		end
	)
	
	local itemVender = ItemPlus({
		texto = "Vender",
		active = souDono,
		descricao = "Vender o veiculo.",
	})	
		
	local listaItemVender = ListaPlus({subTitulo = "VENDER"})
	itemVender:SetLista(listaItemVender)
	local precoVeiculo = self.database:GetPrecoVeiculo(veiculo:GetModelId(), veiculo:GetTemplate())
	listaItemVender:AddItem(ItemPlus({
		texto = "Vender",
		textoSecundario = "R$ ".. precoVeiculo,
		descricao = "Vender veiculo por R$ ".. precoVeiculo,
		valor = {preco = precoVeiculo},
	}))
	
	listaItemVender:SubscribeItemSelecionado(
		function(item)
		
			Network:Send("VenderVeiculo", {player = LocalPlayer, preco = item.valor.preco})
		
		end
	)
	lista:SubscribeItemSelecionado(
		function(item)
		
			if item.valor.id == 1 then
				if self:PossuiDinheiro(item.valor.preco) then
					Network:Send("RepararVeiculo", {preco = item.valor.preco})
					item:SetActive(false)
					item.textoSecundario = ""
				end
			end
			
			if item.valor.id == 2 then
				if self:PossuiDinheiro(item.valor.preco) then
					Network:Send("RepararEstrutura", {player = LocalPlayer, veiculo = LocalPlayer:GetVehicle(), preco = item.valor.preco})
					item:SetActive(false)
					item.textoSecundario = ""
				end
			end
		
		end
	)
	
	lista:AddItem(itemRepararMotor)
	lista:AddItem(itemRepararEstrutura)
	lista:AddItem(itemPintura)
	lista:AddItem(itemPlaca)
	lista:AddItem(itemModificacoes)
	lista:AddItem(itemHidraulica)
	lista:AddItem(itemBuzina)
	lista:AddItem(itemLuzes)
	lista:AddItem(itemVender)
	
end


function PaynSpray:GetVeiculoAtual()

	if LocalPlayer:InVehicle() then
		return LocalPlayer:GetVehicle()
	end
	
	if self.veiculo then
		return self.veiculo
	end
	
	return nil

end


function PaynSpray:PossuiDinheiro(valor)

	if LocalPlayer:GetMoney() < valor then
		Chat:Print("Voce nao possui dinheiro suficiente para essa operacao!", Color(255,0,0))
		return false
	end
	return true

end


paynSpray = PaynSpray()