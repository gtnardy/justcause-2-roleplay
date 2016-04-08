class 'Policial'

function Policial:__init()

	self.dps = {}
	self.chamados = {}
	self.timer = Timer()
	self.posicaoCadeia = Vector3(1114,204,1094)
	self:ModuleLoad()
	
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("PlayerQuit", self, self.PlayerQuit)
	
	Events:Subscribe("PlayerEnterVehicle", self, self.PlayerEnterVehicle)
	Events:Subscribe("AtualizarEstrelas", self, self.AtualizarEstrelas)
	Events:Subscribe("PlayerDeath", self, self.PlayerDeath)
	Events:Subscribe("Desprocurar", self, self.Desprocurar)
	Events:Subscribe("Procurar", self, self.Procurar)
	Network:Subscribe("Desalgemar", self, self.Desalgemar)
	Network:Subscribe("Desprender", self, self.Desprender)
	Network:Subscribe("FugiuCadeia", self, self.FugiuCadeia)
	Network:Subscribe("SalvarTempo", self, self.SalvarTempo)
	
	Events:Subscribe("SoltarCadeia", self, self.Desprender)

	Events:Subscribe("Desalgemar", self, self.PolicialDesalgemar)
	Events:Subscribe("Algemar", self, self.PolicialAlgemar)
	Events:Subscribe("ForcarEntrada", self, self.ForcarEntrada)
	Events:Subscribe("Multar", self, self.Multar)
	Events:Subscribe("PrenderCadeia", self, self.PrenderCadeia)
	Events:Subscribe("Prender", self, self.Prender)
	
	Events:Subscribe("Chamados190", self, self.Chamados190)
	Events:Subscribe("Chamado190", self, self.Chamado190)
	Network:Subscribe("Chamado190", self, self.Chamado190)
	Events:Subscribe("Aceitar190", self, self.Aceitar190)
	
	Network:Subscribe("PunicaoAutomatica", self, self.PunicaoAutomatica)
	
	Network:Subscribe("AtualizarProcurados", self, self.AtualizarProcurados)
	
	-- Network:Subscribe("JuntarPolicia", self, self.JuntarPolicia)
	Network:Subscribe("FichaCriminal", self, self.FichaCriminal)
	Network:Subscribe("ComprarPorte", self, self.ComprarPorte)
	Network:Subscribe("PagarEstrelas", self, self.PagarEstrelas)
	Network:Subscribe("PagarMultas", self, self.PagarMultas)
	Network:Subscribe("EntregarArmas", self, self.EntregarArmas)
	Network:Subscribe("ListarPresos", self, self.ListarPresos)
	
	
	
end


function Policial:PlayerEnterVehicle(args)

	if args.is_driver and args.old_driver then
	
		Network:Send(args.old_driver, "VeiculoRoubado", args.player)
	
	end

end


function Policial:PostTick(args)

	if self.timer:GetSeconds() > 5 then
		
		for _, c in pairs(self.chamados) do
		
			c.tempo = c.tempo - 5
			if c.tempo <= 0 then
			
				Chat:Send(c.player, "Seu pedido de 190 expirou!", Color(255,0,0))
				table.remove(self.chamados, _)
			end
		end
		self.timer:Restart()
	
	end

end


function Policial:PlayerDeath(args)
	
	Network:Send(args.player, "PlayerDeath", args)

end


function Policial:PlayerQuit(args)

	for _, c in pairs(self.chamados) do
		
		if c.player == args.player then
			table.remove(self.chamados, _)
		end

	end
	
end


function Policial:Aceitar190(args)
	
	local player = nil
	for _, c in pairs(self.chamados) do
		
		if c.player:GetId() == args.id then
			player = c.player
			-- table.remove(self.chamados, _)
			self.chamados[_] = nil
		end

	end
	
	if player then
		Chat:Send(args.policial, "Voce aceitou o chamado 190 de "..tostring(player)..". O GPS foi apontado para o local!", Color(255,255,200))
		Chat:Send(player, tostring(args.policial).. " aceitou seu chamado 190. Sua posicao foi indicada para o policial. Nao se mova!", Color(46, 204, 113))
		self:MensagemPoliciais(tostring(args.policial).. " aceitou o chamado 190 de "..tostring(player)..".", Color(46, 204, 113), args.policial)
		Network:Send(args.policial,"Aceitou190", player:GetPosition())
	else
		Chat:Send(args.policial, "Nao foi encontrado nenhum chamado desse jogador (ID)!", Color(255,0,0))
	end
	
