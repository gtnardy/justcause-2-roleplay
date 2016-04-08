
class 'Concessionaria'

function Concessionaria:__init()
	
	self.anguloSpawn = Angle(-2.562964, 0, 0)
	self.posicaoConcessionaria = Vector3(-13422, 206, -4603)
	
	self.concessionarias = {}	
	self:AtualizarConcessionarias()
	
	self.worlds = {}
	self.veiculosConcessionaria = VeiculosConcessionaria()
	
	self.anguloSpawnVeiculo = Angle(-1.042352, 0, 0)
	self.posicaoVeiculos = Vector3(-13429, 206, -4601)

	Events:Subscribe("RemoverPlayerConcessionaria", self, self.RemoverPlayerConcessionaria)
	
	Events:Subscribe("PlayerEnterCheckpoint", self, self.PlayerEnterCheckpoint)
	Events:Subscribe("PlayerExitCheckpoint", self, self.PlayerExitCheckpoint)
	
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("PlayerQuit", self, self.PlayerQuit)
	
	Network:Subscribe("EntrouConcessionaria", self, self.EntrouConcessionaria)
	Network:Subscribe("FugiuConcessionaria", self, self.FugiuConcessionaria)
	Network:Subscribe("ComprarVeiculo", self, self.ComprarVeiculo)
	Network:Subscribe("ComprarVeiculoSeguro", self, self.ComprarVeiculoSeguro)

end	


function Concessionaria:RemoverPlayerConcessionaria(args)

	self:RemoverPlayer(args.player)

end


function Concessionaria:AtualizarConcessionarias()

	local query = SQL:Query("SELECT idLocal, posicao, tipo FROM Local l INNER JOIN LocalTipo lt ON l.tipo = lt.idLocalTipo WHERE checkpoint = 15")
	local result = query:Execute()
	for _, linha in ipairs(result) do
		self.concessionarias[tonumber(linha.idLocal)] = {tipo = tonumber(linha.tipo), posicao = self:StringToVector3(linha.posicao)}
	end
	
end


