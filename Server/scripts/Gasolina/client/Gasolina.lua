class 'Gasolina'

function Gasolina:__init()

	Network:Subscribe("AtualizarDados", self, self.AtualizarDados)

	Network:Subscribe("Abastecer", self, self.Abastecer)
	Network:Subscribe("EntrouNoPosto", self, self.EntrouNoPosto)

	Events:Subscribe("LocalPlayerEnterVehicle", self, self.LocalPlayerEnterVehicle)
	Events:Subscribe("LocalPlayerExitVehicle", self, self.LocalPlayerExitVehicle)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)	
	
	Events:Subscribe("ItemSelecionado", self, self.ItemSelecionado)

	Events:Subscribe("InputPoll", self, self.AereoDec)

	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("Render", self, self.Render)
	
	self.timer = Timer()
	self.timerDelay = Timer()

	self.noPosto = false
	
	self.veiculo = nil
	self.tipoVeiculo = nil
	self.gasto = nil
	self.gasolina = nil
	
	self.salvo = true
	self.tempoSalvo = 60
	
	-- idHabilitacao por tipo de veiculo
	self.tipos = {}
	self.tipos[1] = 1
	self.tipos[2] = 6
	self.tipos[3] = 5
	self.tipos[4] = 2
	self.tipos[5] = 2
	self.tipos[6] = 3
	self.tipos[7] = 4
	self.tipos[8] = 4
	
	self.veiculos = {}
	
	self.menu = nil
	self.active = false	
	
	self.itens = {}
	table.insert(self.itens, {idAlimento = 1, nome = "Agua 400 ml", preco = 4})
	table.insert(self.itens, {idAlimento = 2, nome = "Refrigerante 500 ml", preco = 6})
	table.insert(self.itens, {idAlimento = 4, nome = "Salgadinho", preco = 6})
	table.insert(self.itens, {idAlimento = 5, nome = "Barra de Cereal", preco = 5})
	table.insert(self.itens, {idAlimento = 3, nome = "Galao de Combustivel", preco = 50, descricao = "Galao de 15L para abastecer quando quiser."})
	
	self.habilitacoes = {}
	
	self:AtualizarMenu()
	
	self.labelTextoActive = false
	
	self.labelTexto = TextBox.Create()
	self.labelTexto:SetTextSize(self.labelTexto:GetTextSize() * 2)
	self.labelTexto:SetSize(self.labelTexto:GetSize() * 2)
	self.labelTexto:SetPosition(Render.Size / 2 - self.labelTexto:GetSize() / 2)
	self.labelTexto:Subscribe("ReturnPressed", self, self.LabelConfirma)
	self.labelTexto:Subscribe("EscPressed", self, self.SairLabel)

	self.labelTexto:SetVisible(self.labelTextoActive)	
	
	self.templates = {}
	self.templates["Policia"] = {profissao = "Policiais", carreiras = {4}}
	self.templates["Polici"] = {profissao = "Policiais", carreiras = {4}}
	self.templates["Tax"] = {profissao = "Taxistas", carreiras = {5}}
	
end


function Gasolina:AtualizarDados(args)
	
	if args.gasolina then
		self.gasolina = args.gasolina
	end
	
	if args.veiculos then
		self.veiculos = args.veiculos
	end
	
	self.habilitacoes = {}
	
	for _, h in pairs(args.habilitacoes) do

		self.habilitacoes[tonumber(h.idHabilitacao)] = true
	
	end
	
	if LocalPlayer:GetVehicle() and LocalPlayer:GetVehicle():GetDriver() == LocalPlayer then
		self:LocalPlayerEnterVehicle({is_driver = true, vehicle = LocalPlayer:GetVehicle()})
	end

end


function Gasolina:Abastecer(args)

	self.gasolina = self.gasolina + args
	if self.gasolina > 100 then
		self.gasolina = 100
	end

end


function Gasolina:EntrouNoPosto(args)

	self.noPosto = args

end


function Gasolina:SairLabel()

	if not self.labelTextoActive then return end
	self.labelTextoActive = false
	self.labelTexto:SetVisible(self.labelTextoActive)
	
end