end


function Policial:Chamados190(args)
	
	Chat:Send(args, "Chamados 190", Color(255,255,200))
	Chat:Send(args, "---------------------------------------------------------------------", Color(255,255,200))
	for _, c in pairs(self.chamados) do
	
		Chat:Send(args, "["..tostring(c.player:GetId()).. "] "..tostring(c.player)..": ".. c.mensagem.. " - ".. 90 - c.tempo.. " segundos atras." , Color(255,255,255))
		
	end
	Chat:Send(args, "---------------------------------------------------------------------", Color(255,255,200))

end


function Policial:Chamado190(args)
	-- player, mensagem
	
	Chat:Send(args.player, "[190] - "..args.mensagem, Color(39, 174, 96))
	table.insert(self.chamados, {player = args.player, mensagem = args.mensagem, tempo = 90})
	
	self:MensagemPoliciais("[190] ".. tostring(args.player) .." [".. args.player:GetId() .."] - "..args.mensagem, Color(46, 204, 113))


end


function Policial:MensagemPoliciais(mensagem, cor, playerExcecao)

	for player in Server:GetPlayers() do
		
		if player:GetValue("idCarreira") == 4 then
		
			if not (playerExcecao and playerExcecao == player) then
				Chat:Send(player, mensagem, cor)
			end
			
		end
	
	end

end


function Policial:Desalgemar(args)
	
	args.player:SetNetworkValue("algemado", nil)
	
end


function Policial:PolicialDesalgemar(args)

	Chat:Send(args.player, "Voce foi desalgemado pelo policial ".. tostring(args.policial).."!", Color(255,0,0))
	Chat:Send(args.policial, "Voce desalgemou ".. tostring(args.player).. "!", Color(255,0,0))
	
	self:Desalgemar({player = args.player})
end


function Policial:ForcarEntrada(args)

	Chat:Send(args.player, "Voce foi forcado a entrar no camburao pelo policial ".. tostring(args.policial).." e esta algemado!", Color(255,0,0))
	Chat:Send(args.policial, "Voce forcou a entrada de ".. tostring(args.player).. ", que ficou algemado por 600 segundos!", Color(255,0,0))
	
	self:Algemar({player = args.player, tempo = 600})
end


function Policial:PolicialAlgemar(args)
	-- player, policial
	Chat:Send(args.player, "Voce foi algemado pelo policial ".. tostring(args.policial).."!", Color(255,0,0))
	Chat:Send(args.policial, "Voce algemou ".. tostring(args.player).. " por 60 segundos!", Color(255,0,0))
	
	self:Algemar({player = args.player, tempo = 60})
end


function Policial:Algemar(args)
	
	Network:Send(args.player, "Algemar", args.tempo)
	args.player:SetNetworkValue("algemado", true)
	
end


function Policial:ModuleLoad()

	local query = SQL:Query("SELECT posicao FROM Local WHERE tipo = 19")
	local result = query:Execute()
	for _, linha in ipairs(result) do
		table.insert(self.dps, {posicao = self:StringToVector3(linha.posicao)})
	end

	
end


function Policial:ClientModuleLoad(args)

	self:AtualizarPlayer(args.player)

end


function Policial:AtualizarPlayer(ply)

	self:PrenderCadeia(ply)
	
	if self.dps then

		Network:Send(ply, "AtualizarDados", {dps = self.dps, estrelas = self:GetCountEstrelas(ply)})
	end
	
end


function Policial:AtualizarEstrelas(ply)

	Network:Send(ply, "AtualizarEstrelas", self:GetCountEstrelas(ply))

end


-- function Policial:JuntarPolicia(args)
	
	-- Events:Fire("MudarCarreira", {player = args, idCarreira = 4})
	
-- end


function Policial:PunicaoAutomatica(args)
	
	local motivos = {}
	motivos[1] = {id = 6, motivo = "Tentativa de Homicidio"}
	motivos[2] = {id = 3, motivo = "Homicidio"}
	motivos[3] = {id = 5, motivo = "Atropelamento"}
	motivos[4] = {id = 7, motivo = "Roubo de Veiculo"}
	
	
	if IsValid(args.punido) then

		Chat:Send(args.punido, "Voce foi denunciado por ".. motivos[args.id].motivo .." e esta sendo procurado pela policia!", Color(255,255,0))

	end
	
	self:NovoProcurado(args.steamIdPunido, motivos[args.id].id, os.time())
	Chat:Send(args.player, "O jogador ".. args.nomePunido .. " foi procurado automaticamente por ".. motivos[args.id].motivo .."! Obrigado por denunciar!", Color(255,255,0))
	
	if IsValid(args.punido) then	
		self:AtualizarEstrelas(args.punido)
	end

