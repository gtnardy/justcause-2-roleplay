class 'EmpresaServer'

function EmpresaServer:__init()

	self.empresas = {}
	self:AtualizarEmpresas()
	
	self.mercadorias = {}
	self:AtualizarMercadorias()
		
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
end


function EmpresaServer:ProduzirMercadoria(empresa, mercadoria)

	if self:GetQuantidadeArmazem(empresa) < empresa.armazem then
		
		local dados_mercadoria = self.mercadorias[mercadoria.idMercadoria]
		
		
		local possuiMercadoriaNecessaria = true
		
		for idMercadoriaReceita, mercadoriaReceita in pairs(dados_mercadoria.mercadoriasReceita) do
		
			if not (empresa.mercadorias[idMercadoriaReceita] and empresa.mercadorias[idMercadoriaReceita].quantidade >= mercadoriaReceita.quantidade) then
				possuiMercadoriaNecessaria = false
			end
			
		end
		
		if possuiMercadoriaNecessaria then
		
			for idMercadoriaReceita, mercadoriaReceita in pairs(dados_mercadoria.mercadoriasReceita) do
				empresa.mercadorias[idMercadoriaReceita].quantidade = empresa.mercadorias[idMercadoriaReceita].quantidade - mercadoriaReceita.quantidade
			end
			
			mercadoria.quantidade = mercadoria.quantidade + 1
			mercadoria.tempoRestante = mercadoria.tempoProducao
		end
	end
	
end


function EmpresaServer:GetQuantidadeArmazem(empresa)

	local quantidade = 0
	for _, mercadoria in pairs(empresa.mercadorias) do
		quantidade = quantidade + mercadoria.quantidade
	end
	return quantidade
	
end


function EmpresaServer:ClientModuleLoad(args)

	self:AtualizarPlayer(args.player)
	
end


function EmpresaServer:AtualizarPlayer(player)

	Network:Send(player, "AtualizarPlayer", {empresas = self.empresas, mercadorias = self.mercadorias})
	
end


function EmpresaServer:AtualizarMercadorias()

	local query = SQL:Query("SELECT idMercadoria, nome, percentual, valor, tempoProducao FROM Mercadoria")
	local result = query:Execute()
	for _, linha in ipairs(result) do
	
		local mercadoriasReceita = {}
		local query = SQL:Query("SELECT idMercadoriaNecessaria, quantidade FROM MercadoriaReceita WHERE idMercadoriaProduzir = "..linha.idMercadoria)
		local result2 = query:Execute()
		for _, mercadoriaNecessaria in ipairs(result2) do
			mercadoriasReceita[tonumber(mercadoriaNecessaria.idMercadoriaNecessaria)] = {
				quantidade = mercadoriaNecessaria.quantidade
			}
		end
		
		self.mercadorias[tonumber(linha.idMercadoria)] = {
			nome = linha.nome,
			percentual = tonumber(linha.percentual),
			tempoProducao = tonumber(linha.tempoProducao),
			valor = tonumber(linha.valor),
			mercadoriasReceita = mercadoriasReceita,
		}
	end
	
end


function EmpresaServer:AtualizarEmpresas()

	local query = SQL:Query("SELECT idEmpresa, nome, posicao, posicaoEntrega, anguloEntrega, tipo, pedidoAutomatico, et.descricao, et.armazem FROM Empresa e INNER JOIN EmpresaTipo et ON e.tipo = et.idEmpresaTipo")
	local result = query:Execute()
	for _, linha in ipairs(result) do
	
		local mercadorias = {}
		local query = SQL:Query("SELECT em.idEmpresaMercadoria, em.idMercadoria, nome, quantidade, tempoProducao, tempoRestante FROM EmpresaMercadoria em INNER JOIN Mercadoria m ON m.idMercadoria = em.idMercadoria WHERE idEmpresa = "..linha.idEmpresa)
		local result2 = query:Execute()
		for _, mercadoria in ipairs(result2) do
		
			mercadorias[tonumber(mercadoria.idMercadoria)] = {
				idEmpresaMercadoria = tonumber(mercadoria.idEmpresaMercadoria),
				idMercadoria = tonumber(mercadoria.idMercadoria),
				producao = tonumber(mercadoria.producao),
				nome = mercadoria.nome,
				quantidade = tonumber(mercadoria.quantidade),
				tempoProducao = tonumber(mercadoria.tempoProducao),
				tempoRestante = tonumber(mercadoria.tempoRestante),
			}
			
		end	
		
		local idDono = nil
		local funcionarios = {}
		local query = SQL:Query("SELECT pe.idPlayer, nome, nivelFuncionario, salario FROM PlayerEmpresa pe INNER JOIN Player p ON p.idPlayer = pe.idPlayer WHERE idEmpresa = ".. linha.idEmpresa)
		local result3 = query:Execute()
		for _, funcionario in ipairs(result3) do
		
			if tonumber(funcionario.nivelFuncionario) == 1 then
				idDono = funcionario.idPlayer
			end
			
			table.insert(funcionarios, {
				nome = funcionario.nome,
				idPlayer = funcionario.idPlayer,
				nivelFuncionario = tonumber(funcionario.nivelFuncionario),
				salario = tonumber(funcionario.salario),
			})
			
		end
		
		self.empresas[tonumber(linha.idEmpresa)] = {
			id = tonumber(linha.idEmpresa),
			nome = linha.nome,
			idDono = idDono,
			posicao = self:StringToVector3(linha.posicao),
			posicaoEntrega = self:StringToVector3(linha.posicao),
			anguloEntrega = self:StringToAngle(linha.anguloEntrega),
			pedidoAutomatico = tonumber(linha.pedidoAutomatico),
			descricao = linha.descricao,
			tipo = tonumber(linha.tipo),
			armazem = tonumber(linha.armazem),
			funcionarios = funcionarios,
			mercadorias = mercadorias
		}

	end
	
end


function EmpresaServer:ModuleUnload()

	for idEmpresa, empresa in pairs(self.empresas) do
		for idMercadoria, mercadoria in pairs(empresa.mercadorias) do
	
			local command = SQL:Command("UPDATE EmpresaMercadoria SET quantidade = ?, tempoRestante = ? WHERE idEmpresa = ? AND idMercadoria = ?")
			command:Bind(1, mercadoria.quantidade)
			command:Bind(2, mercadoria.tempoRestante)
			command:Bind(3, idEmpresa)
			command:Bind(4, idMercadoria)
			command:Execute()
		end
	end
end


function EmpresaServer:StringToVector3(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end

end


function EmpresaServer:StringToAngle(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5]) and tonumber(v[7])) then
		return Angle(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]), tonumber(v[7]))
	else
		return nil
	end

end