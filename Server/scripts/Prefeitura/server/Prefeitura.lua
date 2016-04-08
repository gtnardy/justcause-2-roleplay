class 'Prefeitura'


function Prefeitura:__init()

	-- Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("PlayerEnterCheckpoint", self, self.PlayerEnterCheckpoint)
	
	Network:Subscribe("PagarImpostos", self, self.PagarImpostos)
	Network:Subscribe("Candidatar", self, self.PrefeituraCandidatar)
	Network:Subscribe("Votar", self, self.PrefeituraVotar)

	Network:Subscribe("MudarCarreira", self, self.MudarCarreira)
	
	Network:Subscribe("AtualizarDadosPrefeitura", self, self.AtualizarDadosPrefeitura)

	
	self.timer = Timer()
end

function Prefeitura:MudarCarreira(args, player)
	
	
	Events:Fire("MudarCarreira", {player = player, idCarreira = args.idCarreira})

end


function Prefeitura:PlayerEnterCheckpoint(args)

	if args.checkpoint:GetType() == 6 then
		Network:Send(args.player, "EntrouPrefeitura")
		Chat:Send(args.player,"Voce entrou na Prefeitura!", Color(255,255,200))
		Chat:Send(args.player,"----------------------------------------------------------------------------------------------", Color(255,255,200))
		Chat:Send(args.player,"Pressione J para acessar o menu.", Color(200,200,200))
		-- if self:NomePresidente() then
			
			-- Chat:Send(args.player,"O Atual Prefeito e: ".. self:NomePresidente(), Color(200,200,200))
		-- else
			-- Chat:Send(args.player,"Panau nao possui um Prefeito!", Color(200,200,200))		
		-- end
		Chat:Send(args.player,"----------------------------------------------------------------------------------------------", Color(255,255,200))
	
	end

end


function Prefeitura:AtualizarDadosPrefeitura(args, player)

	-- local query = SQL:Query("SELECT idCandidatos, Nome, Partido FROM jcCandidatos jcC INNER JOIN jcUsuario jcU ON jcC.idUsuario = jcU.idUsuario WHERE Cargo = 1")
	-- local candidatos = query:Execute()
	local candidatos = nil
	
	local query = SQL:Query("SELECT idCarreira, nome, descricao, nivelMinimo FROM Carreira")
	local carreiras = query:Execute()

	Network:Send(player, "AtualizarDadosPrefeitura", {candidatos = candidatos, carreiras = carreiras})
	
end


function Prefeitura:PagarImpostos(args, player)

	local query = SQL:Query("SELECT sum(valor) AS 'valor' FROM jcImposto WHERE idUsuario = ? AND tipo = 1")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	
	if #result > 0 then
		if result[1].valor and tonumber(result[1].valor) > 0 then
			if player:GetMoney() >= tonumber(result[1].valor) then
				player:SetMoney(player:GetMoney() - tonumber(result[1].valor))
				Chat:Send(player, "Voce pagou seus impostos com sucesso (R$ ".. tostring(result[1].valor) ..")!", Color(255,255,200))	
				local command = SQL:Command("DELETE FROM jcImposto WHERE idUsuario = ? AND tipo = 1")
				command:Bind(1, player:GetSteamId().id)
				command:Execute()
				Events:Fire("AumentarGov", tonumber(result[1].valor))
			else
				Chat:Send(player, "Voce nao possui dinheiro suficiente para pagar seus impostos (R$ ".. tostring(result[1].valor)..")!", Color(255,0,0))				
			end
		else
			Chat:Send(player, "Voce nao possui impostos para pagar!", Color(255,255,200))
		end				
	else
		Chat:Send(player, "Voce nao possui impostos para pagar!", Color(255,255,200))
	end

end


function Prefeitura:PostTick()

	if self.timer:GetSeconds() > 1800 then --10800
		
		local query = SQL:Query("SELECT dataEntrada FROM jcCargos WHERE idCargo = 1")
		local result = query:Execute()
		if #result > 0 then
		
			local query = SQL:Query("SELECT Nome FROM jcUsuario WHERE idProfissao = 7")
			local result2 = query:Execute()
			if #result2 > 0 then		
			
				if os.time() - 604800 > tonumber(result[1].dataEntrada) then --604800
				
					self:limparCargos(1)
					self:novaEleicao(1)
					Chat:Broadcast("[ PREFEITURA ] O reinado do atual prefeito acabou! E as inscricoes e votacoes acabam de iniciar!!", Color(240,240,150))
								
				end
				
			else
			
				self:limparCargos(1)
				self:novaEleicao(1)
				Chat:Broadcast("[ PREFEITURA ] Parece que nao ha prefeitos em Panau! Portando as inscricoes e votacoes estao abertas! Vote na prefeitura!", Color(240,240,150))
			
			end
		else
		
			self:limparCargos(1)		
			self:novaEleicao(1)

			Chat:Broadcast("[ PREFEITURA ] Parece que nao ha prefeitos em Panau! Portando as inscricoes e votacoes estao abertas! Vote na prefeitura!", Color(240,240,150))
			
		end
		
		local query = SQL:Query("SELECT dataInicio FROM jcEleicoes WHERE Cargo = 1")
		local result = query:Execute()
		if #result > 0 then
		
			if os.time() - 43200 > tonumber(result[1].dataInicio) then --43200
			
				Chat:Broadcast("[ PREFEITURA ] ELEICOES TERMINADAS!", Color(240,240,150))
				self:eleger(1)
				self:limparVotos(1)
			end
		
		end
		
		
		self.timer:Restart()
	end

