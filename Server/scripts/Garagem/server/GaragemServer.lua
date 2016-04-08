class 'GaragemServer'

function GaragemServer:__init()
	
	self.posicaoGaragem = Vector3(-12048,203,-5348)
	self.posicaoVeiculosGaragem = Vector3(-12048, 203, -5364)
	self.anguloVeiculosGaragem = Angle(-2.120992, -0, 0)
	
	-- veiculo
	self.veiculos = {}
	self.playerColisao = {}
	
	self.mundosGaragem = {}
	
	self.timer = Timer()
	
	Events:Subscribe("PostTick", self, self.PostTick)
	
	Events:Subscribe("AtualizarVeiculo", self, self.AtualizarVeiculo)
	
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Events:Subscribe("PlayerQuit", self, self.PlayerQuit)
	
	Events:Subscribe("EntrarGaragem", self, self.EntrarGaragem)
	Network:Subscribe("EntrarGaragem", self, self.EntrarGaragem)
	
	Events:Subscribe("AlterarPlaca", self, self.AlterarPlaca)
	Events:Subscribe("ComprarBuzina", self, self.ComprarBuzina)
	Events:Subscribe("ComprarHidraulica", self, self.ComprarHidraulica)
	
	Events:Subscribe("ComprarVeiculo", self, self.ComprarVeiculo)
	Events:Subscribe("VenderVeiculo", self, self.VenderVeiculo)
	Events:Subscribe("RepararEstrutura", self, self.RepararEstrutura)
	
	Events:Subscribe("VisualizarModificacaoVeiculo", self, self.VisualizarModificacaoVeiculo)
	Events:Subscribe("ComprarModificacaoVeiculo", self, self.ComprarModificacaoVeiculo)
	Events:Subscribe("ComprarPinturaVeiculo", self, self.ComprarPinturaVeiculo)
	Events:Subscribe("ComprarNeonVeiculo", self, self.ComprarNeonVeiculo)
	
	Network:Subscribe("TrancarVeiculoGaragem", self, self.TrancarVeiculoGaragem)
	Network:Subscribe("LiberarVeiculoGaragem", self, self.LiberarVeiculoGaragem)
	Network:Subscribe("DirigirVeiculoGaragem", self, self.DirigirVeiculoGaragem)
	
	Network:Subscribe("FugiuGaragem", self, self.FugiuGaragem)
	
	Network:Subscribe("AtivarBuzina", self, self.AtivarBuzina)
	Network:Subscribe("AtivarHidraulica", self, self.AtivarHidraulica)
	
	Events:Subscribe("MudouCasa", self, self.MudouCasa)
	Network:Subscribe("EjetarVeiculo", self, self.EjetarVeiculo)

end


function GaragemServer:EjetarVeiculo(args, player)
	player:SetPosition(player:GetPosition() + Vector3(1, 1, 0))
end


function GaragemServer:AlterarPlaca(args)

	local veiculo = args.player:GetVehicle()
	if veiculo then
	
		local dados = self.veiculos[veiculo:GetId()]
		
		if dados and dados.idDono == args.player:GetSteamId().id then
		
			if self:PossuiDinheiro(args.player, args.preco) then
				
				local command = SQL:Command("UPDATE PlayerVeiculo SET placa = ? WHERE idPlayer = ? AND idPlayerVeiculo = ?")
				command:Bind(1, args.texto)
				command:Bind(2, args.player:GetSteamId().id)
				command:Bind(3, dados.idPlayerVeiculo)
				command:Execute()		
				
				args.player:SetMoney(args.player:GetMoney() - args.preco)
				Chat:Send(args.player, "Voce alterou a placa de seu veiculo!", Color(255,255,200))
			end
		else
			Chat:Send(args.player, "Voce so pode fazer modificacoes em um veiculo proprio!", Color(255,0,0))
			return
		end
		
	end
	
end