function Gasolina:LabelConfirma()

	if not self.labelTextoActive then return end
	
	local txt = self.labelTexto:GetText() 
	
	if string.len(self.labelTexto:GetText()) == 0 then
		self:SairLabel()
		return
	end
	
	local litros = tonumber(txt)
	
	if not litros then
		Chat:Print("Apenas sao aceitos numeros!", Color(255,0,0))
		return
	end
	
	litros = math.floor(litros)
	
	if litros < 0 then
		self:SairLabel()
		return
	end
	
	Network:Send("Abastecer", {player = LocalPlayer, litros = litros, gasolina = self.gasolina})	
	
	self:SairLabel()
	
end


function Gasolina:ItemSelecionado(args)

	if self.active then
	
		if args[1][1] == 1 then

			if self.gasolina >= 99.9 then
				Chat:Print("Seu tanque esta cheio!", Color(255,0,0))
				return
			end
	
			Network:Send("Abastecer", {player = LocalPlayer, litros = 100, gasolina = self.gasolina})
			return
		end		
		
		if args[1][1] == 2 then
			
			self:SetActive(false)
			self:AtivarLabel()
			return
		end			
		
		if args[1][1] == 3 then
			Chat:Print("Essa funcao esta indisponivel no momento", Color(255,0,0))
			-- Network:Send("ComprarGalao", LocalPlayer)
			return
		end	

		if args[1][1] == 4 then
		
			Network:Send("ComprarAlimento", {player = LocalPlayer, id = args[1][2]})
			return
		end

	end

end


function Gasolina:AtivarLabel()
	
	self.labelTextoActive = true
	self.labelTexto:Focus() 
	self.labelTexto:SetVisible(self.labelTextoActive)	
	self.labelTexto:SetPosition(Render.Size / 2 - self.labelTexto:GetSize() / 2)
	
end


function Gasolina:KeyUp(args)

	if args.key == string.byte("J") then
	
		if self.noPosto then
			self:SetActive(not self:GetActive())
		else
			if self.active then
				self:SetActive(false)
			end
		end

	end

end


function Gasolina:AtualizarMenu()

	local argsMenu = {
		posicao = Vector2(Render.Width / 2 - 125, 150),
		corFundo = Color(27, 188, 155),
		corTitulo = Color(255, 255, 255),
		titulo = "Posto de Gasolina",
		argsLista = {subTitulo = "MENU"}
	}
	
	self.menu = MenuPlus(argsMenu)

	local lista = self.menu.lista

	lista:AddItem(ItemPlus({texto = "Abastecer 100%", descricao = "Encher o tanque.", valor = {1}}))
	lista:AddItem(ItemPlus({texto = "Abastecer personalizado", descricao = "Abasteca quanto quiser.", valor = {2}}))

	for _, item in pairs(self.itens) do
		
		local descricao = "Comprar ".. item.nome.. "\n por R$ ".. item.preco.."."
		if (item.descricao) then descricao = descricao .. "\n" ..item.descricao end
		
		lista:AddItem(ItemPlus({
			texto = item.nome,
			textoSecundario = "R$ "..item.preco,
			descricao = descricao,
			
			
			valor = {
				3,
				item = item,
			},
		}))

	end
	
	lista:SubscribeItemSelecionado(
		function(item)
			
			if (item.valor[1] == 1) then
			
				if self.gasolina >= 99.9 then
					Chat:Print("Seu tanque esta cheio!", Color(255,0,0))
					return
				end
		
				Network:Send("Abastecer", {litros = 100, gasolina = self.gasolina})
				return
			end			
			
			if (item.valor[1] == 2) then
				self:SetActive(false)
				self:AtivarLabel()
				return
			end		

			if (item.valor[1] == 3) then
				
				local itemInventario = item.valor.item
				if (LocalPlayer:GetMoney() < itemInventario.preco) then
					Chat:Print("Voce nao possui dinheiro suficiente para comprar um "..itemInventario.nome.."!", Color(255,0,0))
					return
				end

				Network:Send("ComprarItem", {item = itemInventario})

				return
			end

		end
	)
	
	
end

function Gasolina:LocalPlayerExitVehicle(args)

	self:Limpar()

end


