class 'ProdutorServer'

function ProdutorServer:__init()

	self.produtores = {}
	self:AtualizarProdutores()
	
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
end


function ProdutorServer:ModuleUnload()

	for idProdutor, produtor in pairs(self.produtores) do
	
		local command = SQL:Command("UPDATE Produtor SET quantidade = ?, tempoRestante = ? WHERE idProdutor = ?")
		command:Bind(1, produtor.mercadoria.quantidade)
		command:Bind(2, produtor.mercadoria.tempoRestante)
		command:Bind(3, idProdutor)
		command:Execute()
		
	end
	
end


function ProdutorServer:ProduzirMercadoria(produtor)
	
	if produtor.armazem > produtor.mercadoria.quantidade then
		produtor.mercadoria.quantidade = produtor.mercadoria.quantidade + 1
		produtor.mercadoria.tempoRestante = produtor.mercadoria.tempoProducao
	end
	
end


function ProdutorServer:ClientModuleLoad(args)

	self:AtualizarPlayer(args.player)
	
end


function ProdutorServer:AtualizarPlayer(player)

	Network:Send(player, "AtualizarPlayer", {produtores = self.produtores})
	
end


function ProdutorServer:AtualizarProdutores()

	local query = SQL:Query("SELECT idProdutor, posicao, posicaoEntrega, anguloEntrega, quantidade, p.tipo, p.idMercadoria, m.nome, m.tempoProducao, tempoRestante, armazem, pt.descricao FROM Produtor p INNER JOIN Mercadoria m ON p.idMercadoria = m.idMercadoria INNER JOIN ProdutorTipo pt ON pt.idTipoProdutor = p.tipo")
	local result = query:Execute()
	for _, linha in ipairs(result) do
	
		self:AtualizarProdutorArray(linha)
	end
	
end


function ProdutorServer:AtualizarProdutor(idProdutor)

	local query = SQL:Query("SELECT idProdutor, posicao, posicaoEntrega, anguloEntrega, p.tipo, p.idMercadoria, m.nome, pt.descricao FROM Produtor p INNER JOIN Mercadoria m ON p.idMercadoria = m.idMercadoria INNER JOIN ProdutorTipo pt ON pt.idTipoProdutor = p.tipo WHERE idProdutor = ?")
	query:Bind(1, idProdutor)
	local result = query:Execute()
	if #result > 0 then
	
		self:AtualizarProdutorArray(result[1])
	end
	-- Network:Broadcast("AtualizarProdutor")

end


function ProdutorServer:AtualizarProdutorArray(linha)

	if linha then
		self.produtores[tonumber(linha.idProdutor)] = {
			id = tonumber(linha.idProdutor),
			posicao = self:StringToVector3(linha.posicao),
			posicaoEntrega = self:StringToVector3(linha.posicaoEntrega),
			anguloEntrega = self:StringToAngle(linha.anguloEntrega),
			nome = linha.descricao,
			tipo = tonumber(linha.tipo),
			armazem = tonumber(linha.armazem),
			mercadoria = {idMercadoria = tonumber(linha.idMercadoria), nome = linha.nome, tempoProducao = tonumber(linha.tempoProducao), quantidade = tonumber(linha.quantidade), tempoRestante = tonumber(linha.tempoRestante)},
		}
	else
		self.produtores[tonumber(linha.idProdutor)] = nil
	end
	
end


function ProdutorServer:StringToVector3(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end

end


function ProdutorServer:StringToAngle(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5]) and tonumber(v[7])) then
		return Angle(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]), tonumber(v[7]))
	else
		return nil
	end

end