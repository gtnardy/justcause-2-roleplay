class 'Prefeitura'


function Prefeitura:__init()

	self.naPrefeitura = false
	self.menu = nil	
	self.active = false
	self:AtualizarMenu()
	
	self.labelTexto = TextBox.Create()
	self.labelTexto:SetTextSize(self.labelTexto:GetTextSize() * 2)
	self.labelTexto:SetSize(self.labelTexto:GetSize() * 2)
	self.labelTexto:SetPosition(Render.Size / 2 - self.labelTexto:GetSize() / 2)
	self.labelTexto:Subscribe("ReturnPressed", self, self.LabelConfirma)
	self.labelTexto:Subscribe("EscPressed", self, self.SairLabel)
	self.labelTextoActive = false
	self.labelTexto:SetVisible(self.labelTextoActive)

	Network:Subscribe("EntrouPrefeitura", self, self.EntrouPrefeitura)
	Network:Subscribe("AtualizarDadosPrefeitura", self, self.AtualizarDadosPrefeitura)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("FecharMenuPlus", self, self.FecharMenuPlus)
	Events:Subscribe("ItemSelecionado", self, self.ItemSelecionado)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
end

function Prefeitura:SairLabel()

	if not self.labelTextoActive then return end
	self.labelTextoActive = false
	self.labelTexto:SetVisible(self.labelTextoActive)
	
end


function Prefeitura:LabelConfirma()

	if not self.labelTextoActive then return end
	
	if string.len(self.labelTexto:GetText()) > 50 then
		Chat:Print("O texto nao pode passar de 50 caracteres!", Color(255,0,0))
		return
	end	
	
	if string.len(self.labelTexto:GetText()) < 3 then
		Chat:Print("O texto precisa ter no minimo 3 caracteres!", Color(255,0,0))
		return
	end

	if LocalPlayer:GetMoney() < 3000 then
		Chat:Print("Voce precisa de R$ 3000 para se candidatar!", Color(255,0,0))
		return
	end
	
	Network:Send("Candidatar", {LocalPlayer, self.labelTexto:GetText()})
	
	self:SairLabel()
	
end


function Prefeitura:AtivarLabel()
	
	self.labelTextoActive = true
	self.labelTexto:Focus() 
	self.labelTexto:SetVisible(self.labelTextoActive)	
	self.labelTexto:SetPosition(Render.Size / 2 - self.labelTexto:GetSize() / 2)
	
end


function Prefeitura:LocalPlayerInput()

	if self.active then
		return false
	end
	
	if self.labelTextoActive then

		return false
	
	end
end


function Prefeitura:FecharMenuPlus()

	self:SetActive(false)

end


function Prefeitura:KeyUp(args)

	if args.key == string.byte("J") then
	
		if self.naPrefeitura then
			self:SetActive(not self:GetActive())
		else
			if self.active then
				self:SetActive(false)
			end
		end

	end

end


function Prefeitura:EntrouPrefeitura()

	self.naPrefeitura = LocalPlayer:GetPosition()
	
end


function Prefeitura:AtualizarDadosPrefeitura(args)

	local lista = self.menu:GetLista()
	
	local item = lista:GetItemById(1)
	local listaEmpregos = item:GetLista()
	
	
	if (listaEmpregos) then
	
		listaEmpregos.itens = {}
		
		for _, c in pairs(args.carreiras) do
			
			local itemEmprego = ItemPlus({texto = c.nome, descricao = c.descricao, valor = tonumber(c.idCarreira)})

			if LocalPlayer:GetValue("nivel") then
			
				if tonumber(c.nivelMinimo) > LocalPlayer:GetValue("nivel") then
					
					itemEmprego:SetActive(false)
				end
			end
			
			listaEmpregos:AddItem(itemEmprego)
		end
		
	end

	
	-- if (args.candidatos) then
		-- local item = lista:GetItemById(3)
		-- local listaCandidatos = item:GetLista()
		
		
		-- if listaCandidatos then
			-- listaCandidatos.itens = {}
			
			-- for _, r in pairs(args.candidatos) do
				-- local itemCandidato = listaCandidatos:AddItem(_, r.Nome)
				-- itemCandidato:SetDescricao("ENTER PARA VOTAR\n\n"..r.Partido)
				-- itemCandidato:SetValor({3, tonumber(r.idCandidatos)})
			-- end
			
		-- end
	-- end
	
	