end


function Prefeitura:PrefeituraVotar(args)

	if not self:naPrefeitura(args[1]) then
		Chat:Send(args[1], "Voce nao esta na prefeitura!", Color(255,0,0))
		return
	end

	local query = SQL:Query("SELECT * FROM jcEleicoes WHERE Cargo = 1")
	local result = query:Execute()
	
	if #result == 0 then
		Chat:Send(args[1], "Nao ha uma eleicao estabelecida!", Color(255,0,0))	
		return
	end		
	
	local query = SQL:Query("SELECT * FROM jcVotacoes WHERE idUsuario = ?")
	query:Bind(1, args[1]:GetSteamId().id)
	local result = query:Execute()
	
	if #result > 0 then
		Chat:Send(args[1], "Seu voto foi alterado!", Color(255,255,200))	
	end
	
	local query = SQL:Query("SELECT * FROM jcCandidatos WHERE idCandidatos = ?")
	query:Bind(1, args[2])
	local result = query:Execute()
	if #result > 0 then	
		
		if result[1].idUsuario == args[1]:GetSteamId().id then
		
			Chat:Send(args[1], "Voce nao pode votar em si mesmo!.", Color(255,0,0))
			return
		
		end
		
		self:novoVoto({args[1]:GetSteamId().id, 1, args[2]})
		Chat:Send(args[1], "Voce votou com sucesso no Candidato numero ".. tostring(args[2]), Color(255,255,200))
		
	else
		Chat:Send(args[1], "Ocorreu um erro! Nao existe nenhum candidato com esse numero!", Color(255,0,0))	
		return false		
	end	

	
end


function Prefeitura:PrefeituraCandidatar(args)

	if not self:naPrefeitura(args[1]) then
		Chat:Send(args[1], "Voce nao esta na prefeitura!", Color(255,0,0))
		return
	end
	
	local query = SQL:Query("SELECT * FROM jcEleicoes")
	local result = query:Execute()
	
	if #result == 0 then
		Chat:Send(args[1], "Nao ha uma eleicao estabelecida!", Color(255,0,0))	
		return
	end
	
	if self:horaJogadaUsuario(args[1]) < 30 then
		Chat:Send(args[1], "Voce precisa de pelo menos 30 horas jogadas no servidor!", Color(255,0,0))
		return
	end
	
	if self:nivelUsuario(args[1]) < 20 then
		Chat:Send(args[1], "Voce precisa de pelo menos nivel 20 para se candidatar!", Color(255,0,0))
		return
	end	
	
	if args[1]:GetMoney() < 3000 then
		Chat:Send(args[1], "Voce precisa de R$ 3000 para se candidatar!", Color(255,0,0))
		return
	end
	
	args[1]:SetMoney(args[1]:GetMoney() - 3000)
	
	self:novoCandidato(args)
	
	Chat:Send(args[1], "Parabens! Voce se candidatou para ser Prefeito de Panau!", Color(255,255,200))	
	
end


function Prefeitura:novoPresidente(args)
	
	local command = SQL:Command("UPDATE jcUsuario SET idProfissao = 1 WHERE idProfissao = 7")
	command:Execute()
	
	Events:Fire("ConfirmadoMudancaCarreira", {player = args[1], idCarreira = 7})
	
	local command = SQL:Command("DELETE FROM jcCargos WHERE idCargo = ?")
	command:Bind(1, args[1])
	command:Execute()
	
	local command = SQL:Command("INSERT INTO jcCargos (idCargo, idUsuario, dataEntrada) VALUES(?, ?, ".. os.time() ..")")
	command:Bind(1, args[1])
	command:Bind(2, args[2])
	command:Execute()	

end


function Prefeitura:idCandidato(args)

	local query = SQL:Query("SELECT idUsuario FROM jcCandidatos WHERE idCandidatos = ?")
	query:Bind(1, args)
	local result = query:Execute()
	if #result > 0 then
		return result[1].idUsuario
	else
		return "0"
	end
end