end


function Policial:Desprocurar(args)

	-- policial, player, motivo
	local query = SQL:Query("SELECT * FROM Procurado WHERE sigla = ? AND liberado = 1")
	query:Bind(1, tostring(args.motivo))
	local result = query:Execute()
	if #result == 0 then
	
		Chat:Send(args.policial, "Motivo invalido! Motivos validos:", Color(255,255,200))
		Chat:Send(args.policial, "----------------------------------------------------------------------------", Color(255,255,200))
		
		local query = SQL:Query("SELECT descricao, sigla FROM Procurado WHERE liberado = 1")
		local result = query:Execute()
		for _, r in pairs(result) do
		
			Chat:Send(args.policial, r.sigla.." - ".. r.descricao, Color(255,255,255))
		end
		Chat:Send(args.policial, "----------------------------------------------------------------------------", Color(255,255,200))
		
		return
	end
	
	local procurado = result[1]
	
	
	local query = SQL:Query("SELECT idPlayerProcurado FROM PlayerProcurado WHERE idPlayer = ? AND tipo = ? AND idPolicial = ?")
	query:Bind(1, args.player:GetSteamId().id)
	query:Bind(2, procurado.idProcurado)
	query:Bind(3, args.policial:GetSteamId().id)
	local result = query:Execute()
	if #result > 0 then
		
		local command = SQL:Command("DELETE FROM PlayerProcurado WHERE idPlayerProcurado = ?")
		command:Bind(1, result[1].idPlayerProcurado)	
		command:Execute()
		Chat:Send(args.policial, "Voce desprocurou o jogador ".. tostring(args.player).. " por ".. procurado.sigla..".", Color(255,255,0))
		Chat:Send(args.player, "Voce foi desprocurado pelo policial ".. tostring(args.policial).. " por ".. procurado.sigla..".", Color(255,255,0))
		self:MensagemPoliciais(tostring(args.policial).. " desprocurou "..tostring(args.player).." por "..procurado.sigla..".", Color(46, 204, 113), args.policial)
		self:AtualizarEstrelas(args.player)
		
	else
	
		Chat:Send(args.policial, "Voce apenas pode desprocurar jogadores que procurou!", Color(255,0,0))
		return
	end


	
end


function Policial:Prender(args)

	-- policial, player
	
	if not self:EstaNaDp(args.policial) then
		Chat:Send(args.policial, "Voce precisa estar em uma Delegacia Policial para poder prender!", Color(255,0,0))
		return
		
	end	
	
	if not self:EstaNaDp(args.player) then
		Chat:Send(args.policial, "O jogador precisa estar em uma Delegacia Policial para poder ser preso!", Color(255,0,0))
		return
		
	end
	
	local estrelas = self:GetCountEstrelas(args.player)
	
	if estrelas < 3 then
		Chat:Send(args.policial, "O jogador precisa ter 3 ou mais estrelas para poder se preso!", Color(255,0,0))
		return
	end
	
	
	Chat:Send(args.player, tostring(args.player)..", voce esta sendo preso pelo policial "..tostring(args.policial).." pelos seguintes motivos:", Color(255,255,0))
	
	local prisao = self:NovoPreso(args)
	
	Chat:Send(args.policial, "Voce prendeu o jogador "..tostring(args.player).. " por "..prisao.tempo.. " segundos. Ele pagou R$ "..prisao.pagamento.." aos cofres publicos!" , Color(255,255,200))
				
	Events:Fire("AgregarExpEmprego", {args.policial, 200, 9})
	
end


