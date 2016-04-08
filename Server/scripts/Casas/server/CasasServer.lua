class 'CasasServer'

function CasasServer:__init()

	self.convitesMorador = {}
	self.casas = {}
	self:AtualizarCasas()
	self.timer = Timer()
	
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("PostTick", self, self.PostTick)
	
	Network:Subscribe("EntrarGaragem", self, self.EntrarGaragem)
	Network:Subscribe("ComprarCasa", self, self.ComprarCasa)
	Network:Subscribe("VenderCasa", self, self.VenderCasa)
	Network:Subscribe("SairCasa", self, self.SairCasa)
	Network:Subscribe("AlterarAluguel", self, self.AlterarAluguel)
	Network:Subscribe("ConvidarMorador", self, self.ConvidarMorador)
	Network:Subscribe("ExpulsarMorador", self, self.ExpulsarMorador)
	Network:Subscribe("SubirNivelMorador", self, self.SubirNivelMorador)
	Network:Subscribe("DescerNivelMorador", self, self.DescerNivelMorador)
	
	Events:Subscribe("CasaAceitar", self, self.CasaAceitar)

end


function CasasServer:PostTick()

	if self.timer:GetSeconds() > 5 then
		for _, convite in ipairs(self.convitesMorador) do
		
			if not IsValid(convite.morador) or not IsValid(convite.player) then
			
				if IsValid(convite.player) then
					Chat:Send(convite.player, "O jogador se desconectou, portanto o convite expirou!", Color(255,0,0))
				end
				if IsValid(convite.morador) then
					Chat:Send(convite.morador, "O jogador se desconectou, portanto o convite expirou!", Color(255,0,0))
				end
				table.remove(self.convitesMorador, _)
	
			else
				
				if convite.tempo <= 0 then
					Chat:Send(convite.player, "O seu convite ao jogador ".. tostring(convite.morador) .. " para ser morador de sua casa expirou!", Color(255,0,0))
					Chat:Send(convite.morador, "O convite do jogador ".. tostring(convite.player) .. " para ser morador de sua casa expirou!", Color(255,0,0))
					table.remove(self.convitesMorador, _)
				end
				convite.tempo = convite.tempo - 5
			end
			
		end
		self.timer:Restart()
	end

end


function CasasServer:EntrarGaragem(args, player)

	Events:Fire("EntrarGaragem", {player = player, boolean = true})

end


function CasasServer:VenderCasa(args, player)
	
	local casa = self:GetCasa(player:GetSteamId().id)
	if not casa then
		Chat:Send(player, "Voce nao e dono de uma casa!", Color(255,0,0))
		return
	end
	
	if self:GetNivelMorador(player:GetSteamId().id) != 1 then
		Chat:Send(player, "Voce nao possui autorizacao para fazer isso!", Color(255,0,0))
		return
	end

	local valor = math.floor(tonumber(casa.valor) * 70 / 100)
	
	local query = SQL:Query("SELECT idPlayer FROM PlayerCasa WHERE idCasa = ?")
	query:Bind(1, casa.idCasa)
	local result = query:Execute()

	local command = SQL:Command("DELETE FROM PlayerCasa WHERE idCasa = ?")
	command:Bind(1, casa.idCasa)
	command:Execute()
	
	for _, linha in ipairs(result) do
		local morador = self:GetPlayerBySteamId(linha.idPlayer)
		self:AtualizarPlayer(morador)
	end
	
	player:SetMoney(player:GetMoney() + valor)
	
	Chat:Send(player, "Voce vendeu sua casa por R$ "..valor .." e os moradores foram despejados!", Color(255,255,200))
	self:AtualizarCasa(tonumber(casa.idCasa))
end


function CasasServer:SairCasa(args, player)

	local casa = self:GetCasa(player:GetSteamId().id)
	if not casa then
		Chat:Send(player, "Voce nao e morador de uma casa!", Color(255,0,0))
		return
	end
	
	local command = SQL:Command("DELETE FROM PlayerCasa WHERE idPlayer = ?")
	command:Bind(1, player:GetSteamId().id)
	command:Execute()
	
	Chat:Send(player, "Voce deixou de ser morador de sua casa!", Color(255,255,200))
	Events:Fire("MudouCasa", {player = player})
	self:AtualizarCasa(tonumber(casa.idCasa))
end


function CasasServer:ExpulsarMorador(args, player)

	if self:GetNivelMorador(player:GetSteamId().id) != 1 then
		Chat:Send(player, "Voce nao possui autorizacao para fazer isso!", Color(255,0,0))
		return
	end
	
	local casa = self:GetCasa(args.idMorador)
	if not (casa and tonumber(casa.idCasa) == tonumber(args.idCasa)) then
		Chat:Send(player, "Esse jogador nao pertence a sua casa!", Color(255,0,0))
		return
	end
	
	local command = SQL:Command("DELETE FROM PlayerCasa WHERE idCasa = ? AND idPlayer = ?")
	command:Bind(1, args.idCasa)
	command:Bind(2, args.idMorador)
	command:Execute()
	
	local morador = self:GetPlayerBySteamId(args.idMorador)
	if morador then
		Chat:Send(morador, "Voce foi expulso de sua casa!", Color(255,0,0))
		Events:Fire("MudouCasa", {player = morador})
	end
	
	self:AtualizarCasa(tonumber(casa.idCasa))
	Chat:Send(player, "O morador foi expulso de sua casa!", Color(255,0,0))
	
	
