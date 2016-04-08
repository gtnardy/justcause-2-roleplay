class 'ExperienciaNecessariaMatriz'

function ExperienciaNecessariaMatriz:__init()
	
	self.experienciaPorNivelGlobal = 600
	self.experienciaPorNivelCategoria = 700

	self.experienciasCarreira = {
		[0] = {0},
		[1] = {66000, 126000, 130000, 144000, 159000},
		[2] = {115000, 115000, 115000, 115000, 115000},
		[3] = {115000, 115000, 115000, 115000, 115000},
		[4] = {40000, 50000, 60000, 70000, 80000},
		[5] = {50000, 60000, 70000, 80000, 90000},
	}
	
	self:AtualizarExperienciaNecessaria()
	Events:Subscribe("RequerirAtualizarExperienciaNecessaria", self, self.AtualizarExperienciaNecessaria)
end


function ExperienciaNecessariaMatriz:AtualizarExperienciaNecessaria()
	
	Events:Fire("AtualizarExperienciaNecessaria", {
		experienciaGlobal = self.experienciaPorNivelGlobal,
		experienciaCategoria = self.experienciaPorNivelCategoria,
		experienciasCarreira = self.experienciasCarreira,
	})
	
end

experienciaNecessariaMatriz = ExperienciaNecessariaMatriz()