function Policial:NovoPreso(args)

	local query = SQL:Query("SELECT nome, idPolicial, descricao, sigla, valor, estrelas, tempo FROM PlayerProcurado pp INNER JOIN Procurado p ON pp.tipo = p.idProcurado LEFT JOIN Player ply ON ply.idPlayer = pp.idPolicial WHERE pp.idPlayer = ?")
	query:Bind(1, args.player:GetSteamId().id)
	local result = query:Execute()
	
	local pagamento = 0
	local tempo = 0

	for _, r in pairs(result) do
		
		local txt = r.estrelas .. "* [".. r.sigla .."] ".. r.descricao .. " - R$ "..r.valor.. " - ".. r.tempo.. " segundos "
		if r.nome then
			txt = txt.. " (policial: ".. r.nome ..")."
		else
			txt = txt.. " (procura automatica)."
		end
		
		local valor = tonumber(r.valor / 4)
		local experiencia = tonumber(r.valor / 2)
		
		self:BonificarPolicial(r.nome, r.idPolicial, experiencia, valor, 9)
		
		Chat:Send(args.player, txt, Color(255,255,200))
		
		pagamento = pagamento + tonumber(r.valor)
		tempo = tempo + tonumber(r.tempo)
	
	end
	
	
	local command = SQL:Command("DELETE FROM PlayerProcurado WHERE idPlayer = ?")
	command:Bind(1, args.player:GetSteamId().id)
	command:Execute()

	local command = SQL:Command("UPDATE Player SET dinheiroBanco = dinheiroBanco - ? WHERE idPlayer = ?")
	command:Bind(1, pagamento)
	command:Bind(2, args.player:GetSteamId().id)
	command:Execute()

	Chat:Send(args.player, "Foi descontado R$ ".. pagamento.." diretamente de seu banco!", Color(255,255,0))
	
	local command = SQL:Command("INSERT INTO PlayerPreso (idPlater, tempoRestante) VALUES(?, ?)")
	
	command:Bind(1, args.player:GetSteamId().id)
	command:Bind(2, tempo)
	command:Execute()
	
	self:PrenderCadeia( args.player)
	self:AtualizarEstrelas(args.player)
	self:Desalgemar({player = args.player})
	return {pagamento = pagamento, tempo = tempo}
	
end


function Policial:FugiuCadeia(player)

	player:SetPosition(Vector3(1114,204,1094))
	
end


function Policial:SalvarTempo(args)

	local command = SQL:Command("UPDATE PlayerPreso SET tempoRestante = ? WHERE idPlayer = ?")
	command:Bind(1, args.tempo)
	command:Bind(2, args.player:GetSteamId().id)
	command:Execute()
	
end


