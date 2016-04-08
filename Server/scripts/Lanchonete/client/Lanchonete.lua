class 'Lanchonete'

function Lanchonete:__init()

	self.active = false
	self.menu = nil
	self.naLanchonete = nil
	self:CriarMenu()
	self.alimentos = {}
	
	self.alimentosLanchonete = {}
	self.alimentosLanchonete[14] = {1, 2}
	
	Network:Subscribe("AtualizarLanchonete", self, self.AtualizarLanchonete)
	Network:Subscribe("EnterCheckpoint", self, self.EnterCheckpoint)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	
end


function Lanchonete:LocalPlayerInput(args)

	if (self.active) then return false end
end


function Lanchonete:KeyUp(args)

	if args.key == string.byte("J") then
		if self.naLanchonete then
			self:AtualizarMenu(self.naLanchonete)
			self:SetActive(not self.active)
		elseif (self.active) then
			self:SetActive(false)
		end
	end

end


function Lanchonete:EnterCheckpoint(args)

	if (args) then
		self.naLanchonete = args.idLocal
		
	else
		self.naLanchonete = false
		self:SetActive(false)
	end
	
end


function Lanchonete:AtualizarMenu(idLocal)

	self.menu:Limpar()
	local lista = self.menu.lista

	local alimentos = self.alimentosLanchonete[idLocal]
	if (alimentos) then
		for i, idAlimento in ipairs(alimentos) do
			
			local alimento = self.alimentos[idAlimento]
			
			local descricao = "Comprar "..alimento.nome .. " por R$ ".. alimento.preco..". \n"
			
			if (alimento.sede > 0) then
				descricao = descricao .. "Diminui a Sede"
			else
				if (alimento.sede < 0) then
					descricao = descricao .. "Aumenta a Sede"
				end
			end		
			
			if (alimento.fome > 0) then
				descricao = descricao .. " e diminui a Fome"
			else
				if (alimento.sede < 0) then
					descricao = descricao .. " e aumenta a Fome"
				end
			end
			
			descricao = descricao .. "."
			
			local item = ItemPlus({
				texto = alimento.nome,
				textoSecundario = "R$ "..alimento.preco,
				descricao = descricao,
				valor = {
					idAlimento = idAlimento,
					preco = alimento.preco,
					nome = alimento.nome
				}
			})

			lista:AddItem(item)
		
			lista:SubscribeItemSelecionado(
				function(item)
					
					if (LocalPlayer:GetMoney() < item.valor.preco) then
						Chat:Print("Voce nao possui dinheiro suficiente para comprar um "..item.valor.nome.."!", Color(255,0,0))
						return
					end
					
					Network:Send("ComprarAlimento", {alimento = item.valor})
					
				end
			)
			
		end
	end
end


function Lanchonete:CriarMenu()

	local argsMenu = {
		posicao = Render.Size / 2 - Vector2(300, 250),
		corFundo = Color(37, 116, 169),
		corTitulo = Color(255, 255, 255),
		titulo = "Lanchonete",
		argsLista = {subTitulo = "ITENS", exibirSubTituloSecundario = true}
	}

	
	self.menu = MenuPlus(argsMenu)
end


function Lanchonete:Render()

	if (self.active) then
		if (self.menu and not self.menu:GetActive()) then
			self:SetActive(false)
		end
	end

end


function Lanchonete:SetActive(args)

	self.active = args
	if (self.menu) then
		self.menu:SetActive(args)
	end
	
end


function Lanchonete:GetAlimento(id)

	return self.alimentos[id]
	
end


function Lanchonete:AtualizarLanchonete(args)

	self.alimentos = args.alimentos
	
end


lanchonete = Lanchonete()