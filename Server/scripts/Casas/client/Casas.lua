class 'Casas'

function Casas:__init()

	self.active = false
	self.menu = nil
	self:CriarMenu()
	self.casas = {}
	
	self.casaAtual = nil
	self.casaPropria = nil
	
	self.imagemCasaLiberada = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAAGQAAABaCAYAAABOkvOJAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAIYSURBVHja7N3RbcIwEMbxzyfm6VMzRViGCWgn6DJkCnjqQtcXaCOaFkjc5mz/P8kSEsgk+SUXUKRzcneRODEOQaxsJCmlVPI+9JK68+ujpKGkjf9WoQovWb0kvxp9aSDjkdx90RWyFmhKqZd0kKSn006S9P78dnl76+5DiWdYkfeQKYyr14fzZwBZC6MWlKJK1i2MceaUr/P83YObdcxZHosBeQRjDsp4/hnJds/a1FCmfsrTaXdBOaSUbh207tH5R+hdrp/bVitGqfcUqxmjRBSrHaM0FGsBoyQUawWjFBRrCaMEFGsNIzqKtYgxhQLIyhgTKPvmQdbGmEBpFyQKRjQUAyMWioHR8P8QMAKBgBEIBIxAIGAEAgEjEAgYgUDACAQCRiAQMAKBgBEIBAztcz3kMjCWJfeTx6UglKnMKAZGLBQDIxaKgRELxcCIhWJgxEIxMGKhGBixUAyMWCgGRiwUAyMWioERC8XAiIViYMRCMTBioVxAOjBWR+mkr9YaS9pK3PNlVWXUsiNntu4+XFprDJK2erzxym/ZV35yv2ac67OBzbjXyaAZ/Tqmms+klF5aKDfunn0/aYIZLIAAQgABhAACCAEEEAIIIAQQAgggBBBACCCAEEAAIYAQQAAhgABCAAGEAAIIAYQAAggBpPD80fLbvSSvfPS5jv94LF5P/QZKV+l5fFSm5bqvL4j0XwvUk/vyMQCCH3mKtJojzgAAAABJRU5ErkJggg==")
	self.imagemCasaLiberada:SetSize(self.imagemCasaLiberada:GetSize() / 2)
	self.imagemCasaPropria = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAAGQAAABaCAYAAABOkvOJAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAIxSURBVHja7N1BbuowEMbx8ai3YZ112Yd7lFvQ3oKDkD17to/zTBcllZumjwe4LzP2/5MsIRGZJL94DIpikpkJ8RPlFPjKk4hISinyMfQi0l1en0RkiLTz3ypU8JLVi4hNWh8NJG/JzD5HyGp/DHMg5+26F5FDvt/n7Xp8e7PaH8OMlD8vz7HnkDmMyevDZRsm9aUwakEJVbKuYUy2vbl8Xfrvbtyt06PlMS9ZYUBuwbgHJe//jjw0Z+UgTzWUqZ+y2h9HlMN5u7520rp7LspL/12pr9taK0bUOUVrxoiIorVjREPRFjAioWgrGFFQtCWMCCjaGoZ3FG0RYw4FkIUxZlB2zYMsjTGD0i6IFwxvKAqGLxQFo+HfIWA4AgHDEQgYjkDAcAQChiMQMByBgOEIBAxHIGA4AgHDEQgYsit1k0vBeCyl7zwqGL5QFAxfKAqGLxQFwxeKguELRcHwhaJg+EJRMHyhKBi+UBQMXygKhi8UBcMXypfHouVjnRAw/kPyR7bNbJgbIWAsNFJSSv0UBAwnKCNIB8biKF0+hzyyrMS/fFit9b9kNmY2jEtrDCKykdsXXvlbdpVf3G8F+zqNE3u+1slQatGv83b92ki5KXKc4RcwqzmAAEIAAYQAAggBBBACCCAEEAIIIAQQQAgggBBAACGAEEAAIYAAQgABhAACCAGEAAIIASR4zOw3uu1FxCpvfanzn7fpwgGlUbpKr+OTFPq77umASL80QsideR8ANmzjsZDNWkYAAAAASUVORK5CYII=")
	self.imagemCasaPropria:SetSize(self.imagemCasaLiberada:GetSize() / 2)
	self.imagemCasaBloqueada = Image.Create(AssetLocation.Base64, "iVBORw0KGgoAAAANSUhEUgAAAGQAAABaCAYAAABOkvOJAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAIySURBVHja7N29boMwFIbh46PcTWaGTGUn95T2nsKeqQys5XrcBVREaWjACcf2+0mWUIQc4PEPEcJx3nshdqJcAls5iIg452I+h0pEin67FZE6poP/NUJFPmRVIuInpYoNZFwOWyu8nY67nEjZdJWIXMfHUDad9J+db6djHWMLi3IOmcOYbF/7fQDZCyMVFOe93zSpv3LIWsKY7Dts/nv46usvHjysdsvw+Pb5FSfIIxhrUMb1r8jqOWsKcoihG6/BGPYdJvqy6ZYuWrGmgfX1F6FutzVVjFjnFE0ZI0YUTR0jNhTNASMmFM0FIxYUzQkjBhTNDcM6iuaIMYcCyM4YMyiX7EH2xphByRfECoY1FAXDFoqCkfHvEDAMgYBhCAQMQyBgGAIBwxAIGIZAwDAEAoYhEDAMgYBhCAQMuYR6yKVgbEvoJ49bQRimAqMoGLZQFAxbKAqGLRQFwxaKgmELRcGwhaJg2EJRMGyhKBi2UBQMWyhzb+GC8eSM3w723tf3eggYL+4pzrnqLxAwDKAoGLZQBpACjN1RCpGflRzayWQT+stSnZRDph2D1CJylscXXrmXS+KN+yMkxnC3NV7rpJYV63XM9YKy6d4zGW42n+d08RkWwTQWQAAhgABCAAGEAAIIAQQQAggBBBACCCAEEEAIIIAQQAgggBBAACGAAEIAAYQAQgABhAASebz3z6i2EhGfeKlCXf9x2fx/6gsoRaLtuJVAf9c97RDuST2ErMz3AJhqvyi8qbUwAAAAAElFTkSuQmCC")
	self.imagemCasaBloqueada:SetSize(self.imagemCasaLiberada:GetSize() / 2)
	self.imagemCasaTamanho = self.imagemCasaLiberada:GetSize()
	
	Network:Subscribe("AtualizarCasa", self, self.AtualizarCasa)
	Network:Subscribe("AtualizarDados", self, self.AtualizarDados)
	
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	
	Events:Subscribe("AtualizarSpots", self, self.AtualizarSpots)

