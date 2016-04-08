class 'ComandosChatServer'

function ComandosChatServer:__init()

	Network:Subscribe("TeleportToPlayer", self, self.TeleportToPlayer)
	Network:Subscribe("TeleportOfPlayer", self, self.TeleportOfPlayer)
	Network:Subscribe("SetLocal", self, self.SetLocal)
	Network:Subscribe("TeleportCheckpoint", self, self.TeleportCheckpoint)
	Network:Subscribe("SpawnarCarro", self, self.SpawnarCarro)
	Network:Subscribe("DeletarCarro", self, self.DeletarCarro)
	Network:Subscribe("SetTime", self, self.SetTime)
	
	-- BANCO
	Network:Subscribe("BancoSacar", self, self.BancoSacar)
	Network:Subscribe("BancoSaldo", self, self.BancoSaldo)
	Network:Subscribe("BancoDepositar", self, self.BancoDepositar)
	Network:Subscribe("BancoTransferir", self, self.BancoTransferir)
	Network:Subscribe("GiveMoney", self, self.GiveMoney)
	
	-- POLICIAL
	Network:Subscribe("Desalgemar", self, self.Desalgemar)
	Network:Subscribe("Algemar", self, self.Algemar)
	Network:Subscribe("Aceitar190", self, self.Aceitar190)
	Network:Subscribe("Chamados190", self, self.Chamados190)
	Network:Subscribe("Multar", self, self.Multar)
	Network:Subscribe("Procurar", self, self.Procurar)
	Network:Subscribe("Desprocurar", self, self.Desprocurar)
	Network:Subscribe("Prender", self, self.Prender)
	
	-- CASA
	Network:Subscribe("CasaAceitar", self, self.CasaAceitar)
	
	
end


function ComandosChatServer:BancoTransferir(args, player) Events:Fire("BancoTransferir", args) end
function ComandosChatServer:BancoDepositar(args, player) Events:Fire("BancoDepositar", args) end
function ComandosChatServer:BancoSacar(args, player) Events:Fire("BancoSacar", args) end
function ComandosChatServer:BancoSaldo(args, player) Events:Fire("BancoSaldo", args) end

function ComandosChatServer:Algemar(args, player) Events:Fire("Algemar", args) end
function ComandosChatServer:Desalgemar(args, player) Events:Fire("Desalgemar", args) end
function ComandosChatServer:Aceitar190(args, player) Events:Fire("Aceitar190", args) end
function ComandosChatServer:Chamados190(args, player) Events:Fire("Chamados190", args) end
function ComandosChatServer:Multar(args, player) Events:Fire("Multar", args) end
function ComandosChatServer:Procurar(args, player) Events:Fire("Procurar", args) end
function ComandosChatServer:Desprocurar(args, player) Events:Fire("Desprocurar", args) end
function ComandosChatServer:Prender(args, player) Events:Fire("Prender", args) end

function ComandosChatServer:CasaAceitar(args, player) Events:Fire("CasaAceitar", args) end


function ComandosChatServer:TeleportOfPlayer(args, player)

	args.player:SetPosition(player:GetPosition() + Vector3(1, 0, 0))

end

function ComandosChatServer:TeleportToPlayer(args, player)

	player:SetPosition(args.player:GetPosition() + Vector3(1, 0, 0))

end

function ComandosChatServer:GiveMoney(args, player)

	args.destinatario:SetMoney(args.destinatario:GetMoney() + args.valor)
	
end


function ComandosChatServer:SetTime(args, player)

	DefaultWorld:SetTime(args.tempo)
	
end


function ComandosChatServer:DeletarCarro(args, player)

	v = player:GetVehicle()
	v:Remove()
	
end


function ComandosChatServer:SpawnarCarro(args, player)

	v = Vehicle.Create(args.id, player:GetPosition(), player:GetAngle())
	
end


function ComandosChatServer:TeleportCheckpoint(args, player)

	player:SetPosition(args.posicao)
	
end
	

function ComandosChatServer:SetLocal(args, player)
	
	Events:Fire("SetLocal", args)
	
end


comandosChatServer = ComandosChatServer()