end


function CasasServer:DescerNivelMorador(args, player)

	if self:GetNivelMorador(player:GetSteamId().id) != 1 then
		Chat:Send(player, "Voce nao possui autorizacao para fazer isso!", Color(255,0,0))
		return
	end
	
	local nivelMorador = self:GetNivelMorador(args.idMorador)
	if (nivelMorador >= 3) then
		Chat:Send(player, "O morador ja esta com o nivel minimo permitido!", Color(255,0,0))
		return
	end
	
	local command = SQL:Command("UPDATE PlayerCasa SET nivelMorador = nivelMorador + 1 WHERE idCasa = ? AND idPlayer = ?")
	command:Bind(1, args.idCasa)
	command:Bind(2, args.idMorador)
	command:Execute()
	Chat:Send(player, "O nivel de morador foi diminuido para ".. nivelMorador + 1 .."!", Color(255,255,200))
end


function CasasServer:SubirNivelMorador(args, player)

	if self:GetNivelMorador(player:GetSteamId().id) != 1 then
		Chat:Send(player, "Voce nao possui autorizacao para fazer isso!", Color(255,0,0))
		return
	end
	
	local nivelMorador = self:GetNivelMorador(args.idMorador)
	if (nivelMorador <= 2) then
		Chat:Send(player, "O morador ja esta com o nivel maximo permitido!", Color(255,0,0))
		return
	end
	
	local command = SQL:Command("UPDATE PlayerCasa SET nivelMorador = nivelMorador - 1 WHERE idCasa = ? AND idPlayer = ?")
	command:Bind(1, args.idCasa)
	command:Bind(2, args.idMorador)
	command:Execute()
	Chat:Send(player, "O nivel de morador foi aumentado para ".. nivelMorador - 1 .."!", Color(255,255,200))
	
end


function CasasServer:AlterarAluguel(args, player)
	
	local casa = self:GetCasa(player:GetSteamId().id)
	if not casa then
		Chat:Send(player, "Voce nao possui uma casa!", Color(255,0,0))
		return
	end
	
	if self:GetNivelMorador(player:GetSteamId().id) != 1 then
		Chat:Send(player, "Voce nao possui autorizacao para fazer isso!", Color(255,0,0))
		return
	end

	local command = SQL:Command("UPDATE PlayerCasa SET aluguel = ? WHERE idCasa = ? AND idPlayer = ?")
	command:Bind(1, args.valor)
	command:Bind(2, casa.idCasa)
	command:Bind(3, args.idMorador)
	command:Execute()
	Chat:Send(player, "O aluguel do morador foi alterado para ".. args.valor .."!", Color(255,255,200))
	
end


function CasasServer:AtualizarPlayer(player)

	local casaPropria = false
	local query = SQL:Query("SELECT idCasa, nivelMorador, aluguel FROM PlayerCasa WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	if #result > 0 then
		casaPropria = {idCasa = tonumber(result[1].idCasa), nivelMorador = tonumber(result[1].nivelMorador), aluguel = tonumber(result[1].aluguel)}
	end
	
	Network:Send(player, "AtualizarDados", {casas = self.casas, casaPropria = casaPropria})
	
end


function CasasServer:ClientModuleLoad(args)

	self:AtualizarPlayer(args.player)
	
end


function CasasServer:AtualizarCasas()

	local query = SQL:Query("SELECT idCasa, posicao, valor FROM Casa")
	local result = query:Execute()
	for _, linha in ipairs(result) do

		local query = SQL:Query("SELECT pc.idPlayer, nome, nivelMorador, aluguel FROM PlayerCasa pc INNER JOIN Player p ON p.idPlayer = pc.idPlayer WHERE idCasa = ? ORDER BY nivelMorador")
		query:Bind(1, linha.idCasa)
		local moradores = query:Execute()

		self.casas[tonumber(linha.idCasa)] = {idCasa = tonumber(linha.idCasa), posicao = self:StringToVector3(linha.posicao), valor = tonumber(linha.valor), moradores = moradores}
		
	end

end


function CasasServer:NovoPlayerCasa(player, idCasa, nivelMorador)

	if self:GetCasa(player:GetSteamId().id) then
		Chat:Send(player, "Voce ja e morador de uma casa!", Color(255,0,0))
		return false
	end

	local command = SQL:Command("INSERT INTO PlayerCasa (idPlayer, idCasa, nivelMorador, aluguel) VALUES(?, ?, ?, ?)")
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, idCasa)
	command:Bind(3, nivelMorador)
	command:Bind(4, 0)
	command:Execute()
	Events:Fire("MudouCasa", {player = player})
	return true
	
end