function Gasolina:LocalPlayerEnterVehicle(args)
	
	if not args.is_driver then return end

	if not self:ValidarPossoDirigir(args.vehicle, true) then
		Network:Send("EjetarVeiculo")
		return false
	end
	
	if self.veiculoEntrando and self.veiculoEntrando.veiculo and self.veiculoEntrando.player then
	
		if args.veiculo == self.veiculoEntrando.veiculo then 
		
			if self.veiculoEntrando.player:GetValue("Carregado") then
				Chat:Print("Voce nao pode assaltar um veiculo carregado!", Color(255,0,0))
				return false
			end
			
			if self.veiculoEntrando.player:GetValue("naAutoEscola") then
				Chat:Print("Voce nao pode assaltar um veiculo da autoescola!", Color(255,0,0))
				return false
			end
			
		end
		self.veiculoEntrando = nil
	end
	
	self.veiculo = args.vehicle
	
	
	local infos = self:GetInfosVeiculo(self.veiculo:GetModelId())
	
	self.gasto = infos.gasto
	self.tipoVeiculo = infos.tipo
	
end


function Gasolina:Limpar()

	self.veiculo = nil
	self.gasto = nil
	self.tipoVeiculo = nil

end


function Gasolina:GetInfosVeiculo(veiId)

	for _, v in pairs(self.veiculos) do
		
		if tonumber(v.idVeiculo) == veiId then
			return {gasto = v.gastoGasolina, habilitacao = self.tipos[tonumber(v.tipo)], tipo = tonumber(v.tipo)}
		end
	
	end
	
	return {gasto = 0.0001, habilitacao = 0, tipo = 1}

end


function Gasolina:PostTick()

	if self.timer:GetSeconds() > 1 then

		if self.salvo then
		
			self.tempoSalvo = self.tempoSalvo - 1
			
			if self.tempoSalvo <= 0 then
				self.salvo = false
				self.tempoSalvo = 60
			end
		end
		
		if self.veiculo then
			
			if not self.salvo then
				Network:Send("SalvarGasolina", {player = LocalPlayer, gasolina = self.gasolina})
				self.salvo = true
			end
			
			if self.gasolina > 0 and LocalPlayer:InVehicle() then
			
				local velocidade = -LocalPlayer:GetVehicle():GetAngle() * LocalPlayer:GetVehicle():GetLinearVelocity()
				velocidadeFrente =  math.ceil(math.abs(-velocidade.z))	

				self.gasolina = self.gasolina - (velocidadeFrente * self.gasto) 
				self.gasolina = self.gasolina - self.gasto * 2

			end
		
		end
		
		self.timer:Restart()
	end
	
end


function Gasolina:ValidarPossoDirigir(veiculo, semResposta)
	
	if LocalPlayer:GetValue("naAutoEscola") then
		return true
	end	
	
	local hab = self:GetInfosVeiculo(veiculo:GetModelId()).habilitacao

	if self.habilitacoes[hab] then
		return true
	end

	local template = self.templates[veiculo:GetTemplate()]
	if template then
		local posso = false
		for _, car in pairs(template.carreiras) do
		
			if car == LocalPlayer:GetValue("idCarreira") then
				posso = true
			end
		end
		
		if not posso then
			Chat:Print("Este veiculo e reservado a ".. tostring(template.profissao) .."!", Color(255,0,0))
			return false
		end
		
	end
	
	if hab == 5 or hab == 6 or hab == 3 then
		if not semResposta then
			Chat:Print("Voce nao possue habilitacao para dirigir esse veiculo! Portanto nao sabe dirigir-lo!", Color(255,0,0))	
		end
		return false
	end
	
	if not semResposta then
		Chat:Print("Voce nao possue habilitacao para dirigir esse veiculo! Cuidado com os policiais!", Color(255,0,0))
	end

	
	return true
			
end


