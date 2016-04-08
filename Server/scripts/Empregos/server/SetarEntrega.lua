class 'SetarEntrega'

function SetarEntrega:__init()


	Network:Subscribe("NovoServico", self, self.NovoServico)
	
	
end


function SetarEntrega:NovoServico(args)

	local command = SQL:Command("INSERT INTO jcEntregaServico (posicao, angulo, idEntrega, numEntrega, distancia, idCarreira) VALUES(?, ?, ?, ?, ?, ?)")
	command:Bind(1, tostring(args.pontos[1]))
	command:Bind(2, tostring(args.angulo))
	command:Bind(3, -1)
	command:Bind(4, 1)
	command:Bind(5, args.distancia)
	command:Bind(6, 1) -- carreira
	command:Execute()
	
	local query = SQL:Query("SELECT idEntregaServico FROM jcEntregaServico ORDER BY idEntregaServico DESC")
	local result = query:Execute()
	if #result > 0 then
	
		local command = SQL:Command("UPDATE jcEntregaServico SET idEntrega = ? WHERE idEntregaServico = ?")
		command:Bind(1, tonumber(result[1].idEntregaServico))
		command:Bind(2, tonumber(result[1].idEntregaServico))
		command:Execute()
		
		for p = 2, #args.pontos do
		
			local command = SQL:Command("INSERT INTO jcEntregaServico (posicao, idEntrega, numEntrega, idCarreira) VALUES(?, ?, ?, ?)")
			command:Bind(1, tostring(args.pontos[p]))
			command:Bind(2, tonumber(result[1].idEntregaServico))
			command:Bind(3, p)
			command:Bind(4, 1) -- carreira
			command:Execute()
		
		end
	end
	
end



setarEntrega = SetarEntrega()