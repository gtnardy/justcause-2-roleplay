class 'Policial'

function Policial:__init()
	
	self.estrelas = Estrelas()
	self.dps = {}
	self.naDp = false
	
	self.menuDp = nil
	self.menuActive = false
	self:AtualizarMenu()
	self.telaProcurados = TelaProcurados()

	self.timer = Timer()

	self.algemado = false
	self.tempoAlgemado = 60

	self.preso = false
	self.tempoPreso = 60
	self.tempoSalvarPreso = 50
	self.posicaoCadeia = Vector3(1114,204,1094)
	
	Network:Subscribe("VeiculoRoubado", self, self.VeiculoRoubado)
	Network:Subscribe("Prender", self, self.Prender)
	Network:Subscribe("Algemar", self, self.Algemar)
	Network:Subscribe("AtualizarDados", self, self.AtualizarDados)
	Network:Subscribe("AtualizarEstrelas", self, self.AtualizarEstrelas)
	Network:Subscribe("Aceitou190", self, self.Aceitou190)
	Network:Subscribe("PlayerDeath", self, self.PlayerDeath)
	Events:Subscribe("VehicleCollide", self, self.VehicleCollide)
	
	Events:Subscribe("Procurados", self, self.AtivarProcurados)
	Events:Subscribe("Punir", self, self.Punir)
	
	Events:Subscribe("LocalPlayerBulletHit", self, self.LocalPlayerBulletHit)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("PostTick", self, self.PostTick)
	
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	
	self.tempoVoando = 0
	self.punicao = nil
	self.tempoPunicao = 40

	
end


function Policial:SetarPunicao(player, id)

	self.tempoPunicao = 40
	self.punicao = {player = player, id = id, steamId = player:GetSteamId().id, nome = player:GetName()}
	
end


function Policial:VeiculoRoubado(args)

	Chat:Print("Seu veiculo foi roubado pelo ".. tostring(args).."! Caso deseja puni-lo automaticamente digite /punir!", Color(255,255,200))
	self.tempoPunicao = 40
	self:SetarPunicao(args, 4)
	
end


function Policial:VehicleCollide(args)

	if args.attacker:GetDriver() and args.player and args.player == LocalPlayer then
		if self.punicao and self.punicao.id == 3 and self.punicao.player == args.attacker:GetDriver() then
			return
		end
		
		if self.tempoVoando > 0 then
			return
		end
		
		local state = LocalPlayer:GetBaseState()
		if state == 346 or state == 250 or state == 251 or state == 252 or  state == 253 then
		
			Chat:Print("Voce foi atropleado pelo ".. tostring(args.attacker:GetDriver()).."! Caso deseja puni-lo automaticamente digite /punir!", Color(255,255,200))
			self:SetarPunicao(args.attacker:GetDriver(), 3)
		end
		


	end
	
end


function Policial:PlayerDeath(args)
	
	if args.killer then
		Chat:Print("Voce foi morto pelo ".. tostring(args.killer).."! Caso deseja puni-lo automaticamente digite /punir!", Color(255,255,200))
		
		self:SetarPunicao(args.killer, 2)
		
	end

end


function Policial:Aceitou190(args)

	Waypoint:SetPosition(args)

end


function Policial:LocalPlayerBulletHit(args)

	if args.attacker then
		Chat:Print("Voce foi atingido por uma bala de ".. tostring(args.attacker)..". Caso queira avisar os policiais automaticamente, digite /punir.", Color(255,255,0))
		
		self:SetarPunicao(args.attacker, 1)

	end

end


function Policial:Punir()
	
	if self.punicao then
		
		if self.punicao.id == 1 then
			Network:Send("Chamado190", {player = LocalPlayer, mensagem = "(AUTOMATICO) O jogador [".. tostring(self.punicao.player:GetId()).. "] ".. tostring(self.punicao.player).. " esta disparando contra mim!"})
		else		
			if self.punicao.id == 2 or self.punicao.id == 3 or self.punicao.id == 4 then

				Network:Send("PunicaoAutomatica", {player = LocalPlayer, punido = self.punicao.player, id = self.punicao.id, nomePunido = self.punicao.nome, steamIdPunido = self.punicao.steamId})
			end
		end
		
		self.punicao = nil
	
	else
		Chat:Print("Voce nao possue um pedido de punicao pendente!", Color(255,0,0))
		
	end

end


