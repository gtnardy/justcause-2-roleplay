class 'PlayerEssentialsServer'

function PlayerEssentialsServer:__init()
	
	self.mortos = {}
	self.hospitais = {}
	
	Events:Subscribe("PlayerDead", self, self.PlayerDead)
	Events:Subscribe("PlayerSpawn", self, self.PlayerSpawn)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	Events:Subscribe("PlayerQuit", self, self.PlayerQuit)
	Events:Subscribe("PlayerMoneyChange", self, self.PlayerMoneyChange)
	
	Events:Subscribe("LocalSetado", self, self.ModuleLoad)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	

end


function PlayerEssentialsServer:ModuleLoad()

	local query = SQL:Query("SELECT posicao FROM Local WHERE tipo = 12")
	local result = query:Execute()
	if (#result > 0) then

		for i, linha in ipairs(result) do
			
			table.insert(self.hospitais, self:StringToVector3(linha.posicao))
			
		end
	end
end


function PlayerEssentialsServer:ModuleUnload()

	for player in Server:GetPlayers() do
	
		self:PlayerQuit({player = player})
	
	end

end


function PlayerEssentialsServer:PlayerDead(args)

	table.insert(self.mortos, {player = args.player, posicao = args.player:GetPosition()})

end


function PlayerEssentialsServer:PlayerSpawn(args)

	for i, array in ipairs(self.mortos) do
	
		if array.player == args.player then
		
			local posHospital = self:HospitalMaisProximo(array.posicao)
			args.player:SetPosition(posHospital)
			return false
		end
	end
	
	local query = SQL:Query("SELECT ultimaPosicao FROM Player WHERE idPlayer = ?")
	query:Bind(1, args.player:GetSteamId().id)
	local result = query:Execute()
	if (#result > 0) then

		local vec = self:StringToVector3(tostring(result[1].ultimaPosicao))
		if (vec) then
			args.player:SetPosition(vec)
			return false
		end
		
	end
	
end


function PlayerEssentialsServer:HospitalMaisProximo(pos)

	local hospitalMaisPerto = nil
	
	for i, vec in ipairs(self.hospitais) do
		
		if (not hospitalMaisPerto) then
		
			hospitalMaisPerto = {posicao = vec, distancia = Vector3.Distance(pos, vec)}
		end
			
		local posHospital = vec
		local distancia = Vector3.Distance(pos, vec)
		
		if (distancia < hospitalMaisPerto.distancia) then
		
			hospitalMaisPerto = {posicao = posHospital, distancia = distancia}
		end
		
	end
	
	return hospitalMaisPerto.posicao
end


function PlayerEssentialsServer:PlayerJoin(args)

	local result = self:AtualizarJogador(args.player)

	if (#result > 0) then
	
		if (result[1].nome != args.player:GetName()) then
		
			Chat:Broadcast(result[1].nome .. " entrou no servidor e alterou seu nome para ".. tostring(args.player) .."!", Color(255,255,255))
			
		else
			Chat:Broadcast(tostring(args.player) .. " entrou no servidor!", Color(255,255,255))
		end

	else
		Chat:Broadcast(tostring(args.player) .. " entrou no servidor pela primeira vez!", Color(255,255,255))
		self:NovoPlayer(args.player)
		self:AtualizarJogador(args.player)
	end
	
end


function PlayerEssentialsServer:AtualizarJogador(player)

	local query = SQL:Query("SELECT nome, nivelUsuario, dinheiro, nivel, experiencia, idCarreira, ultimaPosicao FROM Player WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	if (#result > 0) then
	
		player:SetMoney(tonumber(result[1].dinheiro))
		player:SetNetworkValue("nivelUsuario", tonumber(result[1].nivelUsuario))
		player:SetNetworkValue("nivel", tonumber(result[1].nivel))
		player:SetNetworkValue("experiencia", tonumber(result[1].experiencia))
		player:SetNetworkValue("idCarreira", tonumber(result[1].idCarreira))
		
		local vec = self:StringToVector3(tostring(result[1].ultimaPosicao))
		if (vec) then
			player:SetPosition(vec)
		end

		
	end
	return result
end


function PlayerEssentialsServer:StringToVector3(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end

end


function PlayerEssentialsServer:PlayerQuit(args)
	
	local command = SQL:Command("UPDATE Player SET ultimaPosicao = ?, ultimoLogin = date('now') WHERE idPlayer = ?")
	command:Bind(1, tostring(args.player:GetPosition()))
	command:Bind(2, args.player:GetSteamId().id)
	command:Execute()
	Chat:Broadcast(tostring(args.player) .. " saiu do servidor!", Color(255,255,255))
	
	for i, array in ipairs(self.mortos) do
	
		if array.player == args.player then
		
			table.remove(self.mortos, i)
			return
		end
	end
	
end


function PlayerEssentialsServer:NovoPlayer(player)
	
	local command = SQL:Command("INSERT INTO Player (idPlayer, nome, nivel, experiencia, horasJogadas, dinheiro, dinheiroBanco, idioma, nivelUsuario, idCarreira, gasolina, fome, sede) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, player:GetName())
	command:Bind(3, 1)
	command:Bind(4, 0)
	command:Bind(5, 0)
	command:Bind(6, 300)
	command:Bind(7, 0)
	command:Bind(8, 1)
	command:Bind(9, 0)
	command:Bind(10, 0)
	command:Bind(11, 60)
	command:Bind(12, 90)
	command:Bind(13, 90)
	command:Execute()
	
	local command = SQL:Command("INSERT INTO PlayerVestimenta (idPlayer, idVestimenta, tipo, ativo) VALUES(?, ?, ?, ?)")
	command:Bind(1, player:GetSteamId().id)
	command:Bind(2, 21)
	command:Bind(3, 1)
	command:Bind(4, 1)
	command:Execute()
end


function PlayerEssentialsServer:PlayerMoneyChange(args)
	
	local command = SQL:Command("UPDATE Player SET dinheiro = ? WHERE idPlayer = ?")
	command:Bind(1, math.floor(args.new_money))
	command:Bind(2, args.player:GetSteamId().id)
	command:Execute()

end

playerEssentialsServer = PlayerEssentialsServer()