function GaragemServer:ComprarBuzina(args)

	local veiculo = args.player:GetVehicle()
	if veiculo then
	
		local dados = self.veiculos[veiculo:GetId()]
		
		if dados and dados.idDono == args.player:GetSteamId().id then
		
			if self:PossuiDinheiro(args.player, args.preco) then
			
				local str = ""
				if args.bank_id and args.sound_id then
					str = args.bank_id .. ", " .. args.sound_id
				end
				
				local command = SQL:Command("UPDATE PlayerVeiculo SET buzina = ? WHERE idPlayer = ? AND idPlayerVeiculo = ?")
				command:Bind(1, str)
				command:Bind(2, args.player:GetSteamId().id)
				command:Bind(3, dados.idPlayerVeiculo)
				command:Execute()		
				
				args.player:SetMoney(args.player:GetMoney() - args.preco)
				Chat:Send(args.player, "Voce instalou a buzina em seu veiculo!", Color(255,255,200))
			end
		else
			Chat:Send(args.player, "Voce so pode fazer modificacoes em um veiculo proprio!", Color(255,0,0))
			return
		end
		
	end

end


function GaragemServer:ComprarHidraulica(args)

	local veiculo = args.player:GetVehicle()
	if veiculo then
	
		local dados = self.veiculos[veiculo:GetId()]
		
		if dados and dados.idDono == args.player:GetSteamId().id then
			if args.hidraulica == 1 then
			
				if self:PossuiDinheiro(args.player, args.preco) then
				
					args.player:SetMoney(args.player:GetMoney() - args.preco)
					Chat:Send(args.player, "Voce instalou Hidraulica em seu veiculo! Pressione Shift ou Setas para ativa-la!", Color(255,255,200))
	
				end
			else
				Chat:Send(args.player, "Voce desinstalou a Hidraulica de seu veiculo!", Color(255,255,200))
			end
		else
			Chat:Send(args.player, "Voce so pode fazer modificacoes em um veiculo proprio!", Color(255,0,0))
			return
		end
		
		local command = SQL:Command("UPDATE PlayerVeiculo SET hidraulica = ? WHERE idPlayer = ? AND idPlayerVeiculo = ?")
		command:Bind(1, args.hidraulica)
		command:Bind(2, args.player:GetSteamId().id)
		command:Bind(3, dados.idPlayerVeiculo)
		command:Execute()			
		
	end

end


function GaragemServer:AtivarBuzina(args, player)

	Network:SendNearby(player, "AtivarBuzina", args)

end


function GaragemServer:AtivarHidraulica(args, player)

	local veiculo = player:GetVehicle()
	if IsValid(veiculo) then
	
		if args and args.x and args.z then
		
			local angVel = veiculo:GetAngularVelocity()
			veiculo:SetAngularVelocity(angVel + (veiculo:GetAngle() * Vector3(args.x, 0, args.z)))
		else
			veiculo:SetLinearVelocity(veiculo:GetLinearVelocity() + Vector3(0, 4, 0))
		end

	end

end


