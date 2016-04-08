class 'AutoEscola'


function AutoEscola:__init()
	
	self.habilitacoes = {}
	self.habilitacoes[1] = {
	
		preco = 500,
		nome = "Carros",
		posicaoSpawn = Vector3(-13580.84, 205, -1134),
		anguloSpawn = Angle(-3.106465, 0, 0),
		veiculo = 29,
	}
	
	self.habilitacoes[2] = {
	
		preco = 700,
		nome = "Motos",
		posicaoSpawn = Vector3(-10030, 205, -2522),
		anguloSpawn = Angle(2.09, 0, 0),
		veiculo = 21,
	}
	
	self.habilitacoes[3] = {
	
		preco = 2000,
		nome = "Barco",
		posicaoSpawn =  Vector3(-5047, 200, 12249),
		anguloSpawn = Angle(0.633946, 0, 0),
		veiculo = 80,
	}	
	
	self.habilitacoes[4] = {
	
		preco = 1500,
		nome = "Caminhoes",
		posicaoSpawn =  Vector3(-8796, 240, 7527),
		anguloSpawn = Angle(-0.077035, -0.181024, 0),
		veiculo = 42,
	}	
	
	self.habilitacoes[5] = {
	
		preco = 3000,
		nome = "Helicopteros",
		posicaoSpawn = Vector3(-11496, 302, -773),
		anguloSpawn = Angle(0.717239, 0, 0),
		veiculo = 67,
	}	
	
	self.habilitacoes[6] = {
	
		preco = 4000,
		nome = "Avioes",
		posicaoSpawn = Vector3(850, 300, -4211),
		anguloSpawn = Angle(2.38, 0.2, 0),
		veiculo = 59,
	}
	
	
	Network:Subscribe("VeiculoNaoApareceu", self, self.VeiculoNaoApareceu)
	Network:Subscribe("FalhouTeste", self, self.FalhouTeste)
	Network:Subscribe("FazerTeste", self, self.FazerTeste)
	Network:Subscribe("CompletouTeste", self, self.CompletouTeste)
	Network:Subscribe("Comecei", self, self.Comecei)
	
	Events:Subscribe("PlayerEnterCheckpoint", self, self.PlayerEnterCheckpoint)
	Events:Subscribe("PlayerExitCheckpoint", self, self.PlayerExitCheckpoint)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)

end


function AutoEscola:ModuleUnload()

	for player in Server:GetPlayers() do
	
		player:SetNetworkValue("naAutoEscola", nil)
	end

end


function AutoEscola:Comecei(args)

	args:DisableCollision(CollisionGroup.Vehicle)
	if args:GetVehicle() then
		args:GetVehicle():SetInvulnerable(false)
	end

end


function AutoEscola:PlayerExitCheckpoint(args)

	if args.checkpoint:GetType() == 11 then

		Network:Send(args.player, "EntrouCheckpoint", false)

	end
	
end


function AutoEscola:PlayerEnterCheckpoint(args)

	if args.checkpoint:GetType() == 11 then

		Network:Send(args.player, "EntrouCheckpoint", true)

	end
end


function AutoEscola:RemoverVeiculo(v)
	
	-- if not tonumber(vId) then return end
	-- if IsValid(Vehicle.GetById(vId)) then
		-- Vehicle.GetById(vId):Remove()
	if type(v) == "number" then
		v = Vehicle.GetById(v)
	else
		if IsValid(v) then
			v:Remove()
		end
	end

end


