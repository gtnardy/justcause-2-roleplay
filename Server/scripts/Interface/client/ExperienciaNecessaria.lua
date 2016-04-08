class 'ExperienciaNecessaria'

function ExperienciaNecessaria:__init()

	self.experienciaPorNivelGlobal = 600
	self.experienciaPorNivelCategoria = 700
	self.experienciasCarreira = {}
	
	Events:Subscribe("AtualizarExperienciaNecessaria", self, self.AtualizarExperienciaNecessaria)
	Events:Fire("RequerirAtualizarExperienciaNecessaria")
end


function ExperienciaNecessaria:AtualizarExperienciaNecessaria(args)

	self.experienciaPorNivelGlobal = args.experienciaGlobal
	self.experienciaPorNivelCategoria = args.experienciaCategoria
	self.experienciasCarreira = args.experienciasCarreira
	
	
end


function ExperienciaNecessaria:GetExperienciaNecessariaCategoria(nivel)

	return self.experienciaPorNivelCategoria * (nivel + 1)
	
end


function ExperienciaNecessaria:GetExperienciaNecessariaCarreira(idCarreira, nivel)

	if nivel > 0 then
		if self.experienciasCarreira[idCarreira] then
			if self.experienciasCarreira[idCarreira][(nivel + 1)] then
				return self.experienciasCarreira[idCarreira][(nivel + 1)]
			else
				self:GetExperienciaNecessariaCarreira(idCarreira, nivel - 1)
			end
		
		end
	end
	return 100001
	
end


function ExperienciaNecessaria:GetExperienciaNecessariaGlobal(nivel)

	return self.experienciaPorNivelGlobal * nivel
	
end