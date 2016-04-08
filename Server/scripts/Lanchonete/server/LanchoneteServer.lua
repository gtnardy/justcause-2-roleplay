class 'LanchoneteServer'

function LanchoneteServer:__init()

	self.locais = nil
	self.alimentos = nil
	
	Events:Subscribe("ModulesLoad", self, self.ModulesLoad)
	Events:Subscribe("PlayerEnterCheckpoint", self, self.PlayerEnterCheckpoint)
	Events:Subscribe("PlayerExitCheckpoint", self, self.PlayerExitCheckpoint)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	Network:Subscribe("ComprarAlimento", self, self.ComprarAlimento)
	
end


function LanchoneteServer:ComprarAlimento(args, player)

	Events:Fire("ComprarItem", {player = player, item = args.alimento})
	
end


function LanchoneteServer:ModulesLoad()

	if (not self.alimentos) then
		self.alimentos = {}
		local query = SQL:Query("SELECT ii.idItem, ii.nome, ia.fome, ia.sede, ia.preco FROM InventarioItem ii INNER JOIN InventarioAlimento ia ON ii.idItem = ia.idItem")
		local result = query:Execute()
		if #result > 0 then
		
			for i, linha in ipairs(result) do
			
				self.alimentos[tonumber(linha.idItem)] = {nome = linha.nome, sede = tonumber(linha.sede), fome = tonumber(linha.fome), preco = tonumber(linha.preco)}
			end
		end
	end

	if (not self.locais) then
		self.locais = {}
		local query = SQL:Query("SELECT descricao, idLocalTipo FROM LocalTipo WHERE checkpoint = 21")
		local result = query:Execute()
		if #result > 0 then
		
			for i, linha in ipairs(result) do

				self.locais[string.lower(linha.descricao)] = tonumber(linha.idLocalTipo)
			end
		end
	end

end


function LanchoneteServer:PlayerExitCheckpoint(args)
	
	if (args.checkpoint:GetType() == 21) then

		Network:Send(args.player, "EnterCheckpoint", false)
	end
	
end



function LanchoneteServer:PlayerEnterCheckpoint(args)
	
	if (args.checkpoint:GetType() == 21) then
		local idLocal = 0
		local name = string.lower(args.checkpoint:GetText())

		if (name and self.locais[name]) then
			idLocal = self.locais[name]
		end
		
		Network:Send(args.player, "EnterCheckpoint", {idLocal = idLocal})
	end
	
end


function LanchoneteServer:ClientModuleLoad(args)
	
	self:AtualizarPlayer(args.player)

end


function LanchoneteServer:AtualizarPlayer(player)


	Network:Send(player, "AtualizarLanchonete", {alimentos = self.alimentos})

end


lServer = LanchoneteServer()