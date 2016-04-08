class 'GPS'

function GPS:__init()
				
	self.active = false
	self.gps = nil
	
	Events:Subscribe("Render", self, self.Render)
	
	Network:Subscribe("AtualizarGPS", self, self.AtualizarGPS)
	Events:Subscribe("KeyUp", self, self.KeyUp)

end


function GPS:FecharMenuPlus()

	self:SetActive(false)

end


function GPS:Render()
	
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


function GPS:KeyUp(args)

	if args.key == string.byte("G") then
		
		self:SetActive(not self:GetActive())

	end

end


function GPS:GetActive()

	return self.active

end


function GPS:SetActive(args)

	self.active = args
	
	if self.menu then
	
		self.menu:SetActive(args)
	end
end


function GPS:AtualizarGPS(args)

	self.gps = args
	local argsMenu = {
		posicao = Vector2(Render.Width / 2 - 125, 150),
		corFundo = Color(255, 165, 0),
		corTitulo = Color(255, 255, 255),
		titulo = "GPS",
		argsLista = {subTitulo = "LOCAIS"}
	}
	
	self.menu = MenuPlus(argsMenu)

	local lista = self.menu.lista

	lista:SubscribeItemSelecionado(
		function(item)
			
			if (item.valor and #item.valor > 0) then
			
				local posicaoMaisPerto = self:PosicaoMaisPerto(LocalPlayer:GetPosition(), item.valor)

				Waypoint:SetPosition(posicaoMaisPerto)
				Chat:Print("Seu GPS foi definido para ".. tostring(item.texto) .."!", Color(255,255,200))
				self:SetActive(false)
				
			else
				Chat:Print("Nao foi encontrado nenhum(a) ".. tostring(item.texto).."!", Color(255,0,0))
				return
			end
			
		end
	)

	for i, item in ipairs(self.gps) do
	
		local itemPlus = ItemPlus({
			texto = item.descricao,
			descricao = item.descricao .. " mais proximo(a)",
			valor = item.posicoes
		})
		
		if item.itens then
			
			local todasPosicoes = {}
			
			local lista2 = ListaPlus({subTitulo = string.upper(item.descricao)})
			lista2:SubscribeItemSelecionado(lista.funcaoItemSelecionado)
			lista2:AddItem(ItemPlus({
					texto = item.descricao,
					descricao = item.descricao .. " mais proximo(a)",
					valor = todasPosicoes
			}))
			
			for i, item2 in ipairs(item.itens) do

				lista2:AddItem(ItemPlus({
						texto = item2.descricao,
						descricao = item2.descricao .. " mais proximo(a)",
						valor = item2.posicoes
				}))
				
				for _, p in ipairs(item2.posicoes) do
					table.insert(todasPosicoes, p)
				end
			end
			itemPlus.descricao = "Mais opcoes..."
			itemPlus:SetLista(lista2)
		end
		
		lista:AddItem(itemPlus)

	end

	
end


function GPS:PosicaoMaisPerto(pos, posicoes)

	local posicaoMaisPerto = nil
	
	for i, posString in ipairs(posicoes) do
		posString = posString.posicao
	
		local vec = self:StringToVector3(posString)
		
		if (not posicaoMaisPerto) then
		
			posicaoMaisPerto = {posicao = vec, distancia = Vector3.Distance(pos, vec)}
		end
			
		local posicaoPerto = vec
		local distancia = Vector3.Distance(pos, vec)
		
		if (distancia < posicaoMaisPerto.distancia) then
		
			posicaoMaisPerto = {posicao = posicaoPerto, distancia = distancia}
		end
		
	end
	
	return posicaoMaisPerto.posicao

end


function GPS:StringToVector3(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end

end

gps = GPS()