function Policial:PrenderCadeia(player)
	
	local query = SQL:Query("SELECT tempoRestante FROM PlayerPreso WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	if #result == 0 then
		player:SetNetworkValue("preso", nil)
		return
	end
	
	local tempo = tonumber(result[1].tempoRestante)

	player:SetNetworkValue("preso", true)
	player:SetPosition(self.posicaoCadeia)

	Network:Send(player, "Prender", tempo)
		
end


function Policial:Desprender(player)

	local command = SQL:Command("DELETE FROM PlayerPreso WHERE idPlayer = ?")
	command:Bind(1, player:GetSteamId().id)
	command:Execute()
	Chat:Send(player, "A liberdade cantou!", Color(255,255,0))
	
	player:SetNetworkValue("preso", nil)
	player:SetPosition(Vector3(-10241, 203, -2647))
	return false
	
end


function Policial:Procurar(args)

	-- policial, player, motivo
	local query = SQL:Query("SELECT * FROM Procurado WHERE sigla = ? AND liberado = 1")
	query:Bind(1, tostring(args.motivo))
	local result = query:Execute()
	if #result == 0 then
	
		Chat:Send(args.policial, "Motivo invalido! Motivos validos:", Color(255,255,200))
		Chat:Send(args.policial, "----------------------------------------------------------------------------", Color(255,255,200))
		
		local query = SQL:Query("SELECT descricao, sigla FROM Procurado WHERE liberado = 1")
		local result = query:Execute()
		for _, r in pairs(result) do
		
			Chat:Send(args.policial, r.sigla.." - ".. r.descricao, Color(255,255,255))
		end
		Chat:Send(args.policial, "----------------------------------------------------------------------------", Color(255,255,200))
		
		return
	end
	
	local procurado = result[1]
	
	if tonumber(procurado.idProcuradoTipo) == 1 then
	
		local query = SQL:Query("SELECT * FROM PlayerAquisicao WHERE idPlayer = ? AND idAquisicao = 1")
		query:Bind(1, args.player:GetSteamId().id)
		local result = query:Execute()
		if #result > 0 then
			Chat:Send(args.policial, "Voce nao pode procurar alguem por PIA que possue porte! Se continuar abusando sera punido!", Color(255,0,0))
			return
		end

	end
	
	local dataAtual = os.time()
	
	local query = SQL:Query("SELECT * FROM PlayerProcurado WHERE idPlayer = ? AND tipo = ? AND data > ?")
	query:Bind(1, args.player:GetSteamId().id)
	query:Bind(2, procurado.idProcuradoTipo)
	query:Bind(3, dataAtual - 3600)
	local result = query:Execute()
	if #result > 0 then
	
		Chat:Send(args.policial, "Esse jogador ja foi procurado por esse motivo na ultima hora!", Color(255,0,0))
		return
	end
	
	self:NovoProcurado(args.player, procurado.idProcuradoTipo, dataAtual, args.policial)
	Chat:Send(args.policial, "Voce procurou em "..procurado.estrelas.." estrela(s) o jogador ".. tostring(args.player).. " por "..procurado.descricao.." ("..procurado.sigla..").", Color(255,255,0))
	Chat:Send(args.player, "Voce foi procurado em "..procurado.estrelas.." estrela(s) pelo policial ".. tostring(args.policial).. " por "..procurado.descricao.." ("..procurado.sigla..").", Color(255,255,0))
	self:MensagemPoliciais(tostring(args.policial).. " procurou "..tostring(args.player).." por "..procurado.sigla..".", Color(46, 204, 113), args.policial)	

end


function Policial:NovoProcurado(player, procurado, data, policial)

	command = SQL:Command("INSERT INTO PlayerProcurado (idPlayer, tipo, data) VALUES(?, ?, ?)")

	if policial then
		command = SQL:Command("INSERT INTO PlayerProcurado (idPlayer, tipo, data, idPolicial) VALUES(?, ?, ?, ?)")
	end
	
	if IsValid(player) then
		command:Bind(1, player:GetSteamId().id)
	else
		command:Bind(1, player)
	end
	command:Bind(2, procurado)
	command:Bind(3, data)
	
	if policial then
		command:Bind(4, policial:GetSteamId().id)
	end
	command:Execute()
	
	if IsValid(player) then
		self:AtualizarEstrelas(player)
	end

end


function Policial:Multar(args)

	-- policial, player, motivo
	local query = SQL:Query("SELECT * FROM Multa WHERE sigla = ?")
	query:Bind(1, tostring(args.motivo))
	local result = query:Execute()
	if #result == 0 then
	
		Chat:Send(args.policial, "Motivo invalido! Motivos validos:", Color(255,255,200))
		Chat:Send(args.policial, "----------------------------------------------------------------------------", Color(255,255,200))
		
		local query = SQL:Query("SELECT descricao, sigla FROM Multa")
		local result = query:Execute()
		for _, r in pairs(result) do
		
			Chat:Send(args.policial, r.sigla.." - ".. r.descricao, Color(255,255,255))
		end
		Chat:Send(args.policial, "----------------------------------------------------------------------------", Color(255,255,200))
		
		return
	end
	
	local multa = result[1]
	
	if tonumber(multa.idMultaTipo) == 1 then
	
		local query = SQL:Query("SELECT * FROM PlayerHabilitacao WHERE idPlayer = ? AND idHabilitacao = 1")
		query:Bind(1, args.player:GetSteamId().id)
		local result = query:Execute()
		if #result > 0 then
			Chat:Send(args.policial, "Voce nao pode multar alguem por FHT que possue habilitacao! Se continuar abusando sera punido!", Color(255,0,0))
			return
		end
		
	else
		if tonumber(multa.idMultaTipo) == 2 then
		
			local query = SQL:Query("SELECT * FROM PlayerHabilitacao WHERE idPlayer = ? AND idHabilitacao = 2")
			query:Bind(1, args.player:GetSteamId().id)
			local result = query:Execute()
			if #result > 0 then
				Chat:Send(args.policial, "Voce nao pode multar alguem por FHT que possue habilitacao! Se continuar abusando sera punido!", Color(255,0,0))
				return
			end
			
		end
	end
	
	local dataAtual = os.time()
	
	local query = SQL:Query("SELECT * FROM PlayerMulta WHERE idPlayer = ? AND tipo = ? AND data > ?")
	query:Bind(1, args.player:GetSteamId().id)
	query:Bind(2, multa.idMultaTipo)
	query:Bind(3, dataAtual - 3600)
	local result = query:Execute()
	if #result > 0 then
	
		Chat:Send(args.policial, "Esse jogador ja foi multado por esse motivo na ultima hora!", Color(255,0,0))
		return
	end
	
	self:NovaMulta(args.player, multa.idMultaTipo, dataAtual, args.policial)
	Chat:Send(args.policial, "Voce multou em R$ "..multa.valor.." o jogador ".. tostring(args.player).. " por "..multa.descricao.." ("..multa.sigla..").", Color(255,255,0))
	Chat:Send(args.player, "Voce foi multado em R$ "..multa.valor.." pelo policial ".. tostring(args.policial).. " por "..multa.descricao.." ("..multa.sigla..").", Color(255,255,0))

end


function Policial:NovaMulta(player, multa, data, policial)

	command = SQL:Command("INSERT INTO PlayerMulta (idPlayer, tipo, data) VALUES(?, ?, ?)")

	if policial then
		command = SQL:Command("INSERT INTO PlayerMulta (idPlayer, tipo, data, idPolicial) VALUES(?, ?, ?, ?)")
	end
	
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, multa)
	command:Bind(3, data)
	
	if policial then
		command:Bind(4, policial:GetSteamId().id)
	end
	command:Execute()