function GaragemServer:ComprarVeiculo(args)

	local casa = self:GetPlayerCasa(args.player)
	local vagasGaragem = 1
	
	if casa then
		vagasGaragem = tonumber(casa.vagasGaragem)
	end
	
	local query = SQL:Query("SELECT count(*) AS 'count' FROM PlayerVeiculo WHERE idPlayer = ?")
	query:Bind(1, args.player:GetSteamId().id)
	local quantidadeVeiculos = tonumber(query:Execute()[1].count)
	
	if quantidadeVeiculos >= vagasGaragem then
		Chat:Send(args.player, "Voce nao pode ter mais veiculos! Compre uma casa maior ou venda um veiculo!", Color(255,0,0))
		return
	end
	
	if args.player:GetMoney() < args.preco then
		Chat:Send(args.player, "Voce nao tem dinheiro suficiente para comprar esse veiculo!", Color(255,0,0))
		return
	end
	
	Events:Fire("RemoverPlayerConcessionaria", {player = args.player})

	local cor = "50, 50, 50"
	local template = tostring(args.template)
	
	local command = SQL:Command("UPDATE PlayerVeiculo SET naGaragem = 1 WHERE idPlayer = ?")
	command:Bind(1, args.player:GetSteamId().id)
	command:Execute()
	
	local command = SQL:Command("INSERT INTO PlayerVeiculo (idPlayer, idVeiculo, cor1, cor2, ultimaPosicao, ultimoAngulo, trancado, liberado, naGaragem, vida, template, placa, hidraulica, buzina) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
	command:Bind(1, args.player:GetSteamId().id)
	command:Bind(2, args.model_id)
	command:Bind(3, cor)
	command:Bind(4, cor)
	command:Bind(5, tostring(args.player:GetPosition()))
	command:Bind(6, tostring(args.player:GetAngle()))
	command:Bind(7, 1)
	command:Bind(8, 1)
	command:Bind(9, 0)
	command:Bind(10, 1)
	command:Bind(11, template)
	command:Bind(12, "Veiculo de "..tostring(args.player))
	command:Bind(13, 0)
	command:Bind(14, 0)
	command:Execute()

	self:AtualizarVeiculoPlayer(args.player)
	Chat:Send(args.player, "Voce comprou um veiculo novo com sucesso! (R$ ".. args.preco ..")!", Color(255,255,200))

	args.player:SetMoney(args.player:GetMoney() - args.preco)
	
end


function GaragemServer:VenderVeiculo(args)

	local veiculo = args.player:GetVehicle()
	if veiculo then
		local dados = self.veiculos[veiculo:GetId()]
		if dados and dados.idDono == args.player:GetSteamId().id then

		else
			Chat:Send(args.player, "Voce nao pode vender um veiculo que nao te pertence", Color(255,0,0))
		end
	end	
end


function GaragemServer:RepararEstrutura(args)

	local veiculo = args.veiculo
	
	local novoVeiculo = self:RespawnarVeiculo(veiculo)
			
	Chat:Send(args.player, "Seu veiculo foi restaurado!", Color(255,255,200))
	args.player:SetMoney(args.player:GetMoney() - args.preco)	
end


function GaragemServer:VisualizarModificacaoVeiculo(args)
	
	local veiculo = args.player:GetVehicle()
	if veiculo then
	
		local dados = self.veiculos[veiculo:GetId()]
		if dados then 

			if veiculo:GetTemplate() != args.template then
				self:RespawnarVeiculo(veiculo, args.template)
			end

		end		
		
	end

end

function GaragemServer:RespawnarVeiculo(veiculo, template)

	local motorista = veiculo:GetDriver()
	
	local tone1, tone2 = veiculo:GetColors()
	local position = veiculo:GetPosition()
	local angle = veiculo:GetAngle()
	local health = veiculo:GetHealth()
	local template = template
	
	if not template then
		template = veiculo:GetTemplate()
	end
	
	veiculo:Respawn()
	local argsVeiculo = {
	
		position = veiculo:GetPosition(),
		angle = veiculo:GetAngle(),
		model_id = veiculo:GetModelId(),
		world = veiculo:GetWorld(),
		tone1 = tone1,
		tone2 = tone2,
		health = health,
		decal = veiculo:GetDecal(),
		template = template,
	}
	
	local novoVeiculo = self:SpawnarVeiculo(argsVeiculo)
	novoVeiculo:SetAngle(angle)
	novoVeiculo:SetPosition(position)
	if motorista then
		motorista:EnterVehicle(novoVeiculo, 0)
	end
	
	Events:Fire("TrocouVeiculo", {antigo = veiculo:GetId(), novo = novoVeiculo:GetId()})
	local dados = self.veiculos[veiculo:GetId()]
	if dados then
		self:RemoverVeiculoById(veiculo:GetId())
		self:NovoVeiculo(dados.idPlayerVeiculo, novoVeiculo, dados.idDono, dados.motorista, dados.utensilhos)
	else
		veiculo:Remove()
	end
	
	return novoVeiculo
	
end


function GaragemServer:ComprarModificacaoVeiculo(args)

	local veiculo = args.player:GetVehicle()
	if veiculo then
	
		if self:PossuiDinheiro(args.player, args.preco) then
		
			local dados = self.veiculos[veiculo:GetId()]
			if dados then
				if dados.idDono != args.player:GetSteamId().id then
					Chat:Send(args.player, "Voce nao pode fazer modificacoes em um veiculo que nao te pertence!", Color(255,0,0))
					return
				end

				local command = SQL:Command("UPDATE PlayerVeiculo SET template = ? WHERE idPlayer = ? AND idPlayerVeiculo = ?")
				command:Bind(1, tostring(args.template))
				command:Bind(2, args.player:GetSteamId().id)
				command:Bind(3, dados.idPlayerVeiculo)
				command:Execute()		
	

			end	
			
			args.player:SetMoney(args.player:GetMoney() - args.preco)
			Chat:Send(args.player, "Seu veiculo foi modificado!", Color(255,255,200))			
			self:RespawnarVeiculo(veiculo, args.template)
		end
	end
	
end


function GaragemServer:ComprarPinturaVeiculo(args)

	local veiculo = args.player:GetVehicle()
	if veiculo then
	
		if self:PossuiDinheiro(args.player, args.preco) then
		
			local dados = self.veiculos[veiculo:GetId()]
			if dados then
				
				if dados.idDono != args.player:GetSteamId().id then
					Chat:Send(args.player, "Voce nao pode fazer modificacoes em um veiculo de outra pessoa!", Color(255,0,0))
					return
				end

				local command = SQL:Command("UPDATE PlayerVeiculo SET cor1 = ?, cor2 = ? WHERE idPlayer = ? AND idPlayerVeiculo = ?")
				command:Bind(1, tostring(args.cor1))
				command:Bind(2, tostring(args.cor2))
				command:Bind(3, args.player:GetSteamId().id)
				command:Bind(4, dados.idPlayerVeiculo)
				command:Execute()

			end
		
			args.player:SetMoney(args.player:GetMoney() - args.preco)
			veiculo:SetColors(args.cor1, args.cor2)
			Chat:Send(args.player, "A cor de seu veiculo foi alterada!", Color(255,255,200))
		end
	end
	
end


function GaragemServer:ComprarNeonVeiculo(args)

	local veiculo = args.player:GetVehicle()
	if veiculo then
	
		if self:PossuiDinheiro(args.player, args.preco) then
		
			local dados = self.veiculos[veiculo:GetId()]
			if dados and dados.idDono == args.player:GetSteamId().id then

				local command = SQL:Command("UPDATE PlayerVeiculo SET corNeon = ? WHERE idPlayer = ? AND idPlayerVeiculo = ?")
				command:Bind(1, tostring(args.cor))
				command:Bind(2, args.player:GetSteamId().id)
				command:Bind(3, dados.idPlayerVeiculo)
				command:Execute()		
				
				--self.veiculos[veiculo:GetId()].utensilhos.corNeon = args.cor
				args.player:SetMoney(args.player:GetMoney() - args.preco)
				Chat:Send(args.player, "A cor do Neon de seu veiculo foi alterada!", Color(255,255,200))
			else
				Chat:Send(args.player, "Voce so pode fazer modificacoes em um veiculo proprio!", Color(255,0,0))
			end

		end
	end
	
end


function GaragemServer:PostTick()

	if self.timer:GetSeconds() >= 1 then
	
		for _, array in pairs(self.playerColisao) do
		
			array.tempo = array.tempo - 1
			if array.tempo <= 0 then
			
				if IsValid(array.player) then
					array.player:EnableCollision(CollisionGroup.Vehicle)
					self.playerColisao[_] = nil
				end
			end

		end
		self.timer:Restart()
	end

end


function GaragemServer:AtualizarVeiculo(args)
	
	if not args.veiculo then return end
	
	local dados = self.veiculos[args.veiculo:GetId()]
	if dados then
		
		if dados.idPlayerVeiculo then
		
			local veiculo = self:GetPlayerVeiculo(dados.idPlayerVeiculo)
			dados.veiculo:SetColors(veiculo.argsVeiculo.tone1, veiculo.argsVeiculo.tone2)
			dados.utensilhos = veiculo.utensilhos

			if tostring(veiculo.argsVeiculo.template) != tostring(dados.veiculo:GetTemplate()) then
			
				local novoVeiculo = self:RespawnarVeiculo(dados.veiculo, tostring(veiculo.argsVeiculo.template))

			end
		end
		
		Network:Broadcast("AtualizarVeiculo", {id = args.veiculo:GetId(), veiculo = dados})
		return
	end
	
	Network:Broadcast("AtualizarVeiculo", {id = args.veiculo:GetId(), veiculo = nil})
end


function GaragemServer:PlayerQuit(args)

	self:RemoverVeiculo(args.player)

end


function GaragemServer:ModuleUnload(args)
	
	for _, array in pairs(self.veiculos) do

		self:RemoverVeiculo(array.motorista)

	end	

	for _, array in pairs(self.playerColisao) do
	
		array.player:EnableCollision(CollisionGroup.Vehicle)

	end
	
end


function GaragemServer:MudouCasa(args)
	
	self:AtualizarPlayer(args.player, false)
	
end


function GaragemServer:ClientModuleLoad(args)
	
	self:AtualizarPlayer(args.player, true)
	self:AtualizarVeiculoPlayer(args.player)
	
end


function GaragemServer:AtualizarVeiculoPlayer(player)

	self:RemoverVeiculo(player)
	
	local query = SQL:Query("SELECT idPlayerVeiculo FROM PlayerVeiculo WHERE idPlayer = ? AND naGaragem = 0")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	if #result > 0 then
		
		local idPlayerVeiculo = tonumber(result[1].idPlayerVeiculo)
		
		local array = self:GetPlayerVeiculo(idPlayerVeiculo)
		local veiculo = self:SpawnarVeiculo(array.argsVeiculo)
		self:NovoVeiculo(idPlayerVeiculo, veiculo, player:GetSteamId().id, player, array.utensilhos)
	end
	
end


function GaragemServer:GetPlayerVeiculo(idPlayerVeiculo)

	local query = SQL:Query("SELECT * FROM PlayerVeiculo WHERE idPlayerVeiculo = ?")
	query:Bind(1, idPlayerVeiculo)
	local result = query:Execute()
	if #result > 0 then
			
		local linha = result[1]
		
		local posicao = posicao
		local angulo = angulo

		if not(posicao and angulo) then
			posicao = self:StringToVector3(linha.ultimaPosicao)
			angulo = self:StringToAngle(linha.ultimoAngulo)
		end
		
		local template = ""
		if linha.template then template = linha.template end
		local tone1 = self:StringToColor(linha.cor1)
		local tone2 = self:StringToColor(linha.cor2)
		if not tone2 then tone2 = tone1 end
		
		local buzina = nil
		if linha.buzina and linha.buzina != "" then
			local buz = linha.buzina:split(", ")
			buzina = {bank_id = tonumber(buz[1]), sound_id = tonumber(buz[3])}
		end
		
		local hidraulica = 0
		if linha.hidraulica then
			hidraulica = tonumber(linha.hidraulica)
		end
		
		local argsVeiculo ={
			model_id = tonumber(linha.idVeiculo),
			position = posicao,
			angle = angulo,
			template = template,
			health = tonumber(linha.vida),
			tone1 = tone1,
			tone2 = tone2,
		}
		
		local utensilhos = {
			placa = linha.placa,
			corNeon = self:StringToColor(linha.corNeon),
			hidraulica = hidraulica,
			buzina = buzina,
		}
		
		local infos = {
			liberado = tonumber(linha.liberado),
			trancado = tonumber(linha.trancado),
			naGaragem = tonumber(linha.naGaragem),
		}
		
		return {idDono = linha.idPlayer, argsVeiculo = argsVeiculo, utensilhos = utensilhos, infos = infos}
	end
	
end


function GaragemServer:GetPlayerVeiculos(idSteam)

	local query = SQL:Query("SELECT idPlayerVeiculo, idVeiculo FROM PlayerVeiculo WHERE idPlayer = ?")
	query:Bind(1, idSteam)
	local result = query:Execute()

	return result

end


function GaragemServer:DirigirVeiculoGaragem(args, player)

	local playerCasa = self:GetPlayerCasa(player)
		
	if not playerCasa then
		Chat:Send(player, "Voce nao e morador de nenhuma casa!", Color(255,0,0))
		return
	end
	
	local array = self:GetPlayerVeiculo(args.idPlayerVeiculo)
	if tonumber(playerCasa.nivelMorador) > tonumber(array.infos.liberado) then
		Chat:Send(player, "Voce nao possui permissao para dirigir esse veiculo!", Color(255,0,0))

		return
	end
	
	local posicaoSpawn = self:StringToVector3(playerCasa.posicaoSpawn)
	local anguloSpawn = self:StringToAngle(playerCasa.anguloSpawn)

	self:RemoverVeiculoByIdPlayerVeiculo(args.idPlayerVeiculo)
	self:RemoverVeiculo(player)
	
	if tonumber(playerCasa.nivelMorador) == 1 then
	
		local command = SQL:Command("UPDATE PlayerVeiculo SET naGaragem = 1, ultimaPosicao = '', ultimoAngulo = '' WHERE idPlayer = ?")
		command:Bind(1, player:GetSteamId().id)
		command:Execute()
		
		local command = SQL:Command("UPDATE PlayerVeiculo SET naGaragem = 0, ultimaPosicao = ?, ultimoAngulo = ? WHERE idPlayer = ? AND idPlayerVeiculo = ?")
		command:Bind(1, playerCasa.posicaoSpawn)
		command:Bind(2, playerCasa.anguloSpawn)
		command:Bind(3, player:GetSteamId().id)
		command:Bind(4, args.idPlayerVeiculo)
		command:Execute()
		
	end
	
	array.argsVeiculo.position = posicaoSpawn
	array.argsVeiculo.angle = anguloSpawn
	
	local veiculo = self:SpawnarVeiculo(array.argsVeiculo)
	
	self:NovoVeiculo(args.idPlayerVeiculo, veiculo, array.idDono, player, array.utensilhos)	
	
	self:EntrarGaragem({player = player, boolean = false})
	self:DisableCollision(player)
	
	player:EnterVehicle(veiculo, 0)
	
end


function GaragemServer:DisableCollision(player)

	player:DisableCollision(CollisionGroup.Vehicle)
	self.playerColisao[player:GetId()] = {player = player, tempo = 8}

end


function GaragemServer:LiberarVeiculoGaragem(args, player)

	local playerCasa = self:GetPlayerCasa(player)
		
	if not playerCasa then
		Chat:Send(player, "Voce nao e morador de nenhuma casa!", Color(255,0,0))
		return
	end
	
	local nivelMorador = tonumber(playerCasa.nivelMorador)
	if nivelMorador != 1 then
		Chat:Send(player, "Voce nao possui permissao para isso!", Color(255,0,0))
		return
	end
	
	local command = SQL:Command("UPDATE PlayerVeiculo SET liberado = ? WHERE idPlayerVeiculo = ? AND idPlayer = ?")
	command:Bind(1, args.nivel)
	command:Bind(2, args.idPlayerVeiculo)
	command:Bind(3, player:GetSteamId().id)
	command:Execute()

	Chat:Send(player, "Voce alterou o nivel minimo para um morador poder dirigir para ".. args.nivel .."!", Color(255,255,200))
end


function GaragemServer:TrancarVeiculoGaragem(args, player)

	local playerCasa = self:GetPlayerCasa(player)
		
	if not playerCasa then
		Chat:Send(player, "Voce nao e morador de nenhuma casa!", Color(255,0,0))
		return
	end
	
	local nivelMorador = tonumber(playerCasa.nivelMorador)
	if nivelMorador != 1 then
		Chat:Send(player, "Voce nao possui permissao para isso!", Color(255,0,0))
		return
	end
	
	local command = SQL:Command("UPDATE PlayerVeiculo SET trancado = ? WHERE idPlayerVeiculo = ? AND idPlayer = ?")
	command:Bind(1, args.trancado)
	command:Bind(2, args.idPlayerVeiculo)
	command:Bind(3, player:GetSteamId().id)
	command:Execute()
	
	if args.trancado == 1 then
		Chat:Send(player, "Voce trancou seu veiculo com sucesso!", Color(255,255,200))
	else
		Chat:Send(player, "Voce destrancou seu veiculo com sucesso!", Color(255,255,200))
	end
end


function GaragemServer:NovoVeiculo(idPlayerVeiculo, veiculo, idDono, motorista, utensilhos)
	
	local idCasa = nil
	local result = SQL:Query("SELECT idCasa FROM PlayerCasa WHERE idPlayer = "..idDono):Execute()
	if #result > 0 then
		idCasa = tonumber(result[1].idCasa)
	end	
	
	local result = SQL:Query("SELECT trancado, liberado FROM PlayerVeiculo WHERE idPlayerVeiculo = "..idPlayerVeiculo):Execute()
	local trancado = tonumber(result[1].trancado)
	local liberado = tonumber(result[1].liberado)

	local array = {idPlayerVeiculo = idPlayerVeiculo, ultimaPosicao = veiculo:GetPosition(), veiculo = veiculo, veiculoId = veiculo:GetId(), idDono = idDono, motorista = motorista, utensilhos = utensilhos, idCasa = idCasa, trancado = trancado, liberado = liberado}
	self.veiculos[veiculo:GetId()] = array
	
	Network:Broadcast("AtualizarVeiculo", {id = veiculo:GetId(), veiculo = array})
	
end


function GaragemServer:RemoverVeiculoByIdPlayerVeiculo(idPlayerVeiculo)

	for _, array in pairs(self.veiculos) do
	
		if array.idPlayerVeiculo == idPlayerVeiculo then
		
			if IsValid(array.veiculo) then

				local command = SQL:Command("UPDATE PlayerVeiculo SET ultimaPosicao = ?, ultimoAngulo = ?, vida = ? WHERE idPlayerVeiculo = ?")
				command:Bind(1, tostring(array.veiculo:GetPosition()))
				command:Bind(2, tostring(array.veiculo:GetAngle()))
				command:Bind(3, array.veiculo:GetHealth())
				command:Bind(4, array.idPlayerVeiculo)
				command:Execute()	
				
				array.veiculo:Remove()				
			end
			self.veiculos[_] = nil
			Network:Broadcast("AtualizarVeiculo", {id = _, veiculo = nil})
		end
	
	end
end


function GaragemServer:RemoverVeiculoById(idVeiculo)

	local array = self.veiculos[idVeiculo]
	if array then

		if IsValid(array.veiculo) then
			
			if array.idPlayerVeiculo then
				local command = SQL:Command("UPDATE PlayerVeiculo SET ultimaPosicao = ?, ultimoAngulo = ?, vida = ? WHERE idPlayerVeiculo = ?")
				command:Bind(1, tostring(array.veiculo:GetPosition()))
				command:Bind(2, tostring(array.veiculo:GetAngle()))
				command:Bind(3, array.veiculo:GetHealth())
				command:Bind(4, array.idPlayerVeiculo)
				command:Execute()	
			end
			array.veiculo:Remove()				
		end
		
		self.veiculos[idVeiculo] = nil
		Network:Broadcast("AtualizarVeiculo", {id = idVeiculo, veiculo = nil})
	else
		Chat:Broadcast("removido sem encontrar", Color(255,0,0))
		Vehicle.GetById(idVeiculo):Remove()
	end
end


function GaragemServer:RemoverVeiculo(motorista)
	
	for _, array in pairs(self.veiculos) do
	
		if array.motorista == motorista then

			if IsValid(array.veiculo) then

				local command = SQL:Command("UPDATE PlayerVeiculo SET ultimaPosicao = ?, ultimoAngulo = ?, vida = ? WHERE idPlayerVeiculo = ?")
				command:Bind(1, tostring(array.veiculo:GetPosition()))
				command:Bind(2, tostring(array.veiculo:GetAngle()))
				command:Bind(3, array.veiculo:GetHealth())
				command:Bind(4, array.idPlayerVeiculo)
				command:Execute()	
					
				array.veiculo:Remove()				
			end
			
			self.veiculos[_] = nil
			Network:Broadcast("AtualizarVeiculo", {id = _, veiculo = nil})
		end

	end
	
end


function GaragemServer:SpawnarVeiculo(spawnArgs)

	local veiculo = Vehicle.Create(spawnArgs)
	veiculo:SetDeathRemove(false) 
	veiculo:SetUnoccupiedRespawnTime(-1) 
	return veiculo
	
end


function GaragemServer:AtualizarPlayer(player, booleanVeiculos)

	local casaArray = {}

	local result = SQL:Query("SELECT idCasa, nivelMorador FROM PlayerCasa WHERE idPlayer = "..player:GetSteamId().id):Execute()
	if #result > 0 then
		casaArray.idCasa = tonumber(result[1].idCasa)
		casaArray.nivelMorador = tonumber(result[1].nivelMorador)
	end
	
	if booleanVeiculos then
		Network:Send(player, "AtualizarVeiculos", {veiculos = self.veiculos, casa = casaArray})
	else
		Network:Send(player, "AtualizarVeiculos", {casa = casaArray})
	end
end


function GaragemServer:EntrarGaragem(args)
	-- player, boolean
	if args.boolean then
		local playerCasa = self:GetPlayerCasa(args.player)
		
		if not playerCasa then
			Chat:Send(args.player, "Voce nao e morador de nenhuma casa!", Color(255,0,0))
			return
		end
		
		local nivelMorador = tonumber(playerCasa.nivelMorador)

		local idDono = self:GetSteamIdDonoCasa(playerCasa.idCasa)
		
		local veiculos = {} -- idveiculo, comQuem

		local world = World.Create()
		world:SetTime(DefaultWorld:GetTime())
		table.insert(self.mundosGaragem, {mundo = world, player = args.player, ultimaPosicao = args.player:GetPosition()})
		args.player:SetWorld(world)
		args.player:SetPosition(self.posicaoGaragem)
		
		local result = self:GetPlayerVeiculos(idDono)
		-- local query = SQL:Query("SELECT * FROM PlayerVeiculo pv INNER JOIN Veiculo v ON v.idVeiculo = pv.idVeiculo WHERE idPlayer = ? ")
		-- query:Bind(1, idDono)
		-- local result = query:Execute()
		for _, linha in ipairs(result) do
			

			local comQuem = nil
			for _, array in pairs(self.veiculos) do

				if tonumber(array.idPlayerVeiculo) == tonumber(linha.idPlayerVeiculo) then
						
					if array.motorista != args.player then
						comQuem = array.motorista
					end
					
				end

			end
			
			local arrayVeiculo = self:GetPlayerVeiculo(tonumber(linha.idPlayerVeiculo))
			
			if (not comQuem or (comQuem and nivelMorador == 1)) and (nivelMorador <= arrayVeiculo.infos.liberado) then
			

				local argsVeiculo = arrayVeiculo.argsVeiculo
				
				argsVeiculo.position = self.posicaoVeiculosGaragem + Vector3(-1.35, 0, 4) * _
				argsVeiculo.angle = self.anguloVeiculosGaragem
				argsVeiculo.health = math.max(0.2, tonumber(argsVeiculo.health))
				argsVeiculo.world = world
				
				local veiculo = self:SpawnarVeiculo(argsVeiculo)
				
				local query = SQL:Query("SELECT preco FROM Veiculo WHERE idVeiculo = ?")
				query:Bind(1, argsVeiculo.model_id)
				local preco = tonumber(query:Execute()[1].preco)
				
				table.insert(veiculos, {veiculoId = veiculo:GetId(), comQuem = comQuem, idPlayerVeiculo = linha.idPlayerVeiculo, liberado = arrayVeiculo.infos.liberado, trancado = arrayVeiculo.infos.trancado, preco = preco, utensilhos = arrayVeiculo.utensilhos})
			end
			
		end
		
		
		Network:Send(args.player, "EntrouGaragem", {nivelMorador = nivelMorador, veiculos = veiculos})
	else
	
		for _, array in ipairs(self.mundosGaragem) do
			if array.player == args.player then
				args.player:SetWorld(DefaultWorld)
				args.player:SetPosition(array.ultimaPosicao)
				if IsValid(array.mundo) then
					array.mundo:Remove()
				end
				self.mundosGaragem[_] = nil
				break
			end
		end
		--remover colisao
		Network:Send(args.player, "EntrouGaragem", false)
	end

end


function GaragemServer:FugiuGaragem(args, player)

	Chat:Send(player, "Nao fuja da garagem! Pressione J caso deseja sair", Color(255,0,0))
	player:SetPosition(self.posicaoGaragem)

end


function GaragemServer:GetSteamIdDonoCasa(idCasa)

	local query = SQL:Query("SELECT idPlayer FROM PlayerCasa WHERE idCasa = ? AND nivelMorador = 1")
	query:Bind(1, idCasa)
	local result = query:Execute()
	if #result > 0 then
		return result[1].idPlayer
	else
		return false
	end
	
end


function GaragemServer:GetPlayerCasa(player)

	local query = SQL:Query("SELECT * FROM PlayerCasa pc INNER JOIN Casa c ON pc.idCasa = c.idCasa WHERE idPlayer = ?")
	query:Bind(1, player:GetSteamId().id)
	local result = query:Execute()
	if #result > 0 then
		return result[1]
	else
		return false
	end
	
end


function GaragemServer:StringToVector3(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end
	
end


function GaragemServer:StringToAngle(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Angle(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end
	
end


function GaragemServer:StringToColor(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Color(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end
	
end


function GaragemServer:PossuiDinheiro(player, valor)

	if player:GetMoney() < valor then
		Chat:Send(player, "Voce nao possui dinheiro suficiente para essa operacao!", Color(255,0,0))
		return false
	end
	return true

end

garagem = GaragemServer()