function Policial:Prender(args)

	self.tempoSalvarPreso = 50
	self.preso = true
	self.tempoPreso = args
	Chat:Print("Voce esta preso! Voce pode pagar um advogado por R$1000 digitando /advogado!", Color(255,255,0))
end


function Policial:Algemar(args)

	self.tempoAlgemado = args
	self.algemado = true
	self.algemado = false
	self.algemado = true

end


function Policial:PostTick()

	if self.timer:GetSeconds() > 1 then
		
		if self.tempoVoando > 0 then
			self.tempoVoando = self.tempoVoando - 1

		end
		
		if self.punicao then
		
			self.tempoPunicao = self.tempoPunicao - 1
			if self.tempoPunicao <= 0 then
				
				Chat:Print("O tempo para punir "..tostring(self.punicao.player).." expirou!", Color(255,255,200))
				self.punicao = nil
			end
		
		end
		
		if self.algemado then
		
			self.tempoAlgemado = self.tempoAlgemado - 1
			
			if self.tempoAlgemado <= 0 then
			
				self.algemado = false
				Network:Send("Desalgemar", {player = LocalPlayer})
			end
		end		
		
		if self.preso then
			
			self.tempoSalvarPreso = self.tempoSalvarPreso - 1
			
			if self.tempoSalvarPreso <= 0 then
				Network:Send("SalvarTempo", {player = LocalPlayer, tempo = self.tempoPreso})
				self.tempoSalvarPreso = 50
			end
			
			if Vector3.Distance(LocalPlayer:GetPosition(), self.posicaoCadeia) > 10 then
				Network:Send("FugiuCadeia", LocalPlayer)
			end
			
			self.tempoPreso = self.tempoPreso - 1
			
			if self.tempoPreso <= 0 then
			
				self.preso = false
				Network:Send("Desprender", LocalPlayer)
			end
		end
		self.timer:Restart()
	end

end


function Policial:AtivarProcurados()
	
	if self.telaProcurados then
	
		self.telaProcurados:SetActive(not self.telaProcurados:GetActive())
	end

end


function Policial:LocalPlayerInput(args)

	if self.menuActive then
		return false
	end

	if self.algemado then
		return false
	end
end


function Policial:GetMenuActive()

	return self.menuActive

end


function Policial:SetMenuActive(args)

	self.menuActive = args

	if self.menuDp then
		
		self.menuDp:SetActive(args)	

	end


end


function Policial:KeyUp(args)

	if args.key == string.byte("K") then
		
		self.tempoVoando = 6

	end
	
	if args.key == string.byte("J") then
		
		if self.naDp then
			self:SetMenuActive(not self:GetMenuActive())
		else
			if self.menuActive then
				self:SetMenuActive(false)
			end
		end

	end
	
end


function Policial:AtualizarMenu()

	local argsMenu = {
		posicao = Vector2(Render.Width / 2 - 225, 150),
		corFundo = Color(5, 37, 47),
		corTitulo = Color(255, 255, 255),
		titulo = "Dep. Policia",
		argsLista = {subTitulo = "MENU"}
	}

	self.menuDp = MenuPlus(argsMenu)

	local lista = self.menuDp.lista
	
	lista:SubscribeItemSelecionado(
		function(item)
		
			if tonumber(item.valor) == 1 then
				
				Network:Send("FichaCriminal")
				return
			end
			
		
			if tonumber(item.valor) == 2 then
				
				Network:Send("EntregarArmas")
				return
			end			
		
			if tonumber(item.valor) == 3 then
				
				Network:Send("ListarPresos")
				return
			end
			
			if tonumber(item.valor) == 4 then
			
				if LocalPlayer:GetMoney() < 10000 then
					Chat:Print("Voce nao possue dinheiro suficiente para essa operacao!", Color(255,0,0))
					return
				end
				Network:Send("ComprarPorte")
				return
			end
		
			if tonumber(item.valor) == 5 then
				
				Network:Send("PagarEstrelas")
				return
			end
		
			if tonumber(item.valor) == 6 then
				
				Network:Send("PagarMultas")
				return
			end
			
		end
	)
	
	lista:AddItem(ItemPlus({
		texto = "Minha Ficha",
		descricao = "Veja se tem alguma pendencia\ncriminal.",
		valor = 1
	}))
	
	lista:AddItem(ItemPlus({
		texto = "Entregar Armas",
		descricao = "Selecione e entregue suas armas.",
		valor = 2
	}))
	
	lista:AddItem(ItemPlus({
		texto = "Presos",
		descricao = "Listagem de todos os presos.",
		valor = 3
	}))
	
	lista:AddItem(ItemPlus({
		texto = "Comprar Porte de Armas",
		textoSecundario = "R$ 10000",
		descricao = "Compra Porte de Armas por\nR$ 10000.",
		valor = 4
	}))
	
	lista:AddItem(ItemPlus({
		texto = "Pagar Estrelas de Procurado",
		descricao = "Paga suas estrelas de procurado caso possua\n menos de tres estrelas.",
		valor = 5
	}))
	
	lista:AddItem(ItemPlus({
		texto = "Pagar Multas",
		descricao = "Paga todas as suas multas.",
		valor = 6
	}))


