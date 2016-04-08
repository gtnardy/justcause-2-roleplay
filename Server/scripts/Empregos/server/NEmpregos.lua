class 'Emprego'

function Emprego:__init()

	
	self.carreiras = {}
	self.arrayMercadorias = {}
	-- self.arrayCategoriaVeiculos = {}
	-- self.categoriasVeiculos = CategoriaVeiculos()
	
	self.timer = Timer()
	-- Events:Subscribe("EntregaReturnCasaVeiculo", self, self.EntregaReturnCasaVeiculo)
	
	Events:Subscribe("MudouCarreira", self, self.MudouCarreira)
	Events:Subscribe("ModulesLoad", self, self.ModulesLoad)
	Events:Subscribe("AtualizarEntregas", self, self.AtualizarEntregasPlayer)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)

	Events:Subscribe("PostTick", self, self.PostTick)
	
	Network:Subscribe("QueroCarregar", self, self.QueroCarregar)
	Network:Subscribe("Descarregar", self, self.Descarregar)
	Network:Subscribe("Comecei", self, self.Comecei)
	Network:Subscribe("FalhouEntrega", self, self.FalhouEntrega)

	
end


function Emprego:Comecei(args)

	args:EnableCollision(CollisionGroup.Vehicle)
	if args:GetVehicle() then
		args:GetVehicle():SetInvulnerable(false)
		
	end
	
end


function Emprego:AtualizarEntregasPlayer(args)

	self:AtualizarPlayer(args.player)
	
end


function Emprego:MudouCarreira(args)

	self:AtualizarPlayer(args.player)
	
end


function Emprego:FalhouEntrega(args)

	local vei = Vehicle.GetById(args.veiculo)
	if IsValid(vei) then
		vei:Remove()
	end
	self:LimparCarregado(args.player)

end


function Emprego:PostTick()

	if self.timer:GetMinutes() >= 5 then
		
		local atualizouUm = false
		for iC, c in pairs(self.carreiras) do
			
			if #c.entregas > 0 then
				for iE, e in pairs(c.entregas) do
					
					e.tempo = e.tempo - 5
					if e.tempo <= 0 then
						atualizouUm = true
						self:TempoEsgotadoEntrega(e)

					end
				
				end
			else
				c.entregas = self:GetEntregasDB(iC)
				atualizouUm = true
			end
			
		end
		if atualizouUm then
			self:AtualizarPlayers()
		end
		self.timer:Restart()
	end
	
end


function Emprego:TempoEsgotadoEntrega(entrega)

	local mercadorias = self:GetMercadoriasRandomicasEntrega(entrega.id)
	
	entrega.mercadorias = {}
	for m = 1, #mercadorias do
				
		entrega.mercadorias[tonumber(mercadorias[m].idMercadoria)] = true
				
	end
	
	entrega.tempo = self:GetTempoRandomico()
	
	
end


function Emprego:EntregaReturnCasaVeiculo(args)

	if not args.retorno then
		Chat:Send(args.player, "Voce nao pode carregar um veiculo que nao te pertence!", Color(255,0,0))
		return
	end
	
	-- Network:Send(args.player, "PodeCarregar")
	
	args.noVeiculo = true
	self:Carregar(args)
	
end


function Emprego:LimparCarregado(ply)

	ply:SetNetworkValue("Carregado", nil)

end


function Emprego:Descarregar(args)

	local pagamento = args.pagamento
	
	local veiculo = Vehicle.GetById(args.veiculo)
	if not IsValid(veiculo) then
		veiculo = args.player:GetVehicle()
	end
	
	local veiculoId = veiculo:GetModelId()
	if not args.veiculoProprio then
	
		-- desconto veiculo empresa
		pagamento = pagamento * 3 / 4
		Chat:Send(args.player, "Voce foi descontado em 25% pelo aluguel do veiculo da empresa!", Color(255,0,0))
		if IsValid(Vehicle.GetById(args.veiculo)) then
			Vehicle.GetById(args.veiculo):Remove()
		end
		
	end
	
	args.player:SetMoney(args.player:GetMoney() + pagamento)
	local categoria = self:GetCategoriaVeiculo(veiculoId)
	
	self:LimparCarregado(args.player)
	Events:Fire("AdicionarExperienciaEmprego", {player = args.player, experiencia = self:GetExperiencia(args.player, args.distancia, categoria, args.veiculoProprio, args.percentual), idCategoria = categoria})

end


