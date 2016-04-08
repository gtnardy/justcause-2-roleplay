class 'Concessionaria'

function Concessionaria:__init()
	
	self.active = false
	self.menuActive = false
	self.naConcessionaria = false

	self.posicaoConcessionaria = Vector3(-13386, 206, -4542)
	
	self.veiculosConcessionaria = VeiculosConcessionaria()
	
	self.timer = Timer()
	
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("ModuleLoad", self, self.GerarMenu)
	
	Events:Subscribe("PostTick", self, self.PostTick)
	
	Events:Subscribe("LocalPlayerEnterVehicle", self, self.LocalPlayerEnterVehicle)
	Events:Subscribe("LocalPlayerExitVehicle", self, self.LocalPlayerExitVehicle)
	
	Network:Subscribe("EntrouCheckpoint", self, self.EntrouCheckpoint)
	Network:Subscribe("EntrouConcessionaria", self, self.EntrouConcessionaria)
	
end


function Concessionaria:EntrouConcessionaria(args)
	
	self:SetActive(args.boolean)
	if args.boolean then
		
	else

	end

end


function Concessionaria:GerarMenu()

	local argsMenu = {
		posicao = Render.Size / 2 - Vector2(175, 250),
		corFundo = Color(1, 152, 117),
		corTitulo = Color(255, 255, 255),
		titulo = "Concessionaria de\nAutos",
		argsLista = {subTitulo = "MENU"}
	}
	
	self.menu = MenuPlus(argsMenu)

end


function Concessionaria:AtualizarMenu(model_id, template)
	
	local infosVeiculo = self.veiculosConcessionaria:GetVeiculo(model_id, template)
	if not infosVeiculo then return end
	
	infosVeiculo.nome = Vehicle.GetNameByModelId(model_id)
	self.menu:Limpar()
	self.menu.titulo = infosVeiculo.nome
	
	local lista = self.menu.lista
	lista.funcaoItemSelecionado = nil
	lista.funcaoItemAlterado = nil
	
	local itemComprar = ItemPlus({
		texto = "Comprar...", 
		textoSecundario = "R$ ".. infosVeiculo.preco,
		descricao = "Comprar o veiculo ".. infosVeiculo.nome  .."...",
	})
	
	local listaItemComprar = ListaPlus({subTitulo = "COMPRAR"})
	itemComprar:SetLista(listaItemComprar)
	
	listaItemComprar:AddItem(ItemPlus({
		texto = "Comprar",
		textoSecundario = "R$ ".. infosVeiculo.preco,
		descricao = "Confirma sua compra do veiculo ".. infosVeiculo.nome  .." por "..infosVeiculo.preco.. "?",
		valor = {model_id = model_id, template = template, preco = infosVeiculo.preco},
	}))
	
	listaItemComprar:SubscribeItemSelecionado(
		function(item)
			
			if LocalPlayer:GetMoney() < item.valor.preco then
				Chat:Print("Voce nao possui dinheiro suficiente para efetuar essa operacao!", Color(255,0,0))
				return
			end
			
			Network:Send("ComprarVeiculo", item.valor)
			listaItemComprar:SetActive(false)
		
		end
	)
	
	lista:AddItem(itemComprar)
end


function Concessionaria:LocalPlayerInput(args)
	
	if self.menuActive and LocalPlayer:InVehicle() and not(args.input == Action.LookLeft or args.input == Action.LookDown or args.input == Action.LookRight or args.input == Action.LookUp or args.input == Action.EnterVehicle or args.input == Action.ExitVehicle or args.input == Action.UseItem) then
		return false
	end

end


function Concessionaria:KeyUp(args)
	
	if args.key == string.byte("J") then
		
		if self.active then
		
			Network:Send("EntrouConcessionaria", {boolean = false})
			return
			
		end		
		
		if self.naConcessionaria then

			Network:Send("EntrouConcessionaria", {boolean = true})
			return
			
		end

	end


end


function Concessionaria:SetMenuActive(boo)

	self.menuActive = boo
	self.menu:SetActive(boo)
	
end


function Concessionaria:SetActive(boo)

	self.active = boo
	if not boo then
		self:SetMenuActive(false)
	end

end


function Concessionaria:EntrouCheckpoint(boo)

	self.naConcessionaria = boo
	
end


function Concessionaria:LocalPlayerEnterVehicle(args)

	if self.active and args.is_driver then
		
		self:AtualizarMenu(args.vehicle:GetModelId(), args.vehicle:GetTemplate())
		self:SetMenuActive(true)

	end
	
end


function Concessionaria:LocalPlayerExitVehicle(args)
	
	if self.active then
	
		self:SetMenuActive(false)

	end
	
end


function Concessionaria:PostTick()

	if self.active then
		if self.timer:GetSeconds() > 2 then
		
			if Vector3.Distance(LocalPlayer:GetPosition(), self.posicaoConcessionaria) > 50 then
			
				Network:Send("FugiuConcessionaria")
			end
		end
		self.timer:Restart()
	end
	
end


function Concessionaria:Render()
	
	if self.dentroConcessionaria and not self.active then
	
		local text = "Voce esta em uma concessionaria!\nPara ver informacoes e preco de um veiculo basta entrar nele.\nCaso deseja sair da concessionaria, Pressione J."
		if LocalPlayer:GetValue("Lingua") == 1 then
			text = "You are in a dealership!\nFor information and price of a vehicle just get it.\nIf you want to leave, press J."
		end
		Render:FillArea(Vector2(10, Render.Height / 3), Vector2(20,20) + Vector2(Render:GetTextWidth(text, 15), Render:GetTextHeight(text, 15)), Color(0,0,0,100))
		Render:DrawText(Vector2(20, Render.Height / 3 + 10), text, Color(255,255,255,230), 15)
					
	end
	
	
	if self.menuActive and not self.menu:GetActive() then
	
		self.menu:SetActive(false)
		
	end

	if self.naConcessionaria and not self.active then

		local text = "Pressione J para entrar na concessionaria"
		if LocalPlayer:GetValue("Lingua") == 1 then
			text = "Press J to enter on Dealership"
		end
		Render:FillArea(Vector2(10, Render.Height / 3), Vector2(20,20) + Vector2(Render:GetTextWidth(text, 15), Render:GetTextHeight(text, 15)), Color(0,0,0,100))
		Render:DrawText(Vector2(20, Render.Height / 3 + 10), text, Color(255,255,255,230), 15)
					
	
	end
	
end


concessionaria = Concessionaria()