end


function Policial:Render()

	if self.algemado then
		
		local size = 50
		local txt = "ALGEMADO!"
		local txt2 = self.tempoAlgemado .. " segundos restantes"
		if LocalPlayer:GetValue("Lingua") == 1 then
			txt = "HANDCUFFED"
			txt2 = self.tempoAlgemado .. " seconds remaining"
		end
		Render:FillArea(Vector2(Render.Width / 2, Render.Height / 4) - Render:GetTextSize(txt, size) / 2 + Vector2(-30, 10), Render:GetTextSize(txt, size) + Vector2(60,25), Color(0,0,0,120))
		

		Render:DrawText(Vector2(1,1) + Vector2(Render.Width / 2, Render.Height / 4 + 20) - Render:GetTextSize(txt, size) / 2, txt, Color(0, 0, 0), size )
		Render:DrawText(Vector2(Render.Width / 2, Render.Height / 4 + 20) - Render:GetTextSize(txt, size) / 2, txt, Color(211, 84, 0), size )
		
		size = 17
		Render:DrawText(Vector2(1,1) + Vector2(Render.Width / 2, Render.Height / 4 + 45) - Render:GetTextSize(txt2, size) / 2, txt2, Color(0, 0, 0), size )
		Render:DrawText(Vector2(Render.Width / 2, Render.Height / 4 + 45) - Render:GetTextSize(txt2, size) / 2, txt2, Color(211, 84, 0), size )
		
		if not LocalPlayer:GetValue("algemado") then
			self.algemado = false
		end
	
	end
	
	if self.preso then
		
		local size = 50
		local txt = "PRESO!"
		local txt2 = self.tempoPreso .. " segundos restantes"
		if LocalPlayer:GetValue("Lingua") == 1 then
			txt = "ARRESTED"
			txt2 = self.tempoPreso .. " seconds remaining"
		end
		Render:FillArea(Vector2(Render.Width / 2, Render.Height / 4) - Render:GetTextSize(txt, size) / 2 + Vector2(-30, 10), Render:GetTextSize(txt, size) + Vector2(60,25), Color(0,0,0,120))
		

		Render:DrawText(Vector2(1,1) + Vector2(Render.Width / 2, Render.Height / 4 + 20) - Render:GetTextSize(txt, size) / 2, txt, Color(0, 0, 0), size )
		Render:DrawText(Vector2(Render.Width / 2, Render.Height / 4 + 20) - Render:GetTextSize(txt, size) / 2, txt, Color(211, 84, 0), size )
		
		size = 17
		Render:DrawText(Vector2(1,1) + Vector2(Render.Width / 2, Render.Height / 4 + 45) - Render:GetTextSize(txt2, size) / 2, txt2, Color(0, 0, 0), size )
		Render:DrawText(Vector2(Render.Width / 2, Render.Height / 4 + 45) - Render:GetTextSize(txt2, size) / 2, txt2, Color(211, 84, 0), size )
		
		if not LocalPlayer:GetValue("preso") then
			self.preso = false
		end
	
	end
	
	if self.menuActive and self.menuDp then
	
		if not self.menuDp:GetActive() then
			self:SetMenuActive(false)
		
		end
	end
	
	local naDp = false
	for _, dp in pairs(self.dps) do
	
		if Vector3.Distance(LocalPlayer:GetPosition(), dp.posicao) < 5 then
		
			naDp = true
		
		end
	end
	
	self.naDp = naDp

end


function Policial:AtualizarEstrelas(args)

	self.estrelas:SetEstrelas(args)

end


function Policial:AtualizarDados(args)

	self.estrelas:SetEstrelas(args.estrelas)
	self.dps = args.dps


end


pl = Policial()