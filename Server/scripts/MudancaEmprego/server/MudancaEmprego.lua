
class 'MudancaEmprego'

function MudancaEmprego:__init()

	-- Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
	-- Events:Subscribe("ModulesLoad", self, self.ModulesLoad)
	-- Events:Subscribe("PlayerExitCheckpoint", self, self.PlayerExitCheckpoint)
	-- Events:Subscribe("PlayerEnterCheckpoint", self, self.PlayerEnterCheckpoint)
	Network:Subscribe("MudarCarreira", self, self.MudarCarreira)
	Events:Subscribe("MudarCarreira", self, self.MudarCarreira)
	Events:Subscribe("ConfirmadoMudancaCarreira", self, self.ConfirmadoMudancaCarreira)
	Network:Subscribe("ConfirmadoMudancaCarreira", self, self.ConfirmadoMudancaCarreira)
	Network:Subscribe("ConfirmadoSpawnarCarreira", self, self.ConfirmadoSpawnarCarreira)
	
	self.checkpoints = nil
	
end


function MudancaEmprego:ModulesLoad(args)
	
	if self.checkpoints then return end
	
	local query = SQL:Query("SELECT posx, posy, posz, tipoUtilitario, Descricao as 'descricao' FROM jcUtilitarios jcU INNER JOIN jcTipoUtilitario jcTU ON jcU.tipoUtilitario = jcTU.idTipoUtilitario WHERE tipoCheckpoint = 6")	
	local result = query:Execute()
	if #result > 0 then
			
		self.checkpoints = result
		
	end
	
	for player in Server:GetPlayers() do
		self:AtualizarPlayer(player)
	end

end


function MudancaEmprego:PlayerExitCheckpoint(args)

	 if args.checkpoint:GetType() == 6 then
	 
		Network:Send(args.player, "EntrouAgencia", false)
	 end

end


function MudancaEmprego:PlayerJoin(args)

	self:AtualizarPlayer(args.player)
	
end


function MudancaEmprego:AtualizarPlayer(args)

	Network:Send(args, "AtualizarDados", self.checkpoints)
	
end


function MudancaEmprego:PlayerEnterCheckpoint(args)

	 if args.checkpoint:GetType() == 6 then
		
		Network:Send(args.player, "EntrouAgencia", true)
	 end

end


