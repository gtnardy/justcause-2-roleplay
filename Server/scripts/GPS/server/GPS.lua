class 'GPS'

function GPS:__init()
				
	Events:Subscribe("AtivarGPS", self, self.AtivarGPS)
	Events:Subscribe("ModulesLoad", self, self.ModuleLoad)
	Events:Subscribe("ClientModuleLoad", self, self.ClientModuleLoad)
	self.gps = nil
	
end


function GPS:AtivarGPS(args)

	Network:Send(args, "AtivarGPS")

end


function GPS:ClientModuleLoad(args)

	self:AtualizarPlayer(args.player)

end


function GPS:AtualizarPlayer(player)

	Network:Send(player, "AtualizarGPS", self.gps)

end


function GPS:ModuleLoad(args)
	
	if self.gps != nil then return end
	self:AtualizarGPS()


end


function GPS:AtualizarGPS(args)

	local query = SQL:Query("SELECT descricao, idLocalTipo FROM LocalTipo WHERE checkpoint != '' AND categoria is null ORDER BY descricao")
	local result = query:Execute()
	
	if #result > 0 then
		
		for _, r in pairs(result) do
		
			local query = SQL:Query("SELECT descricao, idLocalTipo FROM LocalTipo WHERE categoria = ?")
			query:Bind(1, tonumber(r.idLocalTipo))
			local resultCategoria = query:Execute()
			
			if #resultCategoria > 0 then
			
				for _, rC in ipairs(resultCategoria) do
								
					local query = SQL:Query("SELECT posicao FROM Local WHERE tipo = ?")
					query:Bind(1, rC.idLocalTipo)
					local posicoes = query:Execute()	

					rC.posicoes = posicoes
				end
				r.itens = resultCategoria
			
			else
			
				local query = SQL:Query("SELECT posicao FROM Local WHERE tipo = ?")
				query:Bind(1, r.idLocalTipo)
				local posicoes = query:Execute()	

				r.posicoes = posicoes
			end

		end
		
		self.gps = result
		
	end
	
	

end


gps = GPS()