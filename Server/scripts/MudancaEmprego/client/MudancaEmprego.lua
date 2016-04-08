class 'MudancaEmprego'


function MudancaEmprego:__init()

	self.confirmando = false
	self.confirmandoCarreira = nil
	
	self.confirmandoSpawnarCarreira = false
	
	self.timer = Timer()
	
	Events:Subscribe( "FecharMenuPlus", self, self.FecharMenuPlus )
	Events:Subscribe( "PostRender", self, self.PostRender )
	Events:Subscribe( "KeyUp", self, self.KeyUp )
	Events:Subscribe( "Render", self, self.Render )
	Events:Subscribe( "ItemSelecionado", self, self.ItemSelecionado )
	Events:Subscribe( "LocalPlayerInput", self, self.LocalPlayerInput )
	
	Network:Subscribe( "AtualizarDados", self, self.AtualizarDados)
	Network:Subscribe( "EntrouAgencia", self, self.EntrouAgencia)
	Network:Subscribe( "ConfirmarMudancaCarreira", self, self.ConfirmarMudancaCarreira)
	
	self.idsCarreiras = {}
	self.idsCarreiras[22] = 1
	self.idsCarreiras[23] = 2
	self.idsCarreiras[24] = 3
	
	self.naAgencia = false
	self.agencias = {}
	self.active = false
	self.menu = nil
	self:AtualizarMenu()	
	
end


function MudancaEmprego:AtualizarMenu()


end


function MudancaEmprego:Render()

	if self.active then
		
		text = "Setas para cima e para baixo para selecionar.\nEnter para confirmar."		
		
		Render:FillArea(Vector2(10, Render.Height / 3), Vector2(20,20) + Vector2(Render:GetTextWidth(text, 15), Render:GetTextHeight(text, 15)), Color(0,0,0,100))
		Render:DrawText(Vector2(20, Render.Height / 3 + 10), text, Color(255,255,255,230), 15)
		
	end

	
	if self.menu then
	
		self.menu:SetAtivo(self.active)
	
	end

end


function MudancaEmprego:FecharMenuPlus()

	self:SetActive(false)

end


function MudancaEmprego:AtualizarDados(args)
	
	self.agencias = args

end


function MudancaEmprego:EntrouAgencia(args)

	self.naAgencia = false
	
	if args then
		for _, a in pairs(self.agencias) do
		
			if Vector3.Distance(LocalPlayer:GetPosition(), Vector3(tonumber(a.posx), tonumber(a.posy), tonumber(a.posz))) < 15 then
			
				self.naAgencia = a
			
			end
		
		end
		if not self.naAgencia then
			Chat:Print("Ocorreu um erro!", Color(255,0,0))
		end
		
	end
	

end


function MudancaEmprego:ConfirmarMudancaCarreira(args)
	
	Events:Fire("FecharMenuPlus")
	self.timer:Restart()
	self.confirmando = true
	self.confirmandoCarreira = args -- id, nome

end


function MudancaEmprego:ConfirmarSpawnarCarreira()
	
	Events:Fire("FecharMenuPlus")
	self.timer:Restart()
	self.confirmandoSpawnarCarreira = true

end


function MudancaEmprego:ConfirmadoSpawnarCarreira(boo)
	
	if boo then
		Network:Send("ConfirmadoSpawnarCarreira")
	end
	
	self.confirmandoSpawnarCarreira = false
	self.confirmandoCarreira = nil	
			
end


function MudancaEmprego:Confirmado(boo)
	
	if boo then
		Network:Send("ConfirmadoMudancaCarreira", {player = LocalPlayer, idCarreira = self.confirmandoCarreira.id, nomeCarreira = self.confirmandoCarreira.nome})
		self:ConfirmarSpawnarCarreira()
	else
		Chat:Print("Voce recusou a entrada na carreira!", Color(255,0,0))
	end
	
	self.confirmando = false
	

			
end


function MudancaEmprego:AtualizarMenu()

	self.menu = MenuPlus()
	self.menu:SetTitulo("Agencia")
	self.menu:SetTituloCorFundo(Color(27, 188, 155))
	self.menu:SetTituloCor(Color(255, 255, 255))
	self.menu:SetPosicao(Vector2(Render.Width / 2 - self.menu:GetTamanho().x  / 2, 150))
	local lista = self.menu:GetLista()
	lista:SetAtivo(true)
	lista:SetVisivel(true)
	lista:SetTituloSub("MENU")
	lista:SetRodape(true)
	lista:SetMaxColunas(6)


	local item = lista:AddItem(1, "Ingressar")
	if LocalPlayer:GetValue("Lingua") == 0 then
		item:SetDescricao("Ingresse na carreira.")
	else
		item:SetDescricao("Ingresse na carreira.")
	end
	item:SetValor({1})

	
end


function MudancaEmprego:SetActive(args)
	
	if args then
		Events:Fire("FecharMenuPlus")
	end
	
	self.active = args	
	
	if self.active then
		
		if self.menu then
			
			local txt = ""
			local arr = self.naAgencia.descricao:split(" ")
			for i = 1, #arr do
				txt = txt .. arr[i] .. " "
				if i == 2 then
					txt = txt .. "\n"
				end
				
			end
			self.menu:SetTitulo(txt)
			self.menu:GetLista():SetAtivo(true)	
			self.menu:GetLista():SetVisivel(true)

		end
	
	end
	
end


