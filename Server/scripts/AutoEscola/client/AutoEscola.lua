class 'AutoEscola'


function AutoEscola:__init()

	self.menu = nil

	self.menuActive = false
	self.testeActive = false

	self.tempoEsperando = 0
	self.naAutoEscola = false
	self.tempoRestante = 0
	self.habilitacoes = {}
	self.habilitacoes[1] = {
		
		tempo = 130,
		preco = 500,
		nome = "Carros",
		posicoes = {
			Vector3(-13430.84, 203.5, -1132),
			Vector3(-13365.4, 203.5, -950),
			Vector3(-13111.4, 203.5, -765.3),
			Vector3(-13142.34, 203.5, -886.9),
			Vector3(-13127.29, 203.5, -1039.9),
			Vector3(-13176, 203.5, -1117.74),
			Vector3(-13182.16, 203.5, -1318.7),
			Vector3(-13403.59, 203.5, -1279.7),
			Vector3(-13371.8, 203.5, -1481),
			Vector3(-13444, 203.5, -1554.2),
			Vector3(-13365.6, 203.5, -1718),
			Vector3(-12915.3, 203.6, -1328.7),
		}
		
	}
	
	self.habilitacoes[2] = {
		
		tempo = 80,
		preco = 700,
		nome = "Motos",
		posicoes = {
			Vector3(-10068, 203, -2495),
			Vector3(-10053, 203, -2336),
			Vector3(-9998, 203, -2229),
			Vector3(-9841, 203, -2333),
			Vector3(-9794, 203, -2459),
			Vector3(-9958, 203, -2588),
			Vector3(-9835, 203, -2735),
			Vector3(-10028, 203, -2804),
			Vector3(-10048, 203, -2911),
			Vector3(-10190, 203, -2956),
			Vector3(-10310, 203, -2985),
			Vector3(-10288, 203, -2801),

		}
		
	}	
	
	self.habilitacoes[3] = {
		
		tempo = 115,
		preco = 2000,
		nome = "Barcos",
		posicoes = {
		
			Vector3(-5247,200,11997),
			Vector3(-5230,200,11838),
			Vector3(-5122,200,11562),
			Vector3(-4892,200,11193),
			Vector3(-4870,200,10827),
			Vector3(-4728,200,10348),
			Vector3(-4878,200,9926),
			Vector3(-5621,200,9765),
			Vector3(-5768,200,9520),
			Vector3(-5771,200,9302),
			Vector3(-6208,200,9178),
			Vector3(-6603,200,9122),
			Vector3(-6762,200,8885),

		}
		
	}	
	
	self.habilitacoes[4] = {
		
		tempo = 160,
		preco = 1500,
		nome = "Caminhoes",
		posicoes = {

			Vector3(-8793,240,7436),
			Vector3(-8750,218,7218),
			Vector3(-8532,214,7059),
			Vector3(-8387,214,6739),
			Vector3(-8204,218,6381),
			Vector3(-8137,207,5961),
			Vector3(-8276,216,5766),
			Vector3(-8514,205,5636),
			Vector3(-8627,206,5208),
			Vector3(-9075,216,4938),
			Vector3(-9180,219,4860),

		}
		
	}	
	
	self.habilitacoes[5] = {
		
		tempo = 300,
		preco = 3000,
		nome = "Helicopteros",
		posicoes = {

			Vector3(-11641, 318, -935),
			Vector3(-11891, 294, -1228),
			Vector3(-12299, 294, -1229),
			Vector3(-12625, 294, -1110),
			Vector3(-12930, 294, -1013),
			Vector3(-13161, 279, -1210),
			Vector3(-13255, 293, -1505),
			Vector3(-13373, 245, -1666),

		}
		
	}
	
	self.habilitacoes[6] = {
		
		tempo = 300,
		preco = 4000,
		nome = "Avioes",
		posicoes = {

			Vector3(-366, 393, -3434),
			Vector3(-2204, 398, -3135),
			Vector3(-5901, 210, -3007),
			Vector3(-6095, 208, -3005),

		}
		
	}


	self.posicaoInicial = nil
	self.foraVeiculo = false
	self.timer = Timer()
	self.timerForaVeiculo = Timer()
	self.habilitacaoAtual = 0
	self.checkpointAtual = 0
	self.veiculo = nil
	
	self.largando = false
	
	self.tempoComecando = 5
	
	-- self.nomeHab[1] = "Carros"
	-- self.nomeHab[2] = "Motos"
	-- self.nomeHab[3] = "Barcos"
	-- self.nomeHab[4] = "Caminhoes"

	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("LocalPlayerExitVehicle", self, self.LocalPlayerExitVehicle)
	Events:Subscribe("LocalPlayerEnterVehicle", self, self.LocalPlayerEnterVehicle)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Network:Subscribe("ComecarTeste", self, self.ComecarTeste)
	Network:Subscribe("EntrouCheckpoint", self, self.EntrouCheckpoint)
	
	self.argola = ClientEffect.Create(AssetLocation.Game, { effect_id = 364, position = Vector3(0,2,0), angle = LocalPlayer:GetAngle() })

	self:AtualizarMenu()