function MudancaEmprego:ConfirmadoSpawnarCarreira(args, player)

	local query = SQL:Query("SELECT posicaoSpawn FROM Carreira c INNER JOIN Player p ON p.idCarreira = c.idCarreira WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	if #result == 0 then
	
		Chat:Send(player, "Ocorreu um erro! Uma equipe de macacos treinados estao sendo enviados a sua casa para resolver o problema!", Color(255,0,0))
		return
	end
	
	local pos = self:StringToVector(result[1].posicaoSpawn)
	
	player:SetPosition(pos + Vector3(0,1,0))
	
end


function MudancaEmprego:ConfirmadoMudancaCarreira(args)
	
	local steamId = args.player
	if IsValid(args.player) then
		steamId = args.player:GetSteamId().id
	end
	local command = SQL:Command("UPDATE Player SET idCarreira = ? WHERE idPlayer = ?")
	command:Bind(1, args.idCarreira)
	command:Bind(2, steamId)
	command:Execute()
	
	local query = SQL:Query("SELECT * FROM PlayerCarreira WHERE idPlayer = ? AND idCarreira = ?")
	query:Bind(1, steamId)
	query:Bind(2, args.idCarreira)
	if #query:Execute() == 0 then
		
		local command = SQL:Command("INSERT INTO PlayerCarreira (idPlayer, idCarreira, nivel, experiencia) VALUES(?, ?, ?, ?)")
		command:Bind(1, steamId)
		command:Bind(2, args.idCarreira)
		command:Bind(3, 0)
		command:Bind(4, 0)
		command:Execute()
	
	end
	
	local query = SQL:Query("SELECT cor FROM Carreira WHERE idCarreira = ?")
	query:Bind(1, args.idCarreira)
	local cor = self:StringToColor(query:Execute()[1].cor)
	
	
	
	local query = SQL:Query("SELECT idCategoria FROM Categoria WHERE idCarreira = ? AND nivelMinimo = 0")
	query:Bind(1, args.idCarreira)
	local result = query:Execute()
	
	if #result > 0 then
	
		for i, result in ipairs(result) do
		
			local query = SQL:Query("SELECT * FROM PlayerCategoria WHERE idPlayer = ? AND idCategoria = ?")
			query:Bind(1, steamId)
			query:Bind(2, result.idCategoria)
			if #query:Execute() == 0 then
			
				local command = SQL:Command("INSERT INTO PlayerCategoria (idPlayer, idCategoria, nivel, experiencia) VALUES(?,?,?,?)")
				command:Bind(1, steamId)
				command:Bind(2, result.idCategoria)
				command:Bind(3, 0)
				command:Bind(4, 0)
				command:Execute()
			end
		end
	end

	if IsValid(args.player) then
	
		args.player:SetColor(cor)	
	
		Chat:Send(args.player, "Parabens! Agora voce esta na carreira ".. args.nomeCarreira .."!", Color(255,255,200))
		
		if args.idCarreira != 4 and args.idCarreira != 5 then
			Chat:Send(args.player, "Pressione P para ver os servicos disponiveis!", Color(255,255,200))
		end
		Chat:Send(args.player, "Pressione Y para ver seu progresso!", Color(255,255,200))
		args.player:SetNetworkValue("idCarreira", args.idCarreira)
		Events:Fire("MudouCarreira", {player = args.player, idCarreira = args.idCarreira})
	end
		

end


function MudancaEmprego:MudarCarreira(args)

	local nivelMinCarreira = self:NivelMinimoCarreira(args.idCarreira)
	local nivelUsuario = args.player:GetValue("nivel")
	
	if nivelUsuario < nivelMinCarreira  then
		Chat:Send(args.player, "Voce nao possui o nivel minimo para entrar nessa carreira: ".. nivelMinCarreira..".", Color(255,0,0))
		return
	end
	
	Network:Send(args.player, "ConfirmarMudancaCarreira", {id = args.idCarreira, nome = self:NomeCarreira(args.idCarreira)})

end


function MudancaEmprego:NivelMinimoCarreira(idC)

	local query = SQL:Query("SELECT nivelMinimo FROM Carreira WHERE idCarreira = ?")
	query:Bind(1, idC)
	local result = query:Execute()
	if #result > 0 then
	
		return tonumber(result[1].nivelMinimo)
		
	end

end


function MudancaEmprego:NomeCarreira(idC)

	local query = SQL:Query("SELECT nome FROM Carreira WHERE idCarreira = ?")
	query:Bind(1, idC)
	local result = query:Execute()
	if #result > 0 then
	
		return result[1].nome
		
	end
	
end


function MudancaEmprego:NivelUsuarioCarreira(ply, idC)

	local query = SQL:Query("SELECT nivel FROM jcCarreiraUsuario WHERE idUsuario = ? AND idCarreira = ?")
	query:Bind(1, ply:GetSteamId().id)
	query:Bind(2, idC)
	local result = query:Execute()
	if #result > 0 then
	
		return tonumber(result[1].nivel)
	else
	
		return 0
	end

end


function MudancaEmprego:StringToVector(str)

	local retorno = string.gsub(str, " ", "")
	retorno = retorno:split(",")
	
	if #retorno != 3 then
		return false
	end
	
	return Vector3(tonumber(retorno[1]), tonumber(retorno[2]), tonumber(retorno[3]))
	
end


function MudancaEmprego:StringToColor(str)

	local retorno = string.gsub(str, " ", "")
	retorno = retorno:split(",")
	
	if #retorno != 3 then
		return false
	end
	
	return Color(tonumber(retorno[1]), tonumber(retorno[2]), tonumber(retorno[3]))
	
end


MudancaEmprego = MudancaEmprego()