end


function Policial:GetCountEstrelas(ply)

	local query = SQL:Query("SELECT sum(estrelas) AS 'sum' FROM PlayerProcurado pp INNER JOIN Procurado p ON pp.tipo = p.idProcurado WHERE pp.idPlayer = ?")
	query:Bind(1, ply:GetSteamId().id)
	local result = query:Execute()	
	if #result > 0 then
		
		if tonumber(result[1].sum) then
		
			return tonumber(result[1].sum)
		end
		
	end
	
	return 0

end


function Policial:AtualizarProcurados(ply)

	local query = SQL:Query("SELECT pp.idPlayer, nome, sum(estrelas) AS 'estrelas' FROM PlayerProcurado pp INNER JOIN Procurado p ON pp.tipo = p.idProcurado INNER JOIN Player ply ON ply.idPlayer = pp.idPlayer WHERE estrelas > 0 GROUP BY ply.idPlayer")
	local result = query:Execute()	

	Network:Send(ply, "AtualizarProcurados", result)

	

end


function Policial:PagarEstrelas(args, ply)
	
	if self:GetCountEstrelas(ply) > 2 then
		Chat:Send(ply, "Voce possue mais de 2 estrelas, portanto nao pode mais pagar!", Color(255, 0, 0))
		return
	end
	
	local query = SQL:Query("SELECT idPlayerProcurado, sigla, valor, idPolicial, Nome FROM PlayerProcurado pp INNER JOIN Procurado p ON p.idProcurado = pp.tipo INNER JOIN Player ply ON ply.idPlayer = idPolicial WHERE ply.idPlayer = ?")
	query:Bind(1, ply:GetSteamId().id)
	local result = query:Execute()	
	if #result > 0 then

		for _, r in pairs(result) do
		
			if ply:GetMoney() >= tonumber(r.valor) then
				
				Chat:Send(ply, "Voce pagou a estrela de ".. r.sigla .. " (R$ "..r.valor..")", Color(255, 255, 200))
				ply:SetMoney(ply:GetMoney() - tonumber(r.valor))
				local command = SQL:Command("DELETE FROM PlayerProcurado WHERE idPlayerProcurado = ?")
				command:Bind(1, r.idPlayerProcurado)
				command:Execute()
				
				local valor = tonumber(r.valor / 4)
				local experiencia = tonumber(r.valor / 2)
				
				self:BonificarPolicial(r.Nome, r.idPolicial, experiencia, valor, 9)
			else
				Chat:Send(ply, "Voce nao possue dinheiro para pagar a estrela de ".. r.sigla .. " (R$ "..r.valor..")", Color(255, 0, 0))
			end
		end
		
		self:AtualizarEstrelas(ply)
	else
		Chat:Send(ply, "Voce nao possue estrelas para serem pagas!", Color(255, 255, 200))
	end
	
end