end


function AutoEscola:EntrouCheckpoint(args)

	self.naAutoEscola = args

end


function AutoEscola:LocalPlayerInput()

	if self.largando and LocalPlayer:InVehicle() then
		return false
	end

end


function AutoEscola:PostTick()

	if self.timer:GetSeconds() > 1 then
		
		if self.largando then
			if LocalPlayer:InVehicle() then
				
				self.tempoComecando = self.tempoComecando - 1
				if self.tempoComecando <= 0 then
					Network:Send("Comecei", LocalPlayer)
					self.largando = false
				end
			else
				self.tempoEsperando = self.tempoEsperando + 1
				
				if (self.tempoEsperando > 10) then
					self:VeiculoNaoApareceu()
				end
			end
		end
		
		if self.testeActive then
		
			if not self.largando then
			
				self.tempoRestante = self.tempoRestante - 1
				if self.tempoRestante <= 0 then
				
					self:Falhou()
				
				end
			end
		
		end
		
		if self.foraVeiculo then
		 
			if self.timerForaVeiculo:GetSeconds() > 20 then
			
				self:Falhou()
			
			end
		
		end
		self.timer:Restart()
	
	end
end


function AutoEscola:Limpar()

	self.tempoEsperando = 0
	self.menuActive = false
	self.testeActive = false
	self.naAutoEscola = false
	self.tempoRestante = 0
	self.posicaoInicial = nil
	self.largando = false
	self.tempoComecando = 5
	self.foraVeiculo = false
	self.habilitacaoAtual = 0
	self.checkpointAtual = 0
	self.veiculo = nil
	if self.argola then
		self.argola:Stop()
	end
end


function AutoEscola:VeiculoNaoApareceu()
	
	Network:Send("VeiculoNaoApareceu", {player = LocalPlayer, veiculo = self.veiculo, posicao = self.posicaoInicial, idHabilitacao = self.habilitacaoAtual})
	Chat:Print("A autoescola esta sobrecarregada com alunos! Tente novamente mais tarde! Voce foi reembolsado!", Color(255,0,0))
	self:Limpar()
	
end


function AutoEscola:Falhou()
	
	if not IsValid(self.veiculo) then
		self.veiculo = nil
	end
	Network:Send("FalhouTeste", {player = LocalPlayer, veiculo = self.veiculo, posicao = self.posicaoInicial})
	Chat:Print("Voce falhou no teste!", Color(255,0,0))
	self:Limpar()
	
end


function AutoEscola:DrawText(pos, text, cor, size)

	if not size then
		size = 15
	end
	Render:DrawText(Vector2(1,1) + pos, text, Color(0,0,0,120), size)
	Render:DrawText(pos, text, cor, size)
end