end


function Prefeitura:AtualizarMenu()

	local argsMenu = {
		posicao = Vector2(Render.Width / 2 - 225, 150),
		corFundo = Color(27, 188, 155),
		corTitulo = Color(255, 255, 255),
		titulo = "Prefeitura",
		argsLista = {subTitulo = "MENU"}
	}
	
	self.menu = MenuPlus(argsMenu)

	local lista = self.menu.lista

	local item = ItemPlus({texto = "Empregos", descricao = "Todos os empregos disponiveis"})
	
	lista:AddItem(item)
	
	local listaEmpregos = ListaPlus({subTitulo = "EMPREGOS"})
	item:SetLista(listaEmpregos)
	listaEmpregos:SubscribeItemSelecionado(
		function(item)
		
			Network:Send("MudarCarreira", {idCarreira = item.valor})
			
		end
	)

	-- local item = lista:AddItem(2, "Pagar Impostos")
	-- if LocalPlayer:GetValue("Lingua") == 0 then
		-- item:SetDescricao("Pagar todos os impostos pendentes.")
	-- else
		-- item:SetDescricao("Pay all outstanding taxes.")
	-- end
	-- item:SetValor({2})
	
	-- local item = lista:AddItem(3, "Candidatos")
	-- if LocalPlayer:GetValue("Lingua") == 0 then
		-- item:SetDescricao("Listar todos candidatos a Prefeito de Panau.")
	-- else
		-- item:SetDescricao("List all candidates for Mayor of Panau.")
	-- end
	-- item:SetValor({3})
	-- local listaCandidados = ListaPlus(lista)
	-- item:SetLista(listaCandidados)

	-- local item = lista:AddItem(4, "Candidatar")
	-- if LocalPlayer:GetValue("Lingua") == 0 then
		-- item:SetDescricao("Candidate seu partido para Prefeito de Panau!")
	-- else
		-- item:SetDescricao("Candidate seu partido para Prefeito de Panau!")
	-- end
	-- item:SetValor({4})	
	
	
	
end


function Prefeitura:SetActive(args)
	
	self.active = args	
	
	if self.active then
		
		Network:Send("AtualizarDadosPrefeitura")
	
	end
	
	if self.menu then
	
		self.menu:SetActive(args)
	end
	
end


function Prefeitura:ItemSelecionado(args)

	if self.active then
	
		if args[1][1] == 1 then
		
			Network:Send("MudarCarreira", {idCarreira = args[1][2]})
			return
		end				
		
		if args[1][1] == 2 then
		
			--Network:Send("PagarImpostos")
			Chat:Print("Essa funcao esta indisponivel no momento!", Color(255,00,0))
			return
		end		
		
		if args[1][1] == 3 then
			
			--Network:Send("Votar", {LocalPlayer, args[1][2]})
			Chat:Print("Essa funcao esta indisponivel no momento!", Color(255,00,0))
			return
		end	

		if args[1][1] == 4 then
		
			-- self:SetActive(false)
			-- self:AtivarLabel()
			Chat:Print("Essa funcao esta indisponivel no momento!", Color(255,00,0))
			return
		end

	end

end


function Prefeitura:GetActive()

	return self.active

end


function Prefeitura:Render()

	Mouse:SetVisible(self.labelTextoActive)	
	if self.labelTextoActive then

		Render:FillArea(self.labelTexto:GetPosition() - Vector2(25, 30), self.labelTexto:GetSize() + Vector2(50,60), Color(0,0,0,100))
		Render:DrawText(self.labelTexto:GetPosition() - Vector2(0, 20), "Digite a descricao do partido:", Color(255,255,255))
	
	end
	
	if self.naPrefeitura then
	
		if Vector3.Distance(LocalPlayer:GetPosition(), self.naPrefeitura) > 10 then
		
			self:SetActive(false)
			self.naPrefeitura = false
			
		end
	
	end
	
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
	
end


pref = Prefeitura()