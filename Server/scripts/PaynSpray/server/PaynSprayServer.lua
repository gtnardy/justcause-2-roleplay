class 'PaynSprayServer'

function PaynSprayServer:__init()

	self.playerColisao = {}
	self.worlds = {}
	
	self.timer =  Timer()
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("PostTick", self, self.PostTick)
	
	Events:Subscribe("PlayerExitCheckpoint", self, self.PlayerExitCheckpoint)
	Events:Subscribe("PlayerEnterCheckpoint", self, self.PlayerEnterCheckpoint)
	
	Network:Subscribe("AtualizarVeiculo", self, self.AtualizarVeiculo)
	
	Network:Subscribe("VisualizarPinturaVeiculo", self, self.VisualizarPinturaVeiculo)
	Network:Subscribe("VisualizarModificacaoVeiculo", self, self.VisualizarModificacaoVeiculo)
	
	Network:Subscribe("AlterarPlaca", self, self.AlterarPlaca)
	Network:Subscribe("ComprarBuzina", self, self.ComprarBuzina)
	Network:Subscribe("ComprarHidraulica", self, self.ComprarHidraulica)
	
	Network:Subscribe("VenderVeiculo", self, self.VenderVeiculo)
	Network:Subscribe("RepararEstrutura", self, self.RepararEstrutura)
	Network:Subscribe("RepararVeiculo", self, self.RepararVeiculo)
	Network:Subscribe("ComprarPinturaVeiculo", self, self.ComprarPinturaVeiculo)
	Network:Subscribe("ComprarNeonVeiculo", self, self.ComprarNeonVeiculo)
	Network:Subscribe("ComprarModificacaoVeiculo", self, self.ComprarModificacaoVeiculo)
	Network:Subscribe("EntrarPaynSpray", self, self.EntrarPaynSpray)
	
end


function PaynSprayServer:EntrarPaynSpray(args, player)

	local veiculo = args.veiculo
	if args.boolean then
		
		local world = World.Create()
		world:SetTime(DefaultWorld:GetTime())
		player:SetWorld(world)
		
		veiculo:SetWorld(world)
		
		table.insert(self.worlds, {player = player, world = world})
	else
		self:DisableCollision(player)
		
		for _, array in ipairs(self.worlds) do
		
			if array.player == player then
			
				player:SetWorld(DefaultWorld)
				veiculo:SetWorld(DefaultWorld)
				player:EnterVehicle(veiculo, 0)
				if IsValid(array.world) then
					array.world:Remove()
				end
				self.worlds[_] = nil
				break
			end
		end	
		
	end

end


function PaynSprayServer:ModuleUnload()

	for _, array in pairs(self.worlds) do
	
		if IsValid(array.veiculo) then
			array.veiculo:SetWorld(DefaultWorld)
		else
			if IsValid(array.player:GetVehicle()) then
				array.player:GetVehicle():SetWorld(DefaultWorld)
			end
		end
		array.player:SetWorld(DefaultWorld)
	end
	
	for _, array in pairs(self.playerColisao) do
	
		array.player:EnableCollision(CollisionGroup.Vehicle)

	end
end


function PaynSprayServer:PostTick()

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


function PaynSprayServer:DisableCollision(player)

	player:DisableCollision(CollisionGroup.Vehicle)
	self.playerColisao[player:GetId()] = {player = player, tempo = 8}
end


function PaynSprayServer:AtualizarVeiculo(args, player)

	Events:Fire("AtualizarVeiculo", args)

end


function PaynSprayServer:VisualizarModificacaoVeiculo(args, player)

	Events:Fire("VisualizarModificacaoVeiculo", args)

end


function PaynSprayServer:VisualizarPinturaVeiculo(args, player)
	local veiculo = player:GetVehicle()
	if veiculo then
		veiculo:SetColors(args.cor1, args.cor2)
	end
end


function PaynSprayServer:AlterarPlaca(args, player)

	Events:Fire("AlterarPlaca", args)
end


function PaynSprayServer:ComprarBuzina(args, player)

	Events:Fire("ComprarBuzina", args)
end


function PaynSprayServer:ComprarHidraulica(args, player)

	Events:Fire("ComprarHidraulica", args)
end


function PaynSprayServer:VenderVeiculo(args, player)

	Events:Fire("VenderVeiculo", args)
end


function PaynSprayServer:RepararEstrutura(args, player)

	Events:Fire("RepararEstrutura", args)
end


function PaynSprayServer:RepararVeiculo(args, player)

	local veiculo = player:GetVehicle()
	if veiculo then
		if self:PossuiDinheiro(player, args.preco) then
			player:SetMoney(player:GetMoney() - args.preco)
			veiculo:SetHealth(1)
			Chat:Send(player, "A vida de seu veiculo foi restaurada!", Color(255,255,200))
		end		
	end
end


function PaynSprayServer:ComprarModificacaoVeiculo(args)

	Events:Fire("ComprarModificacaoVeiculo", args)
	
end


function PaynSprayServer:ComprarNeonVeiculo(args)

	Events:Fire("ComprarNeonVeiculo", args)
	
end


function PaynSprayServer:ComprarPinturaVeiculo(args)

	Events:Fire("ComprarPinturaVeiculo", args)
	
end


function PaynSprayServer:PlayerEnterCheckpoint(args)

	if args.checkpoint:GetType() == 10 then
	
		Network:Send(args.player, "EntrouPaynSpray", true)
	end
	
end


function PaynSprayServer:PlayerExitCheckpoint(args)

	if args.checkpoint:GetType() == 10 then
	
		Network:Send(args.player, "EntrouPaynSpray", false)
	end
	
end


function PaynSprayServer:PossuiDinheiro(player, valor)

	if player:GetMoney() < valor then
		Chat:Send(player, "Voce nao possui dinheiro suficiente para essa operacao!", Color(255,0,0))
		return false
	end
	return true

end


paynSprayServer = PaynSprayServer()