end


function Casas:LocalPlayerInput(args)

	if self.active then return false end

end


function Casas:CriarMenu()

	local argsMenu = {
		posicao = Vector2(Render.Width / 2, 200),
		corFundo = Color(25, 181, 254),
		corTitulo = Color(255, 255, 255),
		titulo = "Casa",
		argsLista = {subTitulo = "MENU"}
	}
	
	self.menu = MenuPlus(argsMenu)

end


function Casas:AtualizarMenu(casa)

	self.menu:Limpar()
	
	local lista = self.menu.lista
	lista.funcaoItemSelecionado = nil
	lista.funcaoItemAlterado = nil
	
	if (self.casaPropria and self.casaPropria.idCasa == casa.idCasa) then
		
		local meuNivelMorador = tonumber(self.casaPropria.nivelMorador)
		
		local listaMoradores = ListaPlus({subTitulo = "MORADORES"})

		local itemMoradores = ItemPlus({
			texto = "Moradores", 
			descricao = "Ver os moradores da casa.",
		})
		
		itemMoradores:SetLista(listaMoradores)
		
		if #casa.moradores > 0 then
			local itemListaMoradores = ItemPlus({
				texto = "Listar Moradores", 
				descricao = "Listar todos os moradores de sua casa.",
			})
			
			local listaListaMoradores = ListaPlus({subTitulo = "LISTAGEM DE MORADORES"})
			
			for _, morador in ipairs(casa.moradores) do
			
				local descricao = ""
				local moradorActive = false
				
				if meuNivelMorador == 1 then
					moradorActive = true
					descricao = "Mais opcoes..."
				end
				
				if morador.idPlayer == LocalPlayer:GetSteamId().id then
					moradorActive = false
				end
				
				local itemMorador = ItemPlus({
					texto = morador.nome,
					textoSecundario = "Nv. "..morador.nivelMorador,
					active = moradorActive,
					descricao = descricao,
					valor = {id = 1, morador.idPlayer}
				})
				
				if meuNivelMorador == 1 then
				
					local listaOpcoesMorador = ListaPlus({subTitulo = string.upper(morador.nome)})
					listaOpcoesMorador:SubscribeItemSelecionado(
						function(item)
						
							if (item.valor.id == 1) then
								Network:Send("ExpulsarMorador", {idCasa = casa.idCasa, idMorador = item.valor.idPlayer})
								listaOpcoesMorador:SetActive(false)
								itemMorador.texto = "EXPULSO"
								itemMorador.textoSecundario = ""
								itemMorador.active = false
							end	
							
							if (item.valor.id == 2) then
								Network:Send("SubirNivelMorador", {idCasa = casa.idCasa, idMorador = item.valor.idPlayer})
								if tonumber(morador.nivelMorador) > 2 then
									morador.nivelMorador = tonumber(morador.nivelMorador) - 1
									itemMorador.textoSecundario = "Nv. "..morador.nivelMorador
								end
							end
							
							if (item.valor.id == 3) then
								Network:Send("DescerNivelMorador", {idCasa = casa.idCasa, idMorador = item.valor.idPlayer})
								if tonumber(morador.nivelMorador) < 3 then
									morador.nivelMorador = tonumber(morador.nivelMorador) + 1
									itemMorador.textoSecundario = "Nv. "..morador.nivelMorador
								end								
							end			
							
						end
					)
					
					listaOpcoesMorador:AddItem(ItemPlus({
						texto = "Expulsar",
						descricao = "Expulsar o morador de sua casa!",
						valor = {id = 1, idPlayer = morador.idPlayer}
					}))
					
					listaOpcoesMorador:AddItem(ItemPlus({
						texto = "Subir um Nivel",
						descricao = "Subir o nivel de morador.",
						valor = {id = 2, idPlayer = morador.idPlayer}
					}))
								
					listaOpcoesMorador:AddItem(ItemPlus({
						texto = "Descer um Nivel",
						descricao = "Descer o nivel de morador.",
						valor = {id = 3, idPlayer = morador.idPlayer}
					}))							
					
					listaAluguel = ListaPlus({subTitulo = "ALUGUEL"})
		
					
					local itemAluguel = ItemPlus({
						texto = "Aluguel",
						textoSecundario = "R$ ".. morador.aluguel,
						descricao = "Alterar o valor do aluguel desse morador.",
					})

					
					listaAluguel:SubscribeItemSelecionado(
						function(item)
							Network:Send("AlterarAluguel", {valor = item.valor.valor, idMorador = item.valor.idPlayer})
							itemAluguel.textoSecundario = "R$ " .. item.valor.valor
						end
					)
					
					for i = 0, 10 do
						listaAluguel:AddItem(ItemPlus({
							texto = "R$ ".. i * 100,
							valor = {valor = i * 100, idPlayer = morador.idPlayer}
						}))	
					end
					itemAluguel:SetLista(listaAluguel)
					listaOpcoesMorador:AddItem(itemAluguel)
					
					itemMorador:SetLista(listaOpcoesMorador)
				end

				listaListaMoradores:AddItem(itemMorador)
				
			end
			itemListaMoradores:SetLista(listaListaMoradores)		
			listaMoradores:AddItem(itemListaMoradores)			
		end

		if meuNivelMorador == 1 then
			local itemAdicionarMorador = ItemPlus({
				texto = "Adicionar Morador", 
				descricao = "Convidar um jogador para ser morador de sua casa.",
			})
			
			local listaAdicionarMorador = ListaPlus({subTitulo = "JOGADORES PROXIMOS"})
			local possuiPessoaPerto = false
			for player in Client:GetStreamedPlayers() do
				possuiPessoaPerto = true
				listaAdicionarMorador:AddItem(ItemPlus({
					texto = player:GetName(),
					descricao = "Convidar "..player:GetName().. " para ser morador de sua casa...",
					valor = player
				}))
			end
			
			if not possuiPessoaPerto then
				listaAdicionarMorador:AddItem(ItemPlus({
					texto = "Ninguem",
					active = false,
					descricao = "O jogador que voce deseja convidar precisa estar perto de sua casa!",
				}))
			end
			
			listaAdicionarMorador:SubscribeItemSelecionado(
				function(item)
				
					Network:Send("ConvidarMorador", {morador = item.valor})
					listaAdicionarMorador:SetActive(false)
					
				end
			)
			
			itemAdicionarMorador:SetLista(listaAdicionarMorador)
			listaMoradores:AddItem(itemAdicionarMorador)
			
			itemSairCasa = ItemPlus({
				texto = "Vender", 
				descricao = "Vender a sua Casa",
			})
			local listaSairCasa = ListaPlus({subTitulo = "Vender"})
			local itemSairCasaConfirmacao = ItemPlus({
				texto = "Vender", 
				descricao = "Vender a sua Casa por R$ ".. math.floor(tostring(casa.valor) * 70 / 100),
				textoSecundario = "R$ ".. math.floor(tostring(casa.valor) * 70 / 100),
			})
			
			listaSairCasa:SubscribeItemSelecionado(
				function(item)
								
					Network:Send("VenderCasa")
					self:SetActive(false)	
				
				end
			)
		else
		
			itemSairCasa = ItemPlus({
				texto = "Sair", 
				descricao = "Deixar de ser morador da casa.",
			})
			local listaSairCasa = ListaPlus({subTitulo = "Sair"})
			local itemSairCasaConfirmacao = ItemPlus({
				texto = "Sair", 
				descricao = "Deixar de ser morador da casa.",
			})
			
			listaSairCasa:SubscribeItemSelecionado(
				function(item)
								
					Network:Send("SairCasa")
					self:SetActive(false)	
				
				end
			)			
		end
		itemSairCasa:SetLista(listaSairCasa)


		lista:AddItem(itemMoradores)
		
		local itemGaragem = ItemPlus({
			texto = "Garagem", 
			descricao = "Entrar na garagem.",
			valor = {id = 1}
		})
		
		lista:AddItem(itemGaragem)
	
		lista:SubscribeItemSelecionado(
			function(item)
			
				if item.valor.id == 1 then
					Network:Send("EntrarGaragem")
					self:SetActive(false)
				end
				
			end
		)

		lista:AddItem(itemSairCasa)
	else
		if (#casa.moradores > 0) then
		
			local listaMoradores = ListaPlus({subTitulo = "MORADORES"})
			local itemMoradores = ItemPlus({
				texto = "Moradores", 
				descricao = "Ver os moradores da casa.",
			})
			itemMoradores:SetLista(listaMoradores)
			
			for _, morador in ipairs(casa.moradores) do
			
				local textoSecundario = ""
				if morador.nivelMorador == 1 then
					textoSecundario = "DONO"
				end
				
				listaMoradores:AddItem(ItemPlus({
					texto = morador.nome,
					textoSecundario = textoSecundario,
					active = false,
				}))
			end
			lista:AddItem(itemMoradores)
		else

			local itemComprar = ItemPlus({
				texto = "Comprar", 
				textoSecundario = "R$ ".. casa.valor,
				descricao = "Comprar a casa por R$ " ..casa.valor.. ".",
			})
			
			lista:SubscribeItemSelecionado(
				function(item)
					Network:Send("ComprarCasa", {idCasa = casa.idCasa})
					self:SetActive(false)
				
				end
			)
			lista:AddItem(itemComprar)
		end

	end


end


function Casas:ModuleUnload()

	Events:Fire("DeleteSpot", {grupo = "Casa"})

end


function Casas:AtualizarSpots(args)

	for idCasa, casa in ipairs(self.casas) do
	
		--descricao, nome, posicao, idImagem, grupo, index,
		self:AddSpot(casa)

	end
end


function Casas:AtualizarCasa(args)

	self.casas[args.casa.idCasa] = args.casa
	
	self:AddSpot(args.casa)
	-- Events:Fire("AddSpot", {nome = nome, descricao = descricao, tipo = -3, posicao = args.casa.posicao, grupo = "Casa", index = args.casa.idCasa, idImagem = idImagem})
	self:AtualizarMenu(self.casaAtual)
end


function Casas:AddSpot(casa)

	local idImagem = 3
	local tipo = -3
	local nome = "Casa"
	if self.casaPropria and self.casaPropria.idCasa == casa.idCasa then
		nome = "Sua Casa"
		idImagem = 4
		tipo = -4
	else
		if #casa.moradores == 0 then
			nome = "Casa a Venda"
			idImagem = 2
		end
	end
	local descricao = ""

	Events:Fire("AddSpot", {nome = nome, tipo = tipo, descricao = descricao, posicao = casa.posicao, grupo = "Casa", index = casa.idCasa, idImagem = idImagem})

end


function Casas:AtualizarDados(args)
	
	if args.casaPropria != nil then
		self.casaPropria = args.casaPropria
		-- Events:Fire("DeleteSpot", {grupo = "Casa", index = args.casaPropria.idCasa})
		-- self:AddSpot(args.casaPropria)
	end
	
	if args.casas then
	
		self.casas = args.casas
		self:AtualizarSpots()
	end

	
end


function Casas:SetActive(args)

	if args then
		self:AtualizarMenu(self.casaAtual)
	end
	
	self.active = args
	if self.menu then
		self.menu:SetActive(args)
	end

end


function Casas:KeyUp(args)

	if args.key == string.byte("J") then
		if self.casaAtual then

			self:SetActive(not self.active)
		end
	
	end

end


function Casas:Render()

	local casaAtual = nil
	
	for _, casa in ipairs(self.casas) do
	
		local pos = casa.posicao + Vector3(0, 1, 0)
		local dist = pos:Distance(LocalPlayer:GetPosition())

		if dist <= 150 then
		
			local pos_2d, success = Render:WorldToScreen(pos)
			if success then 
			
				local escala = self:CalculateAlpha(dist, 10, 150)

				local alpha = escala--math.max(0, escala * 1 * (1.0 - (aim * 10)))
				
				local imagemDesenhar = self.imagemCasaLiberada
				if self.casaPropria and self.casaPropria.idCasa == casa.idCasa then
					imagemDesenhar = self.imagemCasaPropria
				else
					if #casa.moradores > 0 then
						imagemDesenhar = self.imagemCasaBloqueada
					end
				end
				imagemDesenhar:SetSize(self.imagemCasaTamanho * escala)
				imagemDesenhar:SetPosition(pos_2d - imagemDesenhar:GetSize() / 2)
				imagemDesenhar:SetAlpha(alpha)
				imagemDesenhar:Draw()
				
				if dist <= 25 then
					local texto = "Casa ID "..casa.idCasa.. " - A venda - R$ "..casa.valor
					if #casa.moradores > 0 then
						texto = "Casa ID "..casa.idCasa.. " - Dono: "..tostring(casa.moradores[1].nome)
					end
					local size = 18
					Render:DrawText(pos_2d - Vector2(Render:GetTextWidth(texto, size, escala) / 2, 40 * escala), texto, Color(255, 255, 255), size, escala)
				end
			end
			
			if dist < 5 then
				casaAtual = casa
			end

		end
	end
	
	self.casaAtual = casaAtual
	
	if self.active then
		if self.menu and not self.menu:GetActive() then
			self:SetActive(false)
		end
	end
	
	
end


function Casas:CalculateAlpha( dist, bias, max )

    local alpha = 1

    if dist > bias then
        alpha =  1.0 - ( dist - bias ) /
                       ( max  - bias )
    end

    return alpha
end

casas = Casas()