function Emprego:GetExperiencia(ply, distancia, categoria, naoDescontar, percentual)

	-- local levelCarreia = self:GetNivelExpCarreira(ply, self:GetCarreira(ply))[1]
	
	local query = SQL:Query("SELECT razaoPagamento FROM Categoria WHERE idCategoria = ?")
	query:Bind(1, categoria)
	local razaoPagamento = tonumber(query:Execute()[1].razaoPagamento)
	-- local metrosPorMinuto = self.categoriasVeiculos:GetMetrosPorMinuto(categoria)
	local metrosPorMinuto = razaoPagamento / 6 * 10000

	local retorno = math.floor(distancia / metrosPorMinuto * 100 * percentual)
	
	if not naoDescontar then
		retorno = retorno * 3 / 4
	end
	
	return retorno

end


function Emprego:QueroCarregar(args)

	-- player, entrega, veiculo, mercadoria
	-- if args.veiculo then
		-- Events:Fire("EntregaGetCasaVeiculo", args)
		-- return
	-- end
	
	self:Carregar(args)

end


function Emprego:Carregar(args)
	-- player, entrega, veiculo, mercadoria, categoria
	
	local carreiraObj = self:GetCarreiraObjeto(self:GetCarreira(args.player))
	local entrega = self:GetEntrega(args.entrega, carreiraObj)
	
	local veiculo = nil
	
	local veiculosLiberadosCategoria = self:GetVeiculosUsuarioCategoriaMercadoria(args.player, args.categoria, args.mercadoria.idMercadoria)
	if #veiculosLiberadosCategoria == 0 then
		Chat:Send(args.player, "Ops! Voce nao liberou nenhum veiculo que pode fazer entregas dessa mercadoria!", Color(255,1,1))
		return
	end
	
	if args.noVeiculo and args.player:InVehicle() then
		
		veiculo = args.player:GetVehicle()
		
		local podeVeiculo = false
		for _, v in pairs(veiculosLiberadosCategoria) do
		
			if tonumber(v.idVeiculo) == veiculo:GetModelId() then
				podeVeiculo = true
			end
		
		end
		
		if not podeVeiculo then
			Chat:Send(args.player, "Voce nao pode transportar essa mercadoria com esse veiculo! Os unicos veiculos que podem transporta-la sao:", Color(255,1,1))
			for _, v in pairs(veiculosLiberadosCategoria) do
				
				Chat:Send(args.player, tostring(Vehicle.GetById(tonumber(v.idVeiculo))), Color(255,0,0))
				
			end			
			return
		end
	else
	

		local idVeiculo = tonumber(veiculosLiberadosCategoria[math.random(1, #veiculosLiberadosCategoria)].idVeiculo)
		args.player:DisableCollision(CollisionGroup.Vehicle)
		veiculo = self:SpawnarVeiculo({model_id = idVeiculo, posicao = entrega.descargas[1], angulo = entrega.angulo})
		args.player:EnterVehicle(veiculo, VehicleSeat.Driver)
	end
	args.player:SetNetworkValue("Carregado", veiculo:GetId())
	Network:Send(args.player, "Carregado", {veiculo = veiculo:GetId(), modelId = veiculo:GetModelId(), mercadoria = args.mercadoria, veiculoProprio = args.noVeiculo})

end


function Emprego:GetEntrega(idE, carreira)

	for _, e in pairs(carreira.entregas) do
		

		if e.id == idE then
			return e
		end
	
	end
	return nil
	
end


function Emprego:GetVeiculosUsuarioCategoriaMercadoria(ply, cat, mercadoria)
	
	-- local query = SQL:Query("SELECT cv.idVeiculo FROM jcCategoriaVeiculo cv INNER JOIN jcCategoriaUnlock cu ON cu.idCategoria = cv.idCategoria AND cu.valor = cv.idVeiculo AND tipo = 1 INNER JOIN jcCategoriaUsuario cUsu ON cUsu.idCategoriaUsuario = cv.idCategoria WHERE cu.nivelMin <= cUsu.nivel AND idUsuario = ? AND cUsu.idCategoria = ?")
	local query = SQL:Query("SELECT valor AS 'idVeiculo' FROM CategoriaDesbloqueio cd INNER JOIN PlayerCategoria pCat ON pCat.idCategoria = cd.idCategoria WHERE cd.idCategoria = ? AND nivelMinimo <= nivel AND idPlayer = ?")
	query:Bind(1, cat)
	query:Bind(2, ply:GetSteamId().id)
	
	local result = query:Execute()	
	
	-- local retorno = {}
	
	-- local query = SQL:Query("SELECT idVeiculo FROM jcMercadoriaVeiculoExcecao WHERE idMercadoria = ?")
	-- query:Bind(1, mercadoria)
	-- local veiculosExcecao = query:Execute()
	
	-- for _, r in pairs(result) do
	
		-- local veiculoAtual = tonumber(r.idVeiculo)
		-- for _, ve in pairs(veiculosExcecao) do
			
			-- if tonumber(ve.idVeiculo) == veiculoAtual then
				-- veiculoAtual = nil
			-- end
		
		-- end
		
		-- if veiculoAtual then
			-- table.insert(retorno, {idVeiculo = veiculoAtual})
		-- end
	-- end
	
	return result--retorno
	
	

end


function Emprego:SpawnarVeiculo(args)

	local spawnArgs = {}
	
	spawnArgs.model_id = args.model_id
	
	if args.posicao then
		spawnArgs.position = args.posicao
	else
		spawnArgs.position = args.player:GetPosition() 
	end	
	spawnArgs.position = spawnArgs.position + Vector3(0, 2, 0)
	
	if args.angulo then
		spawnArgs.angle = args.angulo
	end
	
	args.invulnerable = true
	
	local veiculo = Vehicle.Create(spawnArgs)
	veiculo:SetUnoccupiedRemove(true)
	
	return veiculo

end


function Emprego:AtualizarEntregas()

	local query = SQL:Query("SELECT idCarreira, nome FROM Carreira")
	local result = query:Execute()
	
	for i, linha in ipairs(result) do
		
		local carreira = {nome = linha.nome}
		
		
		local entregas = self:GetEntregasDB(tonumber(linha.idCarreira))
		if entregas and #entregas > 0 then

			carreira.entregas = entregas
			
			self.carreiras[tonumber(linha.idCarreira)] = carreira

		end
	end

end


function Emprego:GetCarreiraObjeto(idC)
	
	return self.carreiras[idC]
	-- for _, c in pairs(self.carreiras) do
	
		-- if c.id == idC  then
			-- return c
		-- end
	
	-- end
	
	-- return nil

end


function Emprego:GetMercadoriasRandomicasEntrega(idE)
	-- uma mercadoria de cada categoria

	local query = SQL:Query("SELECT me.idMercadoria, m.idCategoria FROM MercadoriaEntrega me INNER JOIN Mercadoria m ON m.idMercadoria = me.idMercadoria WHERE me.idEntrega = ? ORDER BY RANDOM()") --RANDOM()
	query:Bind(1, idE)
	
	local result = query:Execute()
	local retorno = {}
	
	local categoriasUsadas = {}
	
	
	-- if #result > 1 then
		for i, linha in ipairs(result) do
			
			local rand = math.random(3)
			if rand != 3 then

				if not(categoriasUsadas[tonumber(linha.idCategoria)]) then
					categoriasUsadas[tonumber(linha.idCategoria)] = true
					table.insert(retorno, linha)
				end
				
			end

		end
	-- end

	return retorno

end


function Emprego:GetPagamentoPorcentual(distancia)
	
	-- local velocidadeMinuto = 1600 --m / m
	
	-- local tempoEstimado = distancia / velocidadeMinuto -- em  minutos
	
	-- local pagamento = tempoEstimado * 50
	
	-- pagamento = math.floor(math.random(pagamento / 1.4, pagamento))
	-- if pagamento <= 0 then
		-- pagamento = 1
	-- end
	-- return pagamento
	
	return math.random(6, 10) / 10
	
end


function Emprego:GetTempoRandomico()

	return math.floor(math.random(15, 40))
	
end


function Emprego:GetEntregasDB(idC)
	
	local query = SQL:Query("SELECT idEntregaServico FROM EntregaServico WHERE idCarreira = ? AND numEntrega = 1 ORDER BY idEntregaServico")
	query:Bind(1, idC)
	
	local result = query:Execute()
	local entregas = {}
	
	if #result > 0 then
		
		for i, linha in ipairs(result) do

			local query = SQL:Query("SELECT posicao, angulo, distancia FROM EntregaServico WHERE idEntrega = ? ORDER BY numEntrega")
			query:Bind(1, tonumber(linha.idEntregaServico))
			local resultDescarregamentos = query:Execute()
			
			if #resultDescarregamentos > 0 then
	
				local entrega = {
					id = tonumber(linha.idEntregaServico),
					pagamento = self:GetPagamentoPorcentual(tonumber(resultDescarregamentos[1].distancia)),
					tempo = self:GetTempoRandomico(),
					angulo = self:GetAngle(resultDescarregamentos[1].angulo),
					distancia = tonumber(resultDescarregamentos[1].distancia)
				}

				local descargas = {}
				
				for e, linhaDescarregamento in ipairs(resultDescarregamentos) do
					
					descargas[e] = self:GetVector3(linhaDescarregamento.posicao)
				
				end
				
				entrega.descargas = descargas
				
				local mercadorias = self:GetMercadoriasRandomicasEntrega(tonumber(linha.idEntregaServico))
				
				entrega.mercadorias = {}
				for m, mercadoria in ipairs(mercadorias) do
				
					entrega.mercadorias[tonumber(mercadoria.idMercadoria)] = true
				
				end
				
				table.insert(entregas, entrega)
			end
		end
	else
		return nil
	end
		
	return entregas

end

function Emprego:GetVector3(str)
	
	local retorno = string.gsub(str, " ", "")
	retorno = retorno:split(",")
	
	if #retorno != 3 then
		return false
	end
	
	return Vector3(tonumber(retorno[1]), tonumber(retorno[2]), tonumber(retorno[3]))
	
end


function Emprego:GetAngle(str)
	
	local retorno = string.gsub(str, " ", "")
	retorno = retorno:split(",")
	
	if #retorno != 3 then
		return Angle()
	end

	return Angle(tonumber(retorno[1]), tonumber(retorno[2]), tonumber(retorno[3]))
	
end


function Emprego:ModulesLoad()
	
	if #self.arrayMercadorias > 0 then return end
	
	self:AtualizarEntregas()
	
	local query = SQL:Query("SELECT m.idMercadoria, m.nome, m.percentual, m.tipoMercadoria, mT.nome AS 'nomeT', m.valor, idCategoria, nivelCategoria, valorTipo FROM Mercadoria m INNER JOIN MercadoriaTipo mT ON m.tipoMercadoria = mT.idMercadoriaTipo")
	self.arrayMercadorias = query:Execute()
	
	-- local query = SQL:Query("SELECT idCategoriaVeiculoCarreira, idCarreira, nome FROM jcCategoriaVeiculoCarreira")
	-- local result = query:Execute()
	-- for r = 1, #result do
		
		-- local arrayVeiculos = {}
		-- local query = SQL:Query("SELECT idVeiculo FROM jcCategoriaVeiculo WHERE idCategoria = ?")
		-- query:Bind(1, tonumber(result[r].idCategoriaVeiculoCarreira))
		-- local resultV = query:Execute()
		-- for rV = 1, #resultV do
			-- table.insert(arrayVeiculos, tonumber(result[rV].idVeiculo))
		-- end
		
		-- local arrayMercadorias = {}
		-- local query = SQL:Query("SELECT idMercadoria FROM jcCategoriaVeiculoMercadoria WHERE idCategoriaVeiculo = ?")
		-- query:Bind(1, tonumber(result[r].idCategoriaVeiculoCarreira))
		-- local resultM = query:Execute()
		-- for rM = 1, #resultM do
			-- table.insert(arrayMercadorias, tonumber(result[rV].idMercadoria))
		-- end
		
		-- table.insert(self.arrayCategoriaVeiculos, {idCategoria = tonumber(result[r].idCategoriaVeiculoCarreira), nome = result[r].nome, idCarreira = tonumber(result[r].idCarreira), veiculos = arrayVeiculos, mercadorias = arrayMercadorias}
		
	-- end
	
	self:AtualizarPlayers()


end


function Emprego:AtualizarPlayers(boo)

	for player in Server:GetPlayers() do
	
		self:AtualizarPlayer(player, boo)
	
	end

end


function Emprego:PlayerJoin(args)

	self:AtualizarPlayer(args.player)

end


function Emprego:GetMercadoriasPlayer(ply, carreira)

	local query = SQL:Query("SELECT m.idMercadoria, m.nome, m.valor, m.idCategoria, mT.nome AS 'nomeTipoMercadoria', m.valorTipo, m.tipoMercadoria FROM Mercadoria m INNER JOIN MercadoriaTipo mT on mT.idMercadoriaTipo = m.tipoMercadoria INNER JOIN PlayerCategoria pCat ON pCat.idCategoria = m.idCategoria INNER JOIN Categoria cat ON cat.idCategoria = pCat.idCategoria WHERE m.nivelCategoria <= pCat.nivel AND idPlayer = ? AND cat.idCarreira = ? ORDER BY RANDOM()")
	query:Bind(1, ply:GetSteamId().id)
	query:Bind(2, carreira)
	return query:Execute()
	
end


function Emprego:GetEntregasPlayer(ply, carreira)
	
	local entregas = self:GetEntregasMercadoriasCarreira(self:GetMercadoriasPlayer(ply, carreira), carreira)

end


function Emprego:GetEntregasMercadoriasCarreira(mercadorias, carreira)
	
	local carreiraObjeto = self:GetCarreiraObjeto(carreira)
	
	local entregas = {}
	
	for _, m in pairs(mercadorias) do
	
		for _, e in pairs(carreiraObjeto.entregas) do
		
			if e:GetMercadoria(m.idMercadoria) then
				table.insert(entregas, e)
			end
			
		end
		
	end
	
	return entregas

end


function Emprego:AtualizarPlayer(ply)

	local carreira = self:GetCarreira(ply)
	-- if carreira == 1 or carreira == 2 or carreira == 3 or carreira == 5 then
	
	local carreiraObj = self:GetCarreiraObjeto(carreira)
	if carreiraObj then
	
		local arraySend = {
			entregas = carreiraObj.entregas,
			stats = self:GetNiveisCategoriasPlayer(ply, carreira),
			mercadorias = self:GetMercadoriasPlayer(ply, carreira),
		}

		Network:Send(ply, "AtualizarDados", arraySend)
	
	else
		Network:Send(ply, "AtualizarDados", nil)
		return
	end


	
end


function Emprego:GetNiveisCategoriasPlayer(ply, carreira)

	local query = SQL:Query("SELECT cat.idCategoria, nivel, experiencia FROM PlayerCategoria pCat INNER JOIN Categoria cat ON cat.idCategoria = pCat.idCategoria WHERE idPlayer = ? AND idCarreira = ?")
	
	-- local query = SQL:Query("SELECT * FROM jcCategoriaUsuario catU INNER JOIN jcCategoria cat ON cat.idCategoria = catU.idCategoria INNER JOIN jcCarreiraUsuario carU ON carU.idUsuario = catU.idUsuario WHERE catU.idUsuario = ? AND cat.nivelMin <= carU.nivel AND cat.idCarreira = ?")
	
	query:Bind(1, ply:GetSteamId().id)
	query:Bind(2, carreira)
	return query:Execute()
	
end


function Emprego:GetUnlockLiberadoCarreira(ply, carreira)

	local query = SQL:Query("SELECT m.nome, cu.valor, cu.tipo FROM jcCarreiraUnlock cu INNER JOIN jcMercadoria m ON m.idMercadoria = cu.valor WHERE cu.idCarreira = ? AND nivel <= ?")
	
	query:Bind(1, carreira)
	query:Bind(2, self:GetNivelExpCarreira(ply, carreira)[1])
	return query:Execute()

end


function Emprego:GetCarreirasLiberadas(ply)

	local query = SQL:Query("SELECT c.idCarreira, nome FROM jcCarreiraUsuario cu INNER JOIN jcCarreira c ON c.idCarreira = cu.idCarreira WHERE idUsuario = ? GROUP BY c.idCarreira")
	query:Bind(1, ply:GetSteamId().id)
	return query:Execute()

end


function Emprego:GetNivelExpCarreira(ply, carreira)

	local query = SQL:Query("SELECT nivel, experiencia FROM PlayerCarreira WHERE idPlayer = ? AND idCarreira = ?")
	query:Bind(1, ply:GetSteamId().id)
	query:Bind(2, carreira)
	local result = query:Execute()
	if #result > 0 then
		return {tonumber(result[1].nivel), tonumber(result[1].experiencia)}
	else
		local command = SQL:Command("INSERT INTO PlayerCarreira (idPlayer, idCarreira, nivel, experiencia) VALUES(?, ?, ?, ?)")
		command:bind(1, ply:GetSteamId().id)
		command:bind(2, carreira)
		command:bind(3, 0)
		command:bind(4, 0)	
		command:Execute()
		return {0, 0}
	end

end


function Emprego:GetCarreira(ply)

	local query = SQL:Query("SELECT idCarreira FROM Player WHERE idPlayer = ?")
	query:Bind(1, ply:GetSteamId().id)
	local result = query:Execute()
	if #result == 0 then
		return 0
	end
	-- local idCarreira = ply:GetValue("idCarreira")
	-- if not idCarreira then return 0 end
	
	 return tonumber(result[1].idCarreira)

end


function Emprego:GetCategoriaVeiculo(veiId)

	-- return self.categoriasVeiculos:GetCategoriaVeiculo(veiId)
	local query = SQL:Query("SELECT idCategoria FROM CategoriaVeiculo WHERE idVeiculo = ?")
	query:Bind(1, veiId)
	return tonumber(query:Execute()[1].idCategoria)

end


emprego = Emprego()