class 'NivelServer'

function NivelServer:__init()
	
	self.carreiras = {}
	self.categorias = {}
	self.experienciaNecessaria = ExperienciaNecessaria()
	
	Events:Subscribe("AdicionarExperienciaEmprego", self, self.AdicionarExperienciaEmprego)
	Events:Subscribe("AdicionarExperiencia", self, self.AdicionarExperiencia)
	
	self:AtualizarDados()
	
end


function NivelServer:AdicionarExperienciaEmprego(args)
	-- player, steamId*, idCategoria
	local steamId = args.steamId
	if IsValid(args.player) then
		steamId = args.player:GetSteamId().id
	end
	
	local experiencia = math.floor(args.experiencia)
	
	local idCarreira = tonumber(SQL:Query("SELECT idCarreira FROM Player WHERE idPlayer = "..steamId):Execute()[1].idCarreira)
	
	self:AdicionarExperienciaCarreira(steamId, experiencia, idCarreira, args.player)	
	self:AdicionarExperienciaCategoria(steamId, experiencia, args.idCategoria, args.player)	
	self:AdicionarExperienciaGlobal(steamId, experiencia, args.player)	

	
	if (IsValid(args.player)) then
		self:AtualizarPlayer(args.player)
		-- Categoria
		Events:Fire("AdicionarExperienciaHUD", {player = args.player, valor = experiencia, texto = string.upper(self:GetInfosCategoria(args.idCategoria).nome), cor = Color(66, 174, 255), naoAdicionar = true})
		-- Carreira
		Events:Fire("AdicionarExperienciaHUD", {player = args.player, valor = experiencia, texto = string.upper(self:GetInfosCarreira(idCarreira).nome), cor = Color(66, 174, 255), naoAdicionar = true})
		
		local texto = ""
		local cor = nil
		if args.texto then texto = args.texto end
		if args.cor then cor = args.cor end		
		-- Global
		Events:Fire("AdicionarExperienciaHUD", {player = args.player, valor = experiencia, texto = texto, cor = cor})		
		Events:Fire("AtualizarProgressoCarreiras", {player = args.player})
	end	
	
end


function NivelServer:AdicionarExperiencia(args)

	local steamId = args.steamId
	if IsValid(args.player) then
		steamId = args.player:GetSteamId().id
	end
	
	local experiencia = math.floor(args.experiencia)
	
	self:AdicionarExperienciaGlobal(steamId, experiencia, args.player)
	
	if (IsValid(args.player)) then
		self:AtualizarPlayer(args.player)
		
		local texto = ""
		local cor = nil
		if args.texto then texto = args.texto end
		if args.cor then cor = args.cor end		
		-- Global
		Events:Fire("AdicionarExperienciaHUD", {player = args.player, valor = experiencia, texto = texto, cor = cor})			
		Events:Fire("AtualizarProgressoCarreiras", {player = args.player})
	end
end