function CasasServer:ComprarCasa(args, player)
			
	local query = SQL:Query("SELECT * FROM PlayerCasa WHERE idCasa = ?")
	query:Bind(1, args.idCasa)
	local result = query:Execute()
	if #result > 0 then
		Chat:Send(player, "Essa casa ja possui um dono!", Color(255,0,0))
		return false
	end
	
	local infosCasa = self.casas[tonumber(args.idCasa)]
	if not infosCasa then
		Chat:Send(player, "Ocorreu um erro! Contacte um admin! (Essa casa nao existe!)", Color(255,0,0))
		return false
	end
	
	if player:GetMoney() < infosCasa.valor then
		Chat:Send(player, "Voce nao possui dinheiro suficiente para comprar essa casa!", Color(255,0,0))
		return
	end
	
	if (self:NovoPlayerCasa(player, args.idCasa, 1)) then
		
		player:SetMoney(player:GetMoney() - infosCasa.valor)
		Chat:Send(player, "Parabens por sua nova adquisicao!", Color(45, 65, 30))

	end
	
	self:AtualizarCasa(tonumber(args.idCasa))
	self:AtualizarPlayer(player)

end


function CasasServer:GetCasa(steamId)

	local query = SQL:Query("SELECT * FROM PlayerCasa pc INNER JOIN Casa c ON c.idCasa = pc.idCasa WHERE idPlayer = ?")
	query:Bind(1, steamId)
	local result = query:Execute()
	if #result > 0 then
		return result[1]
	end

	return false
end


function CasasServer:GetNivelMorador(steamId)

	local query = SQL:Query("SELECT nivelMorador FROM PlayerCasa WHERE idPlayer = ?")
	query:Bind(1, steamId)
	local result = query:Execute()
	if #result > 0 then
		return tonumber(result[1].nivelMorador)
	end
	
	return 0
end


function CasasServer:GetConviteMorador(player)

	for _, convite in ipairs(self.convitesMorador) do
		if convite.morador == player then
			return {i = _, convite = convite}
		end
	end
	
	return false
end


function CasasServer:CasaAceitar(args)
	
	local conviteArray = self:GetConviteMorador(args.player)
	
	if conviteArray then
		local convite = conviteArray.convite
		table.remove(self.convitesMorador, conviteArray.i)
		local query = SQL:Query("SELECT idCasa FROM PlayerCasa WHERE idPlayer = ? AND nivelMorador = 1")
		query:Bind(1, convite.player:GetSteamId().id)
		local result = query:Execute()
		local idCasa = tonumber(result[1].idCasa)
		if not idCasa then
			Chat:Send(args.player, "Ops! Parece que o jogador nao possui mais esta casa!", Color(255,0,0))
			return
		end
		self:NovoPlayerCasa(convite.morador, idCasa, 3)
		self:AtualizarCasa(idCasa)
		Chat:Send(args.player, "Voce aceitou o convite para morar na casa de "..tostring(convite.player) .."!", Color(255,255,200))
		Chat:Send(convite.player, tostring(convite.morador) .. " aceitou seu convite para morar em sua caasa!", Color(255,255,200))
	else
		Chat:Send(args.player, "Ninguem esta te convidando para morar em sua casa!", Color(255,0,0))
	end

	
end


function CasasServer:ConvidarMorador(args, player)

	local conviteArray = self:GetConviteMorador(args.player)
	
	if conviteArray then
		local convite = conviteArray.convite
		Chat:Send(player, "O jogador ".. tostring(args.morador) .. " ja esta sendo convidado para morar em uma casa! Aguarde!", Color(255,0,0))
		return
	end
	
	if self:GetCasa(args.morador:GetSteamId().id) then
	
		Chat:Send(player, "O jogador ".. tostring(args.morador) .. " ja e morador de uma casa!", Color(255,0,0))
		return
	end
	
	table.insert(self.convitesMorador, {player = player, morador = args.morador, tempo = 60})
	Chat:Send(args.morador, "O jogador ".. tostring(player) .. " esta te convidando para morar em sua casa! Digite '/casa aceitar' para aceitar!", Color(255,255,200))
	Chat:Send(player, "Seu convite para ".. tostring(args.morador) .. " para morar em sua casa foi enviado!", Color(255,255,200))

end


function CasasServer:AtualizarCasa(idCasa)

	local query = SQL:Query("SELECT pc.idPlayer, nome, nivelMorador, aluguel FROM PlayerCasa pc INNER JOIN Player p ON p.idPlayer = pc.idPlayer WHERE idCasa = ?")
	query:Bind(1, idCasa)	
	local moradores = query:Execute()

	self.casas[idCasa].moradores = moradores
	Network:Broadcast("AtualizarCasa", {casa = self.casas[idCasa]})
end


function CasasServer:StringToVector3(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end

end


function CasasServer:GetPlayerBySteamId(steamId)

	for player in Server:GetPlayers() do
		if player:GetSteamId().id == steamId then
			return player
		end
	end
	
	return false
end


function CasasServer:StringToAngle(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5]) and tonumber(v[7])) then
		return Angle(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]), tonumber(v[7]))
	else
		return nil
	end

end

casas = CasasServer()