function AutoEscola:Render()

	if self.menuActive then
	
		if self.menu then
		
			if (not self.menu:GetActive()) then
				self:SetMenuActive(false)
			end

		end
	
	end
	
	if self.testeActive then
	
		if type(self.veiculo) == "number" then
		
			if Vehicle.GetById(self.veiculo) then
				self.veiculo = Vehicle.GetById(self.veiculo)
			end
		
		end
		if self.largando then
		
			local txt = tostring(self.tempoComecando)
			if self.tempoComecando <= 1 then
				txt = "GO!"
			end
			
			local pos = Vector2(Render.Width / 2, Render.Height / 5)
				
			local size = 100
				
			self:DrawText(pos - Render:GetTextSize(txt, size) / 2, txt, Color(247, 202, 24), size)
						
			
			
			local txtAlerta = "Nao colida o veiculo!"
			pos = pos + Vector2(0, 150)
			size = 35
			Render:FillArea(pos - Render:GetTextSize(txtAlerta, size) / 2 - Vector2(20, 20), Render:GetTextSize(txtAlerta, size) + Vector2(40, 25), Color(0,0,0,100))
			self:DrawText(pos - Render:GetTextSize(txtAlerta, size) / 2, txtAlerta, Color(238,20,20), size)
			
			
		end
		
		local tamHud = Vector2(190,35)
		local posHud = Vector2(Render.Width - 30 - tamHud.x, Render.Height / 3.5)
			
		local txtTitulo = "AUTOESCOLA"	
		-- local txtMercadoria = tostring(self.carregado.mercadoria.nome)
		local txtCheckpoint = self.checkpointAtual - 1 .. " / "..tostring(#self.habilitacoes[self.habilitacaoAtual].posicoes)
		local txtTempo = "Tempo: "
			

		if LocalPlayer:GetValue("Lingua") == 1 then
			txtTitulo = "DRIVING SCHOOL"	
			txtTempo = "Time: "	
		end
		
		txtTempo = txtTempo .. self.tempoRestante.. " s"
		
		local size = 15
		
		Render:FillArea(posHud, tamHud, Color(0,0,0,75))
		self:DrawText(posHud + Vector2(tamHud.x /2 - Render:GetTextWidth(txtTitulo, size) / 2, tamHud.y / 2 - Render:GetTextHeight(txtTitulo, size) / 2), txtTitulo, Color(255, 248, 238), size)
		
		Render:FillArea(posHud + Vector2(0, 2 + tamHud.y), tamHud, Color(0,0,0,75))
		self:DrawText(posHud + Vector2(10, 2 + tamHud.y + tamHud.y / 2 - Render:GetTextHeight(txtCheckpoint, size) / 2), txtCheckpoint, Color(249, 105, 14), size)
		
		Render:FillArea(posHud + Vector2(0, (2 + tamHud.y) * 2), tamHud, Color(0,0,0,75))
		self:DrawText(posHud + Vector2(10, (2  + tamHud.y) * 2 + tamHud.y / 2 - Render:GetTextHeight(txtTempo, size) / 2), txtTempo, Color(255, 248, 238), size)
	
		if self.foraVeiculo then
		
			local txt = "VOLTE PARA O VEICULO!"
			if LocalPlayer:GetValue("Lingua") == 1 then
				txt = "BACK TO THE VEHICLE!"
			end
				
			local pos = Vector2(Render.Width / 2, Render.Height / 5)
				
			local size = 45
				
			Render:FillArea(pos - Render:GetTextSize(txt, size) / 2 - Vector2(20, 20), Render:GetTextSize(txt, size) + Vector2(40, 25), Color(0,0,0,125))
			Render:DrawText(pos - Render:GetTextSize(txt, size) / 2, txt, Color(238,20,20), size)
			
		end
		
		if self.habilitacoes[self.habilitacaoAtual] then
			
			if self.habilitacoes[self.habilitacaoAtual].posicoes[self.checkpointAtual] then
			
				if Vector3.Distance(LocalPlayer:GetPosition(), self.habilitacoes[self.habilitacaoAtual].posicoes[self.checkpointAtual]) < 15 then
				
					self:ProximoCheckpoint()
				end
				
			end
			
		end
		
		if self.argola then
			self.argola:SetAngle(LocalPlayer:GetAngle())	
		end
	
	end


end


function AutoEscola:ComecarTeste(args)

	self:SetMenuActive(false)
	self.tempoRestante = self.habilitacoes[self.habilitacaoAtual].tempo
	self.tempoComecando = 5
	self.largando = true
	self.testeActive = true
	self.veiculo = args.veiculo
	self:ProximoCheckpoint()
	self.argola:Play()
	
end


function AutoEscola:ProximoCheckpoint()

	self.checkpointAtual = self.checkpointAtual + 1
	if self.habilitacoes[self.habilitacaoAtual].posicoes[self.checkpointAtual] then
	
		self.argola:SetPosition(self.habilitacoes[self.habilitacaoAtual].posicoes[self.checkpointAtual])
		Waypoint:SetPosition(self.habilitacoes[self.habilitacaoAtual].posicoes[self.checkpointAtual])
	else
		if self.habilitacaoAtual == 5 or self.habilitacaoAtual == 6 then
			if math.abs(LocalPlayer:GetLinearVelocity():Length() * 3.6) > 20 then
				return
			end
		end
		Network:Send("CompletouTeste", {player = LocalPlayer, veiculo = self.veiculo, habilitacao = self.habilitacaoAtual, posicao = self.posicaoInicial})
		self:Limpar()
	
	end

end


function AutoEscola:AtualizarMenu()

	local argsMenu = {
		posicao = Vector2(Render.Width / 2 - 225, 150),
		corFundo = Color(27, 188, 155),
		corTitulo = Color(255, 255, 255),
		titulo = "Autoesocla",
		argsLista = {subTitulo = "HABILITACOES"}
	}
	
	self.menu = MenuPlus(argsMenu)

	local lista = self.menu.lista
	
	for i, habilitacao in ipairs(self.habilitacoes) do
	
		local item = ItemPlus({
			texto = habilitacao.nome,
			descricao = "Habilitacao para "..habilitacao.nome,
			textoSecundario = "R$ "..habilitacao.preco,
			valor = i
		})
		
	    lista:AddItem(item)

	end

	lista:SubscribeItemSelecionado(
		function(item)

			if LocalPlayer:GetMoney() < self.habilitacoes[item.valor].preco then
				Chat:Print("Voce nao possui dinheiro para fazer o Teste!", Color(255,0,0))
				return
			end
				
			self.posicaoInicial = LocalPlayer:GetPosition()
			self.habilitacaoAtual = item.valor
				
			Network:Send("FazerTeste", {player = LocalPlayer, habilitacao = item.valor})

		end
	)

		
end


function AutoEscola:GetMenuActive()

	return self.menuActive

end


function AutoEscola:SetMenuActive(args)

	if args then
		Events:Fire("FecharMenuPlus")
	end
	
	self.menuActive = args
	
	if self.menu then
	
		self.menu:SetActive(args)
	end

end


function AutoEscola:KeyUp(args)

	if args.key == string.byte("J") then
		
		if self.naAutoEscola then
			self:SetMenuActive(not self:GetMenuActive())
		else
			if self.menuActive then
				self:SetMenuActive(false)
			end
		end

	end
	
end


function AutoEscola:LocalPlayerExitVehicle(args)

	if self.testeActive then
		if args.vehicle == self.veiculo then
			
			self.foraVeiculo = true
			self.timerForaVeiculo:Restart()
			
		end
	end

end


function AutoEscola:LocalPlayerEnterVehicle(args)

	if self.testeActive then
		if args.vehicle == self.veiculo then
			self.foraVeiculo = false
		end
	end
	
end


ae = AutoEscola()