function Policial:PagarMultas(args, ply)

	local query = SQL:Query("SELECT idPlayerMulta, sigla, valor, idPolicial, nome FROM PlayerMulta pm INNER JOIN Multa m ON pm.tipo = m.idMulta INNER JOIN Player p ON p.idPlayer = pm.idPolicial WHERE p.idPlayer = ?")
	query:Bind(1, ply:GetSteamId().id)
	local result = query:Execute()	
	if #result > 0 then
	
		for _, r in pairs(result) do
			if ply:GetMoney() >= tonumber(r.valor) then
				
				Chat:Send(ply, "Voce pagou a multa de ".. r.sigla .. " (R$ "..r.valor..")", Color(255, 255, 200))
				ply:SetMoney(ply:GetMoney() - tonumber(r.valor))
						
				local valor = tonumber(r.valor / 4)
				local experiencia = tonumber(r.valor / 2)
				
				self:BonificarPolicial(r.nome, tonumber(r.idPolicial), experiencia, valor, 9)
				
				local command = SQL:Command("DELETE FROM PlayerMulta WHERE idPlayerMulta = ?")
				command:Bind(1, r.idPlayerMulta)
				command:Execute()		
				
			else
				Chat:Send(ply, "Voce nao possue dinheiro para pagar a multa de ".. r.sigla .. " (R$ "..r.valor..")", Color(255, 0, 0))
			end
		end
	
	else
		Chat:Send(ply, "Voce nao possue multas para serem pagas!", Color(255, 255, 200))
	end

end


function Policial:BonificarPolicial(nome, steamId, experiencia, valor, categoria)
	if not nome then return end
	local policiais = Player.Match(nome)
	
	local policial = nil
	for index, player in pairs(policiais) do
		if player:GetSteamId().id == steamId then
			policial = player
		end
	end

	if policial then
		policial:SetMoney(policial:GetMoney() + valor)
	else
		policial = steamId
			
		local command = SQL:Command("UPDATE Player SET dinheiro = dinheiro + ? WHERE idPlayer = ?")
		command:Bind(1, valor)
		command:Bind(2, steamId)
		command:Execute()		
	end
				
	Events:Fire("AgregarExpEmprego", {policial, experiencia, categoria})
	
end


function Policial:ListarPresos(args, player)

	local query = SQL:Query("SELECT ply.nome, ply.idPlayer, pp.tempoRestante FROM PlayerPreso pp INNER JOIN Player ply ON ply.idPlayer = pp.idPlayer")
	local result = query:Execute()		
	if #result > 0 then
		Chat:Send(player, "Lista de presos ONLINE:" , Color(255, 255, 200))	
		Chat:Send(player, "-----------------------------------------------------------------------------------------" , Color(255, 255, 200))	
		for playerServer in Server:GetPlayers() do

			for p = 1, #result do

				if playerServer:GetSteamId().id == result[p].idPlayer then
					Chat:Send(player, playerServer:GetName() .." - ".. result[p].tempoRestante .." segundos restantes " , Color(255, 255, 255))
				end

			end
		end
		Chat:Send(player, "-----------------------------------------------------------------------------------------" , Color(255, 255, 200))			
	else
		Chat:Send(player, "Nao possuem presos conectados no momento!" , Color(255, 255, 200))
					
	end
end


function Policial:EntregarArmas(args, player)

	if self:GetTemPorte(player) then
		
		local command = SQL:Command("DELETE FROM jcArma WHERE idPlayer = ? AND tipoArma != 2 and tipoArma != 4")
		command:Bind(1, player:GetSteamId().id)
		command:Execute()

	else
	
		local command = SQL:Command("DELETE FROM jcArma WHERE idPlayer = ? ")
		command:Bind(1, player:GetSteamId().id)
		command:Execute()
	end
	
	Chat:Send(player, "Voce entregou suas armas ilegais!", Color(255,255,200))

end


function Policial:ComprarPorte(args, player)

	if player:GetMoney() < 10000 then
		Chat:Send(player, "Voce nao possue dinheiro suficiente!", Color(255,0,0))
		return
	end
	
	if self:GetTemPorte(player) then
		
		Chat:Send(player, "Voce ja possui Porte de Armas!", Color(255,255,220))
		return

	else
	
		local command = SQL:Command("INSERT INTO PlayerAquisicao (idPlayer, idAquisicao) VALUES(?, ?)")		
		command:Bind(1, player:GetSteamId().id)
		command:Bind(2, 2)
		command:Execute()
		player:SetMoney(player:GetMoney() - 10000)
		Chat:Send(player, "Voce comprou Porte de Armas com sucesso!", Color(255,255,200))
		return	
	end
				
end


