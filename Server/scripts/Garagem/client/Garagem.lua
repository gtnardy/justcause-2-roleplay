class 'Garagem'

function Garagem:__init()

	self.active = false
	self.menuActive = false
	self.menu = nil
	self:CriarMenu()
	
	self.nivelMorador = nil
	self.veiculosGaragem = {}
	
	self.posicaoGaragem = Vector3(-12048,203,-5348)
	
	Network:Subscribe("EntrouGaragem", self, self.EntrouGaragem)

	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)

	Events:Subscribe("KeyUp", self, self.KeyUp)
	
	Events:Subscribe("LocalPlayerEnterVehicle", self, self.PlayerEnterVehicle)
	Events:Subscribe("LocalPlayerExitVehicle", self, self.PlayerExitVehicle)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	
	self.timer = Timer()
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("Render", self, self.Render)
	
end


function Garagem:Render()

	if self.menuActive and not self.menu:GetActive() then
		self:SetMenuActive(false)
	end

end



function Garagem:PostTick()

	if self.active and self.timer:GetSeconds() > 2 then
		if Vector3.Distance(self.posicaoGaragem, LocalPlayer:GetPosition()) > 50 then
			Network:Send("FugiuGaragem")
		end
		self.timer:Restart()
	end

end


function Garagem:ModuleLoad()

	self.gerenciadorVeiculos = GerenciadorVeiculos()

end


function Garagem:KeyUp(args)

	if self.active then
		if args.key == string.byte("J") then
			
			Network:Send("EntrarGaragem", {player = LocalPlayer, boolean = false})
		end
	end

end


function Garagem:EntrouGaragem(args)
	
	if args then

		self.veiculosGaragem = args.veiculos
		for _, veiculo in ipairs(self.veiculosGaragem) do
			
			self.gerenciadorVeiculos:AdicionarVeiculo(veiculo.veiculoId, {veiculoId = veiculo.veiculoId, utensilhos = veiculo.utensilhos})
		end
		self.nivelMorador = args.nivelMorador
		self:SetActive(true)

	else
		for _, veiculo in ipairs(self.veiculosGaragem) do
		
			self.gerenciadorVeiculos:RemoverVeiculo(veiculo.veiculoId)
		end
		self:SetMenuActive(false)
		self:SetActive(false)
	end

end


function Garagem:LocalPlayerInput(args)

	if self.active and LocalPlayer:InVehicle() and not(args.input == Action.LookLeft or args.input == Action.LookDown or args.input == Action.LookRight or args.input == Action.LookUp or args.input == Action.EnterVehicle or args.input == Action.ExitVehicle or args.input == Action.UseItem ) then
		return false
	
	end	

end


function Garagem:PlayerExitVehicle(args)
	
	if self.active then
		self:SetMenuActive(false)

	end

end


function Garagem:PlayerEnterVehicle(args)

	if self.active and args.is_driver then

		for _, array in ipairs(self.veiculosGaragem) do

			if array.veiculoId == args.vehicle:GetId() then

				self:AtualizarMenu(array)
				self:SetMenuActive(true)
				return
			end
		end
		Chat:Print("Ocorreu um erro!", Color(255,0,0))
	end

end


function Garagem:SetMenuActive(b)

	self.menuActive = b
	self.menu:SetActive(b)
	
end


function Garagem:SetActive(b)

	self.active = b

end


function Garagem:CriarMenu()

	local argsMenu = {
		posicao = Vector2(Render.Width / 2, 200),
		corFundo = Color(25, 181, 254),
		corTitulo = Color(255, 255, 255),
		titulo = "Veiculo da\nGaragem",
		argsLista = {subTitulo = "MENU"}
	}
	
	self.menu = MenuPlus(argsMenu)
end


