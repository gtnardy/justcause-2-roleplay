class 'GerenciadorServer'

function GerenciadorServer:__init()

	self.quantidadesVestimentas = nil
	Events:Subscribe("QuantidadeVestimenta", self, self.QuantidadeVestimenta)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("AdicionarExperienciaHUD", self, self.AdicionarExperiencia)
	Events:Subscribe("AtualizarProgressoGeral", self, self.AtualizarProgressoGeral)
	Events:Subscribe("AtualizarProgressoCarreiras", self, self.AtualizarProgressoCarreiras)
	Events:Subscribe("AdicionarItem", self, self.AdicionarItem)
	

	Events:Fire("AtualizarPedidos")

	
	self.carreiras = nil
	self.locais = nil
	-- SQL:Execute("CREATE TABLE IF NOT EXISTS Local (idLocal INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, nome VARCHAR(30) NULL, posicao VARCHAR(50) NOT NULL, tipo INTEGER NOT NULL)")
	-- SQL:Execute("CREATE TABLE IF NOT EXISTS LocalTipo (idLocalTipo INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, descricao VARCHAR(40) NULL)")
	
	self:AtualizarDados()
end


function GerenciadorServer:QuantidadeVestimenta(args)

	self.quantidadesVestimentas = args

end


function GerenciadorServer:AdicionarExperiencia(args)

	Network:Send(args.player, "AdicionarExperiencia", args)
end


function GerenciadorServer:AdicionarItem(args)

	Network:Send(args.player, "AdicionarItem", args.item)
end


function GerenciadorServer:AtualizarDados()
	
	local query = SQL:Query("SELECT idLocal, nome, posicao, descricao, tipo FROM Local l INNER JOIN LocalTipo lt ON l.tipo = lt.idLocalTipo")
	self.locais = query:Execute()	
	
	local query = SQL:Query("SELECT idCarreira, nome, nivelMinimo FROM Carreira WHERE idCarreira > 0")
	self.carreiras = query:Execute()	
	
	for c, carreira in ipairs(self.carreiras) do
	
		local query = SQL:Query("SELECT idCategoria, nome, nivelMinimo FROM Categoria WHERE idCarreira = ?")
		query:Bind(1, carreira.idCarreira)
		carreira.categorias = query:Execute()
		
	end

	
end


function GerenciadorServer:ClientModuleLoad(args)
	
	Network:Send(args.player, "AtualizarLocais", self.locais)
	self:AtualizarProgressoPlayer(args.player)
end


function GerenciadorServer:AtualizarProgressoPlayer(player)

	local argsGeral = self:AtualizarProgressoGeral({player = player})
	local argsCarreiras = self:AtualizarProgressoCarreiras({player = player})
	
	Network:Send(player, "AtualizarProgresso", {geral = argsGeral, carreiras = argsCarreiras})

end


function GerenciadorServer:AtualizarProgressoGeral(arg, retorno)
	local player = arg.player
	local args = {}

	local query = SQL:Query("SELECT idHabilitacao FROM PlayerHabilitacao WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	args.habilitacoes = query:Execute()	
	args.quantidadesVestimentas = self.quantidadesVestimentas

	
	local query = SQL:Query("SELECT count(*) as 'count', tipo FROM PlayerVestimenta WHERE idPlayer = ? GROUP BY tipo ORDER BY tipo")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	
	args.vestimentas = {}
	
	if #result > 0 then
		for _, linha in ipairs(result) do
			args.vestimentas[tonumber(linha.tipo)] = tonumber(linha.count)
		end
	
	end
	
	if retorno then
		return args
	end
	Network:Send(player, "AtualizarProgresso", {geral = args})
end


function GerenciadorServer:AtualizarProgressoCarreiras(arg, retorno)
	local player = arg.player
	local args = {}
	
	args.carreiras = self.carreiras

	local query = SQL:Query("SELECT idHabilitacao FROM PlayerHabilitacao WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	args.habilitacoes = query:Execute()	
	args.quantidadesVestimentas = self.quantidadesVestimentas
	
	local query = SQL:Query("SELECT idCarreira, nivel, experiencia FROM PlayerCarreira WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	args.carreirasPlayer = query:Execute()
	
	local query = SQL:Query("SELECT idCategoria, nivel, experiencia FROM PlayerCategoria WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	args.categoriasPlayer = query:Execute()
	
	for c, categoria in ipairs(args.categoriasPlayer) do
	
		local query = SQL:Query("SELECT tipo, nivelMinimo, valor FROM CategoriaDesbloqueio WHERE idCategoria = ? ORDER BY nivelMinimo")
		query:Bind(1, categoria.idCategoria)
		categoria.desbloqueios = query:Execute()	
		
		local query = SQL:Query("SELECT nivelCategoria as 'nivelMinimo', nome FROM Mercadoria WHERE idCategoria = ? ORDER BY nivelCategoria")
		query:Bind(1, categoria.idCategoria)
		categoria.mercadorias = query:Execute()
	
	end

	
	--args.categoriasPlayer = query:Execute()
	
	if retorno then
		return args
	end
	Network:Send(player, "AtualizarProgresso", {carreiras = args})

end


gerenciadorServer = GerenciadorServer()