function Policial:GetTemPorte(ply)

	local query = SQL:Query("SELECT * FROM PlayerAquisicao WHERE idPlayer = ? AND idAquisicao = 1")
	query:Bind(1, ply:GetSteamId().id)
	local result = query:Execute()
	if #result == 0 then
		
		return false

	end
	return true
	
end


function Policial:FichaCriminal(args, ply)

	Chat:Send(ply, "Ficha Criminal de ".. tostring(ply), Color(255,255,200))
	Chat:Send(ply, "------------------------------------------------------------------------------------", Color(255,255,200))
	
	local fichaLimpa = true
	
	local query = SQL:Query("SELECT pontos, idHabilitacao FROM PlayerHabilitacao WHERE idPlayer = ?")
	query:Bind(1, ply:GetSteamId().id)
	local result = query:Execute()
	
	local habilitacoes = {
		[1] = "Terrestre (Carro)",
		[2] = "Terrestre (Moto)",
		[3] = "Marinha",
		[4] = "Terrestre (Caminhao)",
	}
	
	for _, linha in ipairs(result) do
		if tonumber(linha.pontos) > 0 then
			fichaLimpa = false
			Chat:Send(ply, "Voce possue ".. linha.pontos .. " pontos em sua Carteira "..tostring(habilitacoes[tonumber(linha.idHabilitacao)]) .. ".", Color(231, 76, 60))

		end
	end

	if not self:GetTemPorte(ply) then
		
		Chat:Send(ply, "Voce nao possue porte de armas!", Color(243, 156, 18))

	end
	
	local query = SQL:Query("SELECT descricao, sigla, data, valor, idPolicial, nome FROM PlayerMulta pm INNER JOIN Multa m ON pm.tipo = m.idMulta INNER JOIN Player p ON pm.idPolicial = p.idPlayer WHERE pm.idPlayer = ?")
	query:Bind(1, ply:GetSteamId().id)
	local result = query:Execute()	
	if #result > 0 then
	
		fichaLimpa = false
		Chat:Send(ply, "Voce possue as seguintes multas pendentes:", Color(255, 255, 255))
		for _, r in pairs(result) do
			
			-- 10800 segundos = 3 horas
			local tempoRestante = 10800 - (os.time() - tonumber(r.data) )
			Chat:Send(ply, "["..r.sigla.."] "..r.descricao.." ( R$"..r.valor.." ) - "..tempoRestante.." segundos ate expiracao - Policial: ".. r.nome .. " ("..r.idPolicial..")", Color(231, 76, 60))
		
		end
	
	end	
	
	local query = SQL:Query("SELECT descricao, sigla, data, valor, idPolicial, nome, estrelas FROM PlayerProcurado pp INNER JOIN Procurado p ON pp.tipo = p.idProcurado LEFT JOIN Player ply ON pp.idPolicial = ply.idPlayer WHERE pp.idPlayer = ? ORDER BY estrelas DESC")
	query:Bind(1, ply:GetSteamId().id)
	local result = query:Execute()	
	if #result > 0 then
	
		fichaLimpa = false
		Chat:Send(ply, "Voce possue as seguintes estrelas de procurado:", Color(255, 255, 255))
		for _, r in pairs(result) do
			
			if tonumber(r.estrelas) > 2 then
				Chat:Send(ply, "*"..r.estrelas.. " ["..r.sigla.."] "..r.descricao.." ( R$"..r.valor.." ) - Policial: ".. r.nome .. " ("..r.idPolicial..")", Color(231, 76, 60))
			else
				Chat:Send(ply, "*"..r.estrelas.. " ["..r.sigla.."] "..r.descricao.." ( R$"..r.valor.." ) - Policial: ".. r.nome .. " ("..r.idPolicial..")", Color(243, 156, 18))
			end
		
		end
	
	end
	
	if fichaLimpa then
		Chat:Send(ply, "Parabens! Voce esta com a ficha limpa!", Color(46, 204, 113))
	end
	Chat:Send(ply, "------------------------------------------------------------------------------------", Color(255,255,200))

	
end


function Policial:StringToVector3(str)

	local v = tostring(str):split(", ")
	return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))

end


function Policial:EstaNaDp(ply)
	
	for _, dp in ipairs(self.dps) do
	
		if Vector3.Distance(ply:GetPosition(), dp.posicao) < 5 then
				return true
		end
	end

	return false
end

pl = Policial()