class 'ComandosChat'

function ComandosChat:__init()

	Events:Subscribe("LocalPlayerChat", self, self.LocalPlayerChat)
end


function ComandosChat:LocalPlayerChat(args)

	if (args.text:sub(1, 1) != "/") then
		return true
	end
	
	self:VerificarComando(args.text)
	return false
end


function ComandosChat:VerificarComando(texto)

	local idCarreira = LocalPlayer:GetValue("idCarreira")
	local nivelUsuario = LocalPlayer:GetValue("nivelUsuario")
	mensagem = texto:split(" ")
	
	--if (nivelUsuario == 1) then
	
		if mensagem[1] == "/givemoney" then
			if (mensagem[2] and type(tonumber(mensagem[2])) == "number" and mensagem[3]) then

				local player = self:ValidarPlayer(mensagem[3])
				if (not player) then return false end
				
				Network:Send("GiveMoney", {valor = tonumber(mensagem[2]), destinatario = player})
				
			else
				self:ErroSintaxe("/givemoney QUANTIA PLAYER")
			end
			return false
		end	
		
		if mensagem[1] == "/goto" then
			if mensagem[2] then
				local player = self:ValidarPlayer(mensagem[2])
				if (not player) then return false end
				
				Network:Send("TeleportToPlayer", {player = player})
				return false
			end		
		end	
		
		if mensagem[1] == "/t2p" then
			if mensagem[2] then
				local player = self:ValidarPlayer(mensagem[2])
				if (not player) then return false end
				
				Network:Send("TeleportOfPlayer", {player = player})
				return false
			end		
		end		
		
		if mensagem[1] == "/tpc" then
			Network:Send("TeleportCheckpoint", {posicao = Waypoint:GetPosition()})
			return false
		end
		
		if mensagem[1] == "/pos" then
			Chat:Print(tostring(LocalPlayer:GetPosition()), Color(255,255,0))
			return false
		end			
		
		if mensagem[1] == "/ang" then
			Chat:Print(tostring(LocalPlayer:GetAngle()), Color(255,255,0))
			return false
		end	
		
		if mensagem[1] == "/vdel" then
			Network:Send("DeletarCarro")
			return false
		end
		
		if mensagem[1] == "/vspawn" then
			Network:Send("SpawnarCarro", {id = tonumber(mensagem[2])})
			return false
		end
		
		if mensagem[1] == "/setlocal" then
			
			if mensagem[2] then
			
				local nome = ""
				
				if mensagem[3] then
					
					for p = 3, #mensagem do
						nome = nome .. mensagem[p] .. " " 
					end
					nome = string.sub(nome, 1, string.len(nome)-1)

				end
				Network:Send("SetLocal", {player = LocalPlayer, nome = nome, posicao = tostring(LocalPlayer:GetPosition()), tipo = mensagem[2]})
				
			else
				Chat:Print("/setlocal tipo nome (1 - vila, 2 - cidade, 3 - aeroporto, 4 - porto, 5 - base militar, 6 - fortaleza, 7 - outpost)", Color(255,0,0))
			end
			return false
		end	
		
		if mensagem[1] == "/settime" then

			Network:Send("SetTime", {tempo = tonumber(mensagem[2])})
			return false
		end
	--end
	
	-- BANCO
	if (mensagem[1] == "/banco") then

		if (mensagem[2] == "sacar") then
	
			if (mensagem[3] and type(tonumber(mensagem[3])) == "number") then
				
				Network:Send("BancoSacar", {player = LocalPlayer, valor = tonumber(mensagem[3])})
				
			else
				self:ErroSintaxe("/banco sacar QUANTIA")
			end
			return false
		end
		
		if (mensagem[2] == "transferir") then
	
			if (mensagem[3] and type(tonumber(mensagem[3])) == "number" and mensagem[4]) then

				local player = self:ValidarPlayer(mensagem[4])
				if (not player) then return false end
				
				Network:Send("BancoTransferir", {player = LocalPlayer, valor = tonumber(mensagem[3]), destinatario = player})
				
			else
				self:ErroSintaxe("/banco transferir QUANTIA PLAYER")
			end
			return false
		end
		
		if (mensagem[2] == "depositar") then
	
			if (mensagem[3] and type(tonumber(mensagem[3])) == "number") then
				
				Network:Send("BancoDepositar", {player = LocalPlayer, valor = tonumber(mensagem[3])})
				
			else
				self:ErroSintaxe("/banco depositar QUANTIA")
			end
			return false
		end
		
		if (mensagem[2] == "saldo") then

			Network:Send("BancoSaldo", {player = LocalPlayer})

			return false
		end
	end
	-- FIM_BANCO	
	
	-- COMANDOS CARREIRAS
	
	-- COMANDOS POLICIAL
	if (idCarreira == 4) then
	
		if mensagem[1] == "/procurados" then
			Events:Fire("Procurados")
			return
		end	
		
		
		if mensagem[1] == "/desalgemar" then
		
			if mensagem[2] then
			
				local player = self:ValidarPlayer(mensagem[2])
			
				if not player then	
					return
				end
				
				if player == LocalPlayer then
					Chat:Print("Voce nao pode se desalgemar!", Color(255,0,0))		
					return
				end
				
				Network:Send("Desalgemar", {policial = LocalPlayer, player = player})
				return	
				
			end		
			
			Chat:Print("Sintaxe correta: /desalgemar ID/NOME", Color(255,0,0))			
			return
		end				
		
		
		if mensagem[1] == "/algemar" then
		
			if mensagem[2] then
			
				local player = self:ValidarPlayer(mensagem[2])
			
				if not player then	
					return
				end
				
				if player == LocalPlayer then
					Chat:Print("Voce nao pode se algemar!", Color(255,0,0))		
					return
				end
				
				if Vector3.Distance(LocalPlayer:GetPosition(), player:GetPosition()) > 10 then
					Chat:Print("Voce esta muito distante do jogador!", Color(255,0,0))		
					return
				end
				
				Network:Send("Algemar", {policial = LocalPlayer, player = player})
				return	
				
			end		
			
			Chat:Print("Sintaxe correta: /algemar ID/NOME", Color(255,0,0))			
			return
		end				
		
		
		if mensagem[1] == "/aceitar" then
			if tonumber(mensagem[2]) then
				Network:Send("Aceitar190", {policial = LocalPlayer, id = tonumber(mensagem[2])})
				return
			else
				Chat:Print("Sintaxe correta: /aceitar ID", Color(255,0,0))			
				return
			end
		end			
		
		
		if mensagem[1] == "/chamados" then
			Network:Send("Chamados190", LocalPlayer)
			return
		end	
		
		
		if mensagem[1] == "/multar" then
		
			if mensagem[2] then
			
				local player = self:ValidarPlayer(mensagem[2])
			
				if not player then	
					return
				end
				
				if player == LocalPlayer then
					Chat:Print("Voce nao pode se multar!", Color(255,0,0))		
					return
				end
				
				if Vector3.Distance(LocalPlayer:GetPosition(), player:GetPosition()) > 10 then
					Chat:Print("Voce esta muito distante do jogador!", Color(255,0,0))		
					return
				end
				
				if mensagem[3] then
				
					Network:Send("Multar", {policial = LocalPlayer, player = player, motivo = string.upper(tostring(mensagem[3]))})
					return	
				end

			end		
			
			Chat:Print("Sintaxe Correta: /multar ID/NOME MOTIVO", Color(255,0,0))	
			return

		end		
		
		
		if mensagem[1] == "/procurar" then
		
			if mensagem[2] then
			
				local player = self:ValidarPlayer(mensagem[2])
			
				if not player then	
					return
				end
				
				if player == LocalPlayer then
					Chat:Print("Voce nao pode se procurar!", Color(255,0,0))		
					return
				end				
				
				if mensagem[3] then
				
					Network:Send("Procurar", {policial = LocalPlayer, player = player, motivo = string.upper(tostring(mensagem[3]))})
					return	
				end

			end		
			
			Chat:Print("Sintaxe Correta: /procurar ID/NOME MOTIVO", Color(255,0,0))	
			return

		end		
		
		
		if mensagem[1] == "/desprocurar" then
		
			if mensagem[2] then
			
				local player = self:ValidarPlayer(mensagem[2])
			
				if not player then	
					return
				end
				
				if player == LocalPlayer then
					Chat:Print("Voce nao pode se desprocurar!", Color(255,0,0))		
					return
				end				
				
				if mensagem[3] then
				
					Network:Send("Desprocurar", {policial = LocalPlayer, player = player, motivo = string.upper(tostring(mensagem[3]))})
					return	
				end

			end		
			
			Chat:Print("Sintaxe Correta: /desprocurar ID/NOME MOTIVO", Color(255,0,0))	
			return

		end		
		
		if mensagem[1] == "/prender" then
		
			if mensagem[2] then
			
				local player = self:ValidarPlayer(mensagem[2])
			
				if not player then	
					return
				end
				
				if player == LocalPlayer then
					Chat:Print("Voce nao pode se prender!", Color(255,0,0))		
					return
				end				

				Network:Send("Prender", {policial = LocalPlayer, player = player})
				return	
			end		
			
			Chat:Print("Sintaxe Correta: /prender ID/NOME", Color(255,0,0))	
			return

		end

	end	
	-- FIM COMANDOS POLICIAL
	
	-- FIM COMANDOS CARREIRAS
	
	-- CASA
		if mensagem[1] == "/casa" then
		
			if mensagem[2] == "aceitar" then
				Network:Send("CasaAceitar", {player = LocalPlayer})
				return
			end
		end
	-- FIM CASA
	
	Chat:Print("Comandos inexistente!", Color(255,0,0))
	return false
end


function ComandosChat:ErroSintaxe(modoCorreto)

	Chat:Print("Sintaxe correta: "..modoCorreto, Color(255,0,0))
end


function ComandosChat:ValidarPlayer(args)
	
	local player = nil
	if tonumber(args) then
				
		player = Player.GetById(tonumber(args))
	else
		player = Player.Match(args)[1]
	end
	
	if player then
		return player
	else
		self:ErroSintaxe("Nenhum jogador encontrado com o parametro: ".. args)
		return false
	end

end

comandosChat = ComandosChat()