function MudancaEmprego:ItemSelecionado(args)

	if self.active then
	
		if args[1][1] == 1 then
			Network:Send("MudarCarreira", {player = LocalPlayer, idCarreira = self.idsCarreiras[tonumber(self.naAgencia.tipoUtilitario)]})
			return
		end		
		
		if args[1][1] == 2 then
			

			return
		end	

		if args[1][1] == 3 then

			return
		end

	end

end


function MudancaEmprego:GetActive()

	return self.active

end


function MudancaEmprego:KeyUp(args)

	if args.key == string.byte("J") then
	
		if self.naAgencia then
			self:SetActive(not self:GetActive())
		else
			if self.active then
				self:SetActive(false)
			end
		end
		return
	end
	
	if self.confirmando then
		
		if self.timer:GetSeconds() < 0.4 then return end
		
		if args.key == string.byte("S") or args.key == 13 then
			
			self:Confirmado(true)			
			
		end
			
		if args.key == string.byte("N") or args.key == 27 then
			
			self:Confirmado(false)		

		end
		
	end	
	
	if self.confirmandoSpawnarCarreira then
		
		if self.timer:GetSeconds() < 0.4 then return end
		
		if args.key == string.byte("S") or args.key == 13 then
			
			self:ConfirmadoSpawnarCarreira(true)			
			
		end
			
		if args.key == string.byte("N") or args.key == 27 then
			
			self:ConfirmadoSpawnarCarreira(false)		

		end
		
	end
	
end


function MudancaEmprego:PostRender() 

	if self.confirmando and Game:GetState() == GUIState.Game then
	
		Render:FillArea(Vector2(0, Render.Height / 2 - 165), Vector2(Render.Width, 185), Color(0,0,0,175))
		Render:DrawText(Vector2(Render.Width / 2 - Render:GetTextWidth("ATENCAO", 40) / 2, Render.Height / 2 - 150), "ATENCAO", Color(255, 255, 255), 40)
		Render:FillArea(Vector2(50, Render.Height / 2 - 110), Vector2(Render.Width - 100, 4), Color(255,255,255,200))
		Render:FillArea(Vector2(50, Render.Height / 2 - 15), Vector2(Render.Width - 100, 4), Color(255,255,255,200))
		local text = "Voce esta prestes a entrar na carreira de ".. self.confirmandoCarreira.nome .."! Tem certeza dessa decisao?"
		Render:DrawText(Vector2(Render.Width / 2 - Render:GetTextWidth(text, 20) / 2, Render.Height / 2 - 82.5), text, Color(255, 255, 255), 20)
			
		local textS = "S   -   Sim"
		Render:FillCircle(Vector2(Render.Width / 2.5 - Render:GetTextWidth(textS, 20) / 2 + 6, Render.Height / 2 - 45 + 7), 16, Color(100,100,100,100))
		Render:DrawText(Vector2(Render.Width / 2.5 - Render:GetTextWidth(textS, 20) / 2, Render.Height / 2 - 45), textS, Color(255, 255, 255), 20)
						
		local textN = "N   -   Nao"
		Render:FillCircle(Vector2(Render.Width - Render.Width / 2.5 - Render:GetTextWidth(textN, 20) / 2 + 6, Render.Height / 2 - 45 + 7), 16, Color(100,100,100,100))		
		Render:DrawText(Vector2(Render.Width - Render.Width / 2.5 - Render:GetTextWidth(textN, 20) / 2, Render.Height / 2 - 45), textN, Color(255, 255, 255), 20)
			
	end
	
	if self.confirmandoSpawnarCarreira and Game:GetState() == GUIState.Game then
	
		Render:FillArea(Vector2(0, Render.Height / 2 - 165), Vector2(Render.Width, 185), Color(0,0,0,175))
		Render:DrawText(Vector2(Render.Width / 2 - Render:GetTextWidth("ATENCAO", 40) / 2, Render.Height / 2 - 150), "ATENCAO", Color(255, 255, 255), 40)
		Render:FillArea(Vector2(50, Render.Height / 2 - 110), Vector2(Render.Width - 100, 4), Color(255,255,255,200))
		Render:FillArea(Vector2(50, Render.Height / 2 - 15), Vector2(Render.Width - 100, 4), Color(255,255,255,200))
		local text = "Deseja ir para a Central da Carreira ".. self.confirmandoCarreira.nome .."?"
		Render:DrawText(Vector2(Render.Width / 2 - Render:GetTextWidth(text, 20) / 2, Render.Height / 2 - 82.5), text, Color(255, 255, 255), 20)
			
		local textS = "S   -   Sim"
		Render:FillCircle(Vector2(Render.Width / 2.5 - Render:GetTextWidth(textS, 20) / 2 + 6, Render.Height / 2 - 45 + 7), 16, Color(100,100,100,100))
		Render:DrawText(Vector2(Render.Width / 2.5 - Render:GetTextWidth(textS, 20) / 2, Render.Height / 2 - 45), textS, Color(255, 255, 255), 20)
						
		local textN = "N   -   Nao"
		Render:FillCircle(Vector2(Render.Width - Render.Width / 2.5 - Render:GetTextWidth(textN, 20) / 2 + 6, Render.Height / 2 - 45 + 7), 16, Color(100,100,100,100))		
		Render:DrawText(Vector2(Render.Width - Render.Width / 2.5 - Render:GetTextWidth(textN, 20) / 2, Render.Height / 2 - 45), textN, Color(255, 255, 255), 20)
			
	end

end


function MudancaEmprego:LocalPlayerInput( args )

	if self.active then
		return false
	end
	
	if self.confirmando then
		return false
	end
	
end


MudancaEmprego = MudancaEmprego()