function Prefeitura:NomePresidente()

	local query = SQL:Query("SELECT Nome FROM jcUsuario WHERE idProfissao = 7")
	local result = query:Execute()
	if #result > 0 then
		return result[1].Nome
	else
		return "Ninguem"
	end
	
end


function Prefeitura:eleger(args)

	local query = SQL:Query("SELECT count(*) AS 'count', Candidato FROM jcVotacoes GROUP BY Candidato ORDER BY count")
	local result = query:Execute()
	if #result > 0 then
		if tonumber(result[1].count) > 0 and result[1].Candidato then
			self:novoPresidente({1, self:idCandidato(tonumber(result[1].Candidato))})
			Chat:Broadcast("[ PREFEITURA ] O novo prefeito atende pelo nome de: "..self:NomePresidente()..".", Color(240,240,150))	
			self:limparEleicao(1)
			self:limparCandidatos(1)							
		else
			Chat:Broadcast("[ PREFEITURA ] Ninguem se candidatou para prefeito! As inscricoes ainda estao abertas!", Color(240,240,150))	
			self:limparEleicao(1)
			self:novaEleicao(1)
		end
	else
	
		Chat:Broadcast("[ PREFEITURA ] Ninguem se candidatou para prefeito! As votacoes continuam!", Color(240,240,150))	
				
	end
	

end


function Prefeitura:limparEleicao(args)

	local command = SQL:Command("DELETE FROM jcEleicoes WHERE Cargo = ?")
	command:Bind(1, args)
	command:Execute()

end


function Prefeitura:limparVotos(args)

	local command = SQL:Command("DELETE FROM jcVotacoes WHERE Cargo = ?")
	command:Bind(1, args)
	command:Execute()

end


function Prefeitura:limparCandidatos(args)

	local command = SQL:Command("DELETE FROM jcCandidatos WHERE Cargo = ?")
	command:Bind(1, args)
	command:Execute()

end


function Prefeitura:limparCargos(args)

	local command = SQL:Command("UPDATE jcUsuario SET idProfissao = 1 WHERE idProfissao = 7")
	command:Execute()	
	

end


function Prefeitura:novoVoto(args)

	local command = SQL:Command("INSERT OR REPLACE INTO jcVotacoes (idUsuario, Cargo, dataInicio, Candidato) VALUES (?, ?, ".. os.time() ..", ?)")
	command:Bind(1, args[1])
	command:Bind(2, args[2])
	command:Bind(3, args[3])
	command:Execute()

end


function Prefeitura:novaEleicao(args)

	local query = SQL:Query("SELECT * FROM jcEleicoes WHERE Cargo = 1")
	local result = query:Execute()
	if #result > 0 then



	else
	
		local command = SQL:Command("INSERT INTO jcEleicoes (Cargo, dataInicio) VALUES (".. args ..", ".. os.time() ..")")
		command:Execute()	
	end


end


function Prefeitura:novoCandidato(args)
	
	local query = SQL:Query("SELECT * FROM jcCandidatos WHERE idUsuario = ?")
	query:Bind(1, args[1]:GetSteamId().id)
	local result = query:Execute()	
	if #result > 0 then
	
		local command = SQL:Command("UPDATE jcCandidatos SET Partido = ? WHERE idUsuario = ?")
		command:Bind(1, args[2])
		command:Bind(2, args[1]:GetSteamId().id)
		command:Execute()			
	
	else
	
		local command = SQL:Command("INSERT INTO jcCandidatos (idUsuario, Cargo, data, Partido) VALUES(?, 1, ".. os.time() ..", ?)")
		command:Bind(1, args[1]:GetSteamId().id)
		command:Bind(2, args[2])
		command:Execute()	
		
	end


end


function Prefeitura:nivelUsuario(args)

	local query = SQL:Query("SELECT Level FROM jcUsuario WHERE idUsuario = ?")
	query:Bind(1, args:GetSteamId().id)
	local result = query:Execute()
	if #result > 0 then
	
		return tonumber(result[1].Level)
	
	end

end


function Prefeitura:horaJogadaUsuario(args)

	local query = SQL:Query("SELECT Hora FROM jcUsuario WHERE idUsuario = ?")
	query:Bind(1, args:GetSteamId().id)
	local result = query:Execute()
	if #result > 0 then
	
		return tonumber(result[1].Hora)
	
	end

end


function Prefeitura:naPrefeitura(args)

	local query = SQL:Query("SELECT posx, posy, posz FROM jcUtilitarios WHERE tipoUtilitario = 21")
	local result = query:Execute()
	if #result > 0 then
		
		naPref = false
		for r = 1, #result do
			if Vector3.Distance(args:GetPosition(), Vector3(tonumber(result[r].posx), tonumber(result[r].posy), tonumber(result[r].posz))) < 10 then
				
				naPref = true
		
			end	
		end
		
		return naPref
	end
	

end


pref = Prefeitura()