function NivelServer:AtualizarPlayer(player)

	local query = SQL:Query("SELECT nivel, experiencia FROM Player WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	
	player:SetNetworkValue("nivel", tonumber(result[1].nivel))
	player:SetNetworkValue("experiencia", tonumber(result[1].experiencia))

end


function NivelServer:AdicionarExperienciaCategoria(steamId, experienciaAdicionar, idCategoria, player)

	local query = SQL:Query("SELECT nivel, experiencia FROM PlayerCategoria WHERE idPlayer = ? AND idCategoria = ?")
	query:Bind(1, steamId)
	query:Bind(2, idCategoria)
	local result = query:Execute()
	
	local nivel = 0
	local experiencia = 0
	if (#result > 0) then
	
		nivel = tonumber(result[1].nivel)
		experiencia = tonumber(result[1].experiencia)
	else
		local command = SQL:Command("INSERT INTO PlayerCategoria (idPlayer, idCategoria, nivel, experiencia) VALUES(?, ?, ?, ?)")
		command:Bind(1, steamId)
		command:Bind(2, idCategoria)
		command:Bind(3, 0)
		command:Bind(4, 0)
		command:Execute()
	end

	local experienciaNecessaria = self.experienciaNecessaria:GetExperienciaNecessariaCategoria(idCategoria, nivel)
	
	if (experiencia + experienciaAdicionar >= experienciaNecessaria) then
		-- Upou
		local command = SQL:Command("UPDATE PlayerCategoria SET nivel = nivel + 1 WHERE idPlayer = ? AND idCategoria = ?")
		command:Bind(1, steamId)
		command:Bind(2, idCategoria)
		command:Execute()
		
		if (IsValid(player)) then
			Chat:Send(player, "Voce evoluiu um nivel na categoria: ".. self:GetInfosCategoria(idCategoria).nome.."!", Color(255,255,200))
		end
		
		local experienciaRestante = experiencia + experienciaAdicionar - experienciaNecessaria
		
		if experienciaRestante > 0 then
			self:AdicionarExperienciaCategoria(steamId, experienciaRestante, idCategoria, player)
		end
		
	else
		local command = SQL:Command("UPDATE PlayerCategoria SET experiencia = experiencia + ? WHERE idPlayer = ? AND idCategoria = ?")
		command:Bind(1, experienciaAdicionar)
		command:Bind(2, steamId)
		command:Bind(3, idCategoria)
		command:Execute()
		
		if (IsValid(player)) then
			Chat:Send(player, "Voce recebeu ".. experienciaAdicionar .." de experiencia na categoria: ".. self:GetInfosCategoria(idCategoria).nome .."!", Color(255,255,200))
		end		
	end
end


function NivelServer:AdicionarExperienciaCarreira(steamId, experienciaAdicionar, idCarreira, player)

	local query = SQL:Query("SELECT nivel, experiencia FROM PlayerCarreira WHERE idPlayer = ? AND idCarreira = ?")
	query:Bind(1, steamId)
	query:Bind(2, idCarreira)
	local result = query:Execute()
	
	local nivel = 0
	local experiencia = 0
	if (#result > 0) then
	
		nivel = tonumber(result[1].nivel)
		experiencia = tonumber(result[1].experiencia)
	else
		local command = SQL:Command("INSERT INTO PlayerCarreira (idPlayer, idCarreira, nivel, experiencia) VALUES(?, ?, ?, ?)")
		command:Bind(1, steamId)
		command:Bind(2, idCarreira)
		command:Bind(3, 0)
		command:Bind(4, 0)
		command:Execute()
	end

	local experienciaNecessaria = self.experienciaNecessaria:GetExperienciaNecessariaCarreira(idCarreira, nivel)
	
	if (experiencia + experienciaAdicionar >= experienciaNecessaria) then
		-- Upou
		local command = SQL:Command("UPDATE PlayerCarreira SET nivel = nivel + 1 WHERE idPlayer = ? AND idCarreira = ?")
		command:Bind(1, steamId)
		command:Bind(2, idCarreira)
		command:Execute()
		
		if (IsValid(player)) then
			Chat:Send(player, "Voce evoluiu um nivel na carreira: ".. self:GetInfosCarreira(idCarreira).nome.."!", Color(255,255,200))
		end
		
		local experienciaRestante = experiencia + experienciaAdicionar - experienciaNecessaria
		
		if experienciaRestante > 0 then
			self:AdicionarExperienciaCarreira(steamId, experienciaRestante, idCarreira, player)
		end
		
	else
		local command = SQL:Command("UPDATE PlayerCarreira SET experiencia = experiencia + ? WHERE idPlayer = ? AND idCarreira = ?")
		command:Bind(1, experienciaAdicionar)
		command:Bind(2, steamId)
		command:Bind(3, idCarreira)
		command:Execute()
		
		if (IsValid(player)) then
			Chat:Send(player, "Voce recebeu ".. experienciaAdicionar .." de experiencia na carreira: ".. self:GetInfosCarreira(idCarreira).nome .."!", Color(255,255,200))
		end		
	end
end


function NivelServer:AdicionarExperienciaGlobal(steamId, experienciaAdicionar, player)

	local query = SQL:Query("SELECT nivel, experiencia FROM Player WHERE idPlayer = ?")
	query:Bind(1, steamId)
	local result = query:Execute()
	
	local nivel = tonumber(result[1].nivel)
	local experiencia = tonumber(result[1].experiencia)
	
	local experienciaNecessaria = self.experienciaNecessaria:GetExperienciaNecessariaGlobal(nivel)
	
	if (experiencia + experienciaAdicionar >= experienciaNecessaria) then
		-- Upou
		local command = SQL:Command("UPDATE Player SET nivel = nivel + 1 WHERE idPlayer = ?")
		command:Bind(1, steamId)
		command:Execute()
		if (IsValid(player)) then
			Chat:Send(player, "Voce evoluiu um nivel!", Color(255,255,200))
		end
		local experienciaRestante = experiencia + experienciaAdicionar - experienciaNecessaria
		
		if experienciaRestante > 0 then
			self:AdicionarExperienciaGlobal(steamId, experienciaRestante, player)
		end
		
	else
		local command = SQL:Command("UPDATE Player SET experiencia = experiencia + ? WHERE idPlayer = ?")
		command:Bind(1, experienciaAdicionar)
		command:Bind(2, steamId)
		command:Execute()
		if (IsValid(player)) then
			Chat:Send(player, "Voce recebeu ".. experienciaAdicionar .." de experiencia!", Color(255,255,200))
		end		
	end

end


function NivelServer:GetInfosCarreira(idCarreira)

	if self.carreiras[idCarreira] then
		return self.carreiras[idCarreira]
	end
	
	return {nome = "Erro"}

end


function NivelServer:GetInfosCategoria(idCategoria)

	if self.categorias[idCategoria] then
		return self.categorias[idCategoria]
	end
	
	return {nome = "Erro"}

end


function NivelServer:AtualizarDados()

	self.carreiras = {}
	self.categorias = {}
	
	local query = SQL:Query("SELECT nome, idCarreira FROM Carreira")
	local result = query:Execute()
	for _, linha in ipairs(result) do
	
		self.carreiras[tonumber(linha.idCarreira)] = {nome = linha.nome}
	
	end
	
	local query = SQL:Query("SELECT nome, idCategoria FROM Categoria")
	local result = query:Execute()
	for _, linha in ipairs(result) do
	
		self.categorias[tonumber(linha.idCategoria)] = {nome = linha.nome}
	
	end

end


nivelServer = NivelServer()