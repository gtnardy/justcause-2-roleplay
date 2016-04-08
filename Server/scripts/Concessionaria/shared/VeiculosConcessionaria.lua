class 'VeiculosConcessionaria'

function VeiculosConcessionaria:__init()

	self.veiculos = {}
	self.veiculos[22] = {
	
		{id = 91, preco = 350000},
		{id = 2, preco = 345000},
		{id = 78, preco = 350000},
		{id = 91, preco = 355000, template = "Cab"},
		{id = 35, preco = 345000},		
		{id = 91, preco = 355000, template = "Softtop"},
		{id = 77, preco = 200000, template = "Default"},			
		{id = 78, preco = 355000, template = "Cab"},	
	}
		
	self.veiculos[23] = {
		{id = 47, preco = 17000},		
		{id = 61, preco = 20000},	
		{id = 90, preco = 25000},
		{id = 21, preco = 30000},
		{id = 89, preco = 80000},		
		{id = 36, preco = 55000, template = "Civil"},
		{id = 74, preco = 70000},	
		{id = 43, preco = 65000},	
		{id = 36, preco = 55000, template = "Gimp"},
		{id = 83, preco = 15000},
		{id = 32, preco = 16000},
		{id = 36, preco = 53000, template = "Sport"},
		{id = 11, preco = 55000, template = "Police"},				
	}
	
	self.veiculos[24] = {	
	
		{id = 46, preco = 150000},		
		{id = 87, preco = 80000},
		{id = 46, preco = 155000, template = "Combi"},		
		{id = 48, preco = 85000},	
		{id = 87, preco = 85000, template = "Softtop"},
		{id = 46, preco = 157000, template = "Cab"},
		{id = 84, preco = 140000, template = "Cab"},
		{id = 87, preco = 85000, template = "Cab"},	
		{id = 56, preco = 160000, template = "Cab"},
		
	}
	
	self.veiculos[25] = {	
		{id = 22, preco = 15000},
		{id = 9, preco = 18000},
		{id = 44, preco = 45000},
		{id = 44, preco = 45000, template = "Softtop"},
		{id = 44, preco = 45000, template = "Cab"},		
		{id = 29, preco = 55000},		
		{id = 55, preco = 75000},	
		{id = 70, preco = 53000},
		{id = 15, preco = 60000},	
		{id = 60, preco = 55000},
		{id = 63, preco = 70000},
		{id = 68, preco = 67000},
		{id = 82, preco = 75000},
		{id = 73, preco = 80000},		
		{id = 54, preco = 60000},			
		{id = 23, preco = 68000},		
		{id = 10, preco = 70000},				
		{id = 13, preco = 75000},			

		{id = 26, preco = 82000},

		{id = 86, preco = 95000},		
		{id = 8, preco = 120000},		

		{id = 7, preco = 85000, template = "Default"},		

		{id = 33, preco = 75000},		
		{id = 1, preco = 22000, template = "Classic_Cab"},
		{id = 1, preco = 20000, template = "Classic_Hardtop"},
		{id = 1, preco = 25000, template = "Modern_Hardtop"},
		{id = 1, preco = 23000, template = "Modern_Cab"},	
	
	}
	
	self.veiculos[26] = {	

		{id = 66, preco = 160000, template = "Double"},		
		{id = 12, preco = 175000},		
		{id = 4, preco = 155000},		
		{id = 40, preco = 150000},
		{id = 66, preco = 155000},		
		{id = 40, preco = 155000, template = "Regular"},
		{id = 41, preco = 135000},
		{id = 40, preco = 155000, template = "Crane"},
		{id = 42, preco = 133000},
		{id = 49, preco = 135000},
		{id = 31, preco = 198000},
		{id = 76, preco = 170000},
		{id = 31, preco = 175000, template = "Cab"},
		{id = 71, preco = 175000},
		{id = 79, preco = 197000},
	}
end


function VeiculosConcessionaria:GetVeiculo(id, template)

	for idConcessionaria, concessionaria in pairs(self.veiculos) do
		for _, veiculo in pairs(concessionaria) do
			
			if veiculo.id == id then
			
				if (template and template != "" and veiculo.template and template == veiculo.template) or (not template or template == "") then 

					return veiculo
				end
			end
			
		end
	end
	
	return nil
	
end


function VeiculosConcessionaria:GetVeiculosById(id)
	
	for _, array in pairs(self.veiculos) do
	
		for _, arrayInterno in pairs(array) do
		
			if arrayInterno.id == id then
				return arrayInterno
			end
		
		end		
	
	end

end

function VeiculosConcessionaria:GetVeiculosByConcessionaria(id)

	return self.veiculos[id]

end


function VeiculosConcessionaria:GetByIdTemplate(conc, id, temp)

	for _, array in pairs(self.veiculos[conc]) do
		
		if array.id == id and (not temp or temp == "") and (not array.template or array.template == "") then
			return array
		end
		
		if array.id == id and temp and array.template and temp == array.template then
			return array
		end
	
	end
	
	return false

end