function Gasolina:LocalPlayerInput(args)
	
    if ( args.input == Action.UseItem ) then
		
		if LocalPlayer:InVehicle() then
			return
		end
		
		if self.timerDelay:GetSeconds() < 0.6 then return false end
		self.timerDelay:Restart()
		
		local veiculo = LocalPlayer:GetAimTarget().vehicle
		
		if not veiculo then
		
			veiculo = LocalPlayer:GetVehicle()

		end	

		if not veiculo then
		
			return false

		end

		if Vector3.Distance(LocalPlayer:GetPosition(), veiculo:GetPosition()) > 10 then
			return false
		end
		
		if veiculo:GetDriver() then
			self.veiculoEntrando = {player = veiculo:GetDriver(), veiculo = veiculo}
		
			-- return false
		end	

		if not self:ValidarPossoDirigir(veiculo) then
			return false
		end		
		
	end

	if self.active then
		return false
	end
	
	if self.labelTextoActive then

		return false
	
	end
	
	if self.veiculo then

		if self.gasolina <= 0 then
		
			if (args.input == Action.Reverse or args.input == Action.Accelerate or args.input == Action.PlaneIncTrust or args.input == Action.HeliIncAltitude or args.input == Action.HeliForward) then
				return false
			end
			
		end
		
	end
	
end


function Gasolina:SetActive(args)

	
	self.active = args	

	if self.menu then
	
		self.menu:SetActive(args)
	end

end


function Gasolina:GetActive()

	return self.active
	
end


function Gasolina:Render()

	if self.active then

		if self.menu then
		
			if (not self.menu:GetActive()) then
			
				self:SetActive(false)
			end

		end
		
		text = "Setas para cima e para baixo para selecionar.\nEnter para confirmar."		
		
		Render:FillArea(Vector2(10, Render.Height / 3), Vector2(20,20) + Vector2(Render:GetTextWidth(text, 15), Render:GetTextHeight(text, 15)), Color(0,0,0,100))
		Render:DrawText(Vector2(20, Render.Height / 3 + 10), text, Color(255,255,255,230), 15)
		
	end

	
	Mouse:SetVisible(self.labelTextoActive)	
	if self.labelTextoActive then

		Render:FillArea(self.labelTexto:GetPosition() - Vector2(25, 30), self.labelTexto:GetSize() + Vector2(50,60), Color(0,0,0,100))
		Render:DrawText(self.labelTexto:GetPosition() - Vector2(0, 20), "Digite os litros que deseja abastecer:", Color(255,255,255))
	
	end
	
	
	if self.gasolina and self.veiculo then

		if not(LocalPlayer:InVehicle()) then
			self:LocalPlayerExitVehicle()
			return
		end	
		
		if self.gasolina > 100 then
			gasolinaCSS = string.sub(self.gasolina, 1, 5)
		else
			if self.gasolina < 10 then
				gasolinaCSS = string.sub(self.gasolina, 1, 3)
			else
				if self.gasolina < 1 then
					gasolinaCSS = string.sub(self.gasolina, 1, 2)
				else
					gasolinaCSS = string.sub(self.gasolina, 1, 4)
				end			
			end
		end
		

		

		-- if self.gasolina <= 25 then
		
			-- color =  Color(255, 140, 0)

		-- else
			
			color =  Color(240,240,240,230)

		-- end

		
		local pos = Vector2(Render.Width - 220, Render.Height - Render.Height / 3.5)
		local tam = Vector2(190,35)
		
		local txtGasolina = "Gasolina"	

		if LocalPlayer:GetValue("Lingua") == 1 then

			txtGasolina = "Gasoline"	
		end
		
		pos = pos + Vector2(0, tam.y * 2 + 6)
		local prop = (tam.x - 20) * tonumber(self.gasolina) / 100
		Render:FillArea(pos, tam, Color(0,0,0,75))
		Render:DrawText(pos + Vector2(10, tam.y / 2 + 2- Render:GetTextHeight(txtGasolina, 15)), txtGasolina, Color(255,255,255), 15)
		Render:FillArea(pos + Vector2(10, tam.y / 2 + 2), Vector2(tam.x - 20, 8), Color(100,100,100,230))
		Render:FillArea(pos + Vector2(10, tam.y / 2 + 2), Vector2(prop, 8), color)
		
		
	end

end

 
function Gasolina:AereoDec()

	if self.gasolina and self.gasolina <= 0 and (self.tipoVeiculo == 2 or self.tipoVeiculo == 3) then
		Input:SetValue(Action.PlaneDecTrust, 1.0)
		Input:SetValue(Action.HeliDecAltitude, 1.0)
	end

end


gasolina = Gasolina()