function Concessionaria:StringToVector3(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end
	
end


function Concessionaria:FugiuConcessionaria(args, player)

	Chat:Send(player, "Nao fuja da concessionaria! Pressione J para sair", Color(255,0,0))
	player:SetPosition(self.posicaoConcessionaria)

end


function Concessionaria:ComprarVeiculoSeguro(args)

	if args[1]:GetMoney() < args[2] then
		Chat:Send(args[1], "Voce nao tem dinheiro suficiente para este veiculo!", Color(255,0,0))
		return
	end

	local query = SQL:Query("SELECT count(*) AS 'count' FROM jcVeiculoUsuario WHERE idUsuario = ?")
	query:Bind(1, args[1]:GetSteamId().id)
	local result = query:Execute()
	if #result > 0 then
	
		totalVeiculos = tonumber(result[1].count)
		
	else
	
		Chat:Send(args[1], "Ocorreu um erro! #1", Color(255,0,0))
		return
	
	end
		
	local query = SQL:Query("SELECT vagasGaragem FROM jcCasa jcC INNER JOIN jcCasaUsuario jcCU ON jcC.idCasa = jcCU.idCasa WHERE idUsuario = ? AND nivelMorador = 0")
	query:Bind(1, args[1]:GetSteamId().id)
	local result = query:Execute()
	if #result > 0 then			
				
		vagasGaragem = tonumber(result[1].vagasGaragem)
		
		if totalVeiculos >= vagasGaragem then

			Chat:Send(args[1], "Sua garagem esta lotada! Remova algum veiculo!", Color(255,0,0))
			return					
				
		end
			
	else
		
		if totalVeiculos >= 1 then
			Chat:Send(args[1], "Voce so pode possuir 1 veiculo se nao tiver uma casa propria!", Color(255,0,0))
			return			
		end		
			
	end
	Network:Send(args[1], "Limpar")	
	self:EntrouConcessionaria({args[1], false})		
	args[1]:SetPosition(args[6])
	
	-- if totalVeiculos >= 1 then
		Chat:Send(args[1], "Voce comprou um veiculo com sucesso (R$ ".. args[2] ..")! Recomendamos tambem que voce coloque um rastreador em um Pay 'n' Spray antes de tudo!", Color(255,255,200))
		self:NovoVeiculoProprioNoBD(args[1], args[6] + Vector3(0,1,2), args[1]:GetAngle(), args[3], args[5], args[4], 0)
		Events:Fire("AtualizarVeiculoUsuario", args[1])		
	-- else

		-- self:NovoVeiculoProprioNoBD(args[1], args[6] + Vector3(0,2,2), args[1]:GetAngle(), args[3], args[5], args[4], 0)
		-- Events:Fire("AtualizarVeiculoUsuario", args[1])
		
		-- Chat:Send(args[1], "Voce comprou um veiculo com seguro com sucesso! (R$ ".. args[2] ..") Recomendamos que coloque um rastreador em um Pay 'n' Spray antes de tudo!", Color(255,255,200))
				
	-- end				
	args[1]:SetMoney(args[1]:GetMoney() - (args[2]) )


	
end


function Concessionaria:NovoVeiculoProprioNoBD(ply, pos, ang, modelId, cor, template, garagem)
		
	local command = SQL:Command("UPDATE jcVeiculoUsuario SET garagem = 1 WHERE idUsuario = ?")
	command:Bind(1, ply:GetSteamId().id)
	command:Execute()
		
	local command = SQL:Command("INSERT INTO jcVeiculoUsuario (idVeiculo, idUsuario, corx, cory, corz, localizador, vida, ang1, ang2, ang3, posx, posy, posz, garagem, template, liberado, placa) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ' ')")
	command:Bind(1, modelId)
	command:Bind(2, ply:GetSteamId().id)
	command:Bind(3, cor.r)
	command:Bind(4, cor.g)
	command:Bind(5, cor.b)
	command:Bind(6, 0)
	command:Bind(7, 1)
	command:Bind(8, ang.yaw)
	command:Bind(9, ang.pitch)
	command:Bind(10, ang.roll)
	command:Bind(11, pos.x)
	command:Bind(12, pos.y)
	command:Bind(13, pos.z)
	command:Bind(14, garagem)
	if template then
		command:Bind(15, template)
	end
	command:Execute()
		
end


function Concessionaria:ComprarVeiculo(args, player)

	args.player = player
	Events:Fire("ComprarVeiculo", args)

end


function Concessionaria:ModuleUnload()

	for _, array in pairs(self.worlds) do
	
		self:RemoverPlayer(array.player)
		
	end

end


function Concessionaria:PlayerQuit(args)

	self:RemoverPlayer(args.player)
	
end


function Concessionaria:RemoverPlayer(player)

	local worldArray = self.worlds[player:GetId()]
	if worldArray then
	
		if IsValid(worldArray.world) then
		
			worldArray.world:Remove()
			worldArray.player:SetWorld(DefaultWorld)
			worldArray.player:SetPosition(worldArray.ultimaPosicao)
			
			self.worlds[player:GetId()] = nil
		end
	end
		
	Network:Send(player, "EntrouConcessionaria", {boolean = false})

end


function Concessionaria:SpawnarVeiculo(spawnArgs)

	local veiculo = Vehicle.Create(spawnArgs)
	veiculo:SetDeathRemove(false) 
	veiculo:SetUnoccupiedRespawnTime(-1) 
	return veiculo

end


function Concessionaria:EntrouConcessionaria(args, player)

	if args.boolean then
		
		for idConcessionaria, concessionaria in pairs(self.concessionarias) do

			if Vector3.Distance(concessionaria.posicao, player:GetPosition()) <= 10 then
				local world = World.Create()
				world:SetTime(DefaultWorld:GetTime())
				self.worlds[player:GetId()] = {world = world, player = player, ultimaPosicao = concessionaria.posicao}
				player:SetPosition(self.posicaoConcessionaria)
				player:SetWorld(world)
				
				self:SpawnarVeiculosConcessionaria(world, concessionaria.tipo)
				Network:Send(player, "EntrouConcessionaria", {boolean = true})
				return
			end
		
		end
		Chat:Send(player, "Ocorreu um erro! Voce nao esta em uma concessionaria!", Color(255,0,0))
		
	else
	
		self:RemoverPlayer(player)

	end
	
end


function Concessionaria:SpawnarVeiculosConcessionaria(world, tipo)
	
	local veiculos = self.veiculosConcessionaria:GetVeiculosByConcessionaria(tipo)
	for i, arrayVeiculo in ipairs(veiculos) do
	
		local spawnArgs = {
			position = self.posicaoVeiculos + Vector3(i * 2.4, 0, i * 4.5),
			angle = self.anguloSpawnVeiculo,
			world = world,
			model_id = arrayVeiculo.id,
			template = arrayVeiculo.template,	
		}
		
		local veiculo = self:SpawnarVeiculo(spawnArgs)
	end

end


function Concessionaria:PlayerEnterCheckpoint(args)

	if args.checkpoint:GetType() == 15 then
		Network:Send(args.player, "EntrouCheckpoint", true)
	end

end


function Concessionaria:PlayerExitCheckpoint(args)

	if args.checkpoint:GetType() == 15 then
		Network:Send(args.player, "EntrouCheckpoint", false)	
	end
	
end


concessionaria = Concessionaria()