function AutoEscola:CompletouTeste(args)
	
	if args.posicao then
	
		args.player:SetPosition(args.posicao)
	end
	
	local veiculo = args.veiculo
	if IsValid(veiculo) then
	
		vida = veiculo:GetHealth() 
	end
	
	self:RemoverVeiculo(args.veiculo)
	
	if vida < 0.7 then
		Chat:Send(args.player, "O veiculo ficou demasiadamente danificado! Voce falhou no teste!", Color(255,0,0))
		return
	end
	
	if self:PossuiHabilitacao(args.player, args.habilitacao) then

		Chat:Send(player,"Ops! Voce ja possue habilitacao para este tipo de veiculo!", Color(255,0,0))
		return
	end
	
	local command = SQL:Command("INSERT INTO PlayerHabilitacao (idPlayer, idHabilitacao, pontos) VALUES(?, ?, 0)")
	command:Bind(1, args.player:GetSteamId().id)
	command:Bind(2, args.habilitacao)
	command:Execute()

	Chat:Send(args.player, "Parabens! Agora voce possui habilitacao para ".. self.habilitacoes[args.habilitacao].nome .."!", Color(30,144,255))
	Events:Fire("TirouHabilitacao", args.player)
	Events:Fire("AgregarExp", {args.player, 300})
	
	args.player:SetNetworkValue("naAutoEscola", nil)
end


function AutoEscola:VeiculoNaoApareceu(args)

	self:RemoverVeiculo(args.veiculo)
	if args.posicao then
		args.player:SetPosition(args.posicao)
	end
	
	local valor = self.habilitacoes[args.idHabilitacao].preco
	if (valor) then
		args.player:SetMoney(args.player:GetMoney() + valor)
		Chat:Send(args.player, "Voce recebeu R$ ".. valor .." da autoescola!", Color(255,255,200))		
	end
	args.player:SetNetworkValue("naAutoEscola", nil)
end


function AutoEscola:FalhouTeste(args)

	self:RemoverVeiculo(args.veiculo)
	if args.posicao then
		args.player:SetPosition(args.posicao)
	end
	args.player:SetNetworkValue("naAutoEscola", nil)
end


function AutoEscola:PossuiHabilitacao(player, idHabilitacao)

	local query = SQL:Query("SELECT * FROM PlayerHabilitacao WHERE idPlayer = ? AND idHabilitacao = ?")
	query:Bind(1, player:GetSteamId().id)
	query:Bind(2, idHabilitacao)
	local result = query:Execute()
	if #result > 0 then

		return true
		
	end	
	return false
	
end


function AutoEscola:FazerTeste(args)

	if self:PossuiHabilitacao(args.player, args.habilitacao) then

		Chat:Send(player,"Ops! Voce ja possue habilitacao para este tipo de veiculo!", Color(255,0,0))
		return
	end
	
	args.player:SetMoney(args.player:GetMoney() - self.habilitacoes[args.habilitacao].preco)
	Chat:Send(args.player, "Voce pagou R$ ".. self.habilitacoes[args.habilitacao].preco .. " para fazer o teste!", Color(255,255,200))
	
	args.player:SetPosition(self.habilitacoes[args.habilitacao].posicaoSpawn)
	
	args.player:DisableCollision(CollisionGroup.Vehicle)
	
	local veiculo = self:SpawnVeiculo(self.habilitacoes[args.habilitacao].posicaoSpawn, self.habilitacoes[args.habilitacao].anguloSpawn, self.habilitacoes[args.habilitacao].veiculo)
	
	args.player:EnterVehicle(veiculo, VehicleSeat.Driver)
	
	Network:Send(args.player, "ComecarTeste", {veiculo = veiculo:GetId()})
	args.player:SetNetworkValue("naAutoEscola", true)
end


function AutoEscola:SpawnVeiculo(posicao, angulo, veiculo)

	local spawnArgs = {}
	
	spawnArgs.model_id = tonumber(veiculo)
	
	spawnArgs.position = posicao
	spawnArgs.invulnerable = true
	
	spawnArgs.angle = angulo
	spawnArgs.tone1 = Color(230,230,230)
	spawnArgs.tone2 = Color(230,230,230)
--	spawnArgs.template = "AutoEscola"

	
	local veiculo = Vehicle.Create(spawnArgs)
	veiculo:SetUnoccupiedRemove(true)
	
	return veiculo

end


ae = AutoEscola()