function Garagem:AtualizarMenu(array)
	-- idVeiculo, comQuem

	local veiculo = Vehicle.GetById(array.veiculoId)
	self.menu.titulo = veiculo:GetName()
	
	self.menu:Limpar()
	
	local lista = self.menu.lista
	lista.funcaoItemSelecionado = nil
	lista.funcaoItemAlterado = nil
	
	
	local itemDirigir = ItemPlus({
		texto = "Dirigir", 
		descricao = "Retirar o veiculo da garagem. Isso ira automaticamente guardar os outros veiculos que voce retirou da garagem.",
		valor = {id = 1, idPlayerVeiculo = array.idPlayerVeiculo}
		})
	
	lista:AddItem(itemDirigir)
	
	local itemTrancado = ItemPlus({
		texto = "Trancado", 
		textoSecundario = (array.trancado == 1 and "Sim" or "Nao"),
		descricao = "Trancar/Destrancar o veiculo, assim outros jogadores nao poderao dirigi-lo.",
		valor = {id = 2, idPlayerVeiculo = array.idPlayerVeiculo}
	})

	local itemLiberado = ItemPlus({
		texto = "Liberado", 
		textoSecundario = "<= "..array.liberado,
		descricao = "Liberar o veiculo para quem possui nivel de morador menor ou igual a...",
	})

	local listaItemLiberado = ListaPlus({subTitulo = "NIVEL DE MORADOR"})
	itemLiberado:SetLista(listaItemLiberado)
	
	listaItemLiberado:AddItem(ItemPlus({
		texto = "Dono",
		descricao = "Liberar o veiculo apenas para voce.",
		valor = {nivel = 1, idPlayerVeiculo = array.idPlayerVeiculo}
	}))
		
	for i = 2, 5 do
		listaItemLiberado:AddItem(ItemPlus({
			texto = "Nivel "..i,
			descricao = "Liberar o veiculo para quem tiver nivel de morador menor ou igual a ".. i .. ".",
			valor = {nivel = i, idPlayerVeiculo = array.idPlayerVeiculo}
		}))
	end
	
	listaItemLiberado:SubscribeItemSelecionado(
		function(item)
			Network:Send("LiberarVeiculoGaragem", {nivel = item.valor.nivel, idPlayerVeiculo = item.valor.idPlayerVeiculo})
			itemLiberado.textoSecundario = "<= "..item.valor.nivel
		end
	)
	
	lista:SubscribeItemSelecionado(
		function(item)
				
			if item.valor.id == 1 then
				Network:Send("DirigirVeiculoGaragem", {idPlayerVeiculo = item.valor.idPlayerVeiculo})
			end		
			
			if item.valor.id == 2 then
				
				if array.trancado == 1 then 
					array.trancado = 0 
					itemTrancado.textoSecundario = "Nao"
				else
					array.trancado = 1
					itemTrancado.textoSecundario = "Sim"
				end
				Network:Send("TrancarVeiculoGaragem", {idPlayerVeiculo = item.valor.idPlayerVeiculo, trancado = array.trancado})
			end			
			
			if item.valor.id == 3 then
				
				Network:Send("VenderVeiculoGaragem", {idPlayerVeiculo = item.valor.idPlayerVeiculo})
			end
			
		end
	)
		
	lista:AddItem(itemTrancado)
	lista:AddItem(itemLiberado)
	
	if self.nivelMorador == 1 then
		if array.comQuem then
			itemDirigir.textoSecundario = "EM USO"
			itemDirigir:SetDescricao(itemDirigir.descricao .. " Atencao! Um morador esta utilizando esse veiculo! Ao retira-lo da garagem, o morador perdera o veiculo." )
		end
		
		local itemVender = ItemPlus({
			texto = "Vender", 
			textoSecundario = "R$ "..math.floor(array.preco / 2),
			descricao = "Vender o veiculo por 50% do valor. Voce pode receber mais vendendo-o em um Pay 'n' Spray",
			valor = {id = 3, idPlayerVeiculo = array.idPlayerVeiculo}
		})
	
		lista:AddItem(itemVender)
	else
		itemLiberado:SetActive(false)
		itemTrancado:SetActive(false)
		
	end
end

garagem = Garagem()