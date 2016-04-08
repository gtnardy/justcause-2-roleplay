class 'Utilitarios'

function Utilitarios:__init()

	Events:Subscribe( "ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe( "ModuleUnload", self, self.ModuleUnload)
	
	Events:Subscribe( "SetLocal", self, self.SetLocal)
	
	self.utilitarios = {}
end


function Utilitarios:SetLocal(args)

	local command = SQL:Command("INSERT INTO Local (nome, posicao, tipo) VALUES(?, ?, ?)")
	command:Bind(1, args.nome)
	command:Bind(2, args.posicao)
	command:Bind(3, args.tipo)
	command:Execute()
	Chat:Send(args.player, args.nome .." setado em ".. args.posicao, Color(255,0,0))
	
	Events:Fire("LocalSetado")
	
end


function Utilitarios:ModuleUnload()

	for i, utilitario in pairs(self.utilitarios) do
	
		utilitario:Remove()
		
	end

end


function Utilitarios:ModuleLoad()

	local query = SQL:Query("SELECT nome, descricao, posicao, checkpoint FROM Local l INNER JOIN LocalTipo lt ON l.tipo = lt.idLocalTipo WHERE checkpoint != ''")
	local result = query:Execute()
	if #result > 0 then

		for p  = 1, #result do
		
			Chat:Broadcast(result[p].checkpoint .. " ".. result[p].descricao, Color(11,1,1))

			local spawnArgs = {}
				
			local posicao = self:StringToVector3(result[p].posicao)
			
			spawnArgs.position = posicao + Vector3(0, 1, 0)
			spawnArgs.type = tonumber(result[p].checkpoint)
			spawnArgs.world = DefaultWorld
			spawnArgs.create_checkpoint = false
			spawnArgs.create_trigger = true
			spawnArgs.enabled = true
			if (result[p].nome and result[p].nome != "") then
				spawnArgs.text = result[p].nome
			else
				spawnArgs.text = result[p].descricao
			end
			
			if tonumber(result[p].tipoCheckpoint) == 19 then
				spawnArgs.activation_box = Vector3(10, 8, 10)	
			else
				spawnArgs.activation_box = Vector3(5, 3, 5)	
			end
				
			local utilitario = Checkpoint.Create(spawnArgs)
			utilitario:SetStreamDistance(150)
			
			table.insert(self.utilitarios, utilitario)			


		end
		
	end

end


function Utilitarios:StringToVector3(str)

	local v = tostring(str):split(", ")
	if (tonumber(v[1]) and tonumber(v[3]) and tonumber(v[5])) then
		return Vector3(tonumber(v[1]), tonumber(v[3]), tonumber(v[5]))
	else
		return nil
	end

end

utilitarios = Utilitarios()