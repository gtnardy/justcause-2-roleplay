class 'CategoriaVeiculos'

function CategoriaVeiculos:__init()

	self.categorias = {
	
		{
			velocidadeMedia = 100,
			idCategoria = 1,
			nome = "Sedan",
			idCarreira = 1,
			veiculos = { 
				{id = 44, capacidade = 50},
				{id = 29, capacidade = 80},
				{id = 15, capacidade = 110},
			},
			mercadorias = {
				1, 2, 3, 4, 5, 6, 7, 8, 9
			},
		},
	
		{
			velocidadeMedia = 110,
			idCategoria = 2,
			nome = "Pickup",
			idCarreira = 1,
			veiculos = {
				{id = 60, capacidade = 120},
				{id = 26, capacidade = 140},
				{id = 63, capacidade = 160},
				{id = 23, capacidade = 180},
				{id = 68, capacidade = 200},
				{id = 86, capacidade = 220},
			},
			mercadorias = {
				6, 3, 12, 13
			},
		},
	
		{
			velocidadeMedia = 70,
			idCategoria = 3,
			nome = "Caminhao",
			idCarreira = 1,
			veiculos = {
				{id = 42, capacidade = 50},
				{id = 41, capacidade = 50},
				{id = 49, capacidade = 50}, 
				{id = 71, capacidade = 50}, 
				{id = 40, capacidade = 50},
				{id = 31, capacidade = 50},
				{id = 76, capacidade = 50},
			},
			mercadorias = {
				6, 3, 12, 13
			},
		},
	
		{
			velocidadeMedia = 100,
			idCategoria = 4,
			nome = "Moto",
			idCarreira = 1,
			veiculos = {
				{id = 47, capacidade = 50},
				{id = 90, capacidade = 50},
				{id = 32, capacidade = 50}, 
				{id = 83, capacidade = 50},
				{id = 61, capacidade = 50}, 
				{id = 89, capacidade = 50}, 
				{id = 43, capacidade = 50}, 
				{id = 21, capacidade = 50}, 
				{id = 74, capacidade = 50},
			},
			mercadorias = {
				6, 3, 12, 13
			},
		},
		
		
		{
			velocidadeMedia = 50,
			idCategoria = 5,
			nome = "Barco",
			idCarreira = 3,
			veiculos = {
				{id = 5,  capacidade = 50, Cab}, 
				{id = 5,  capacidade = 50}, 
				{id = 38, capacidade = 50, Djonk01},
				{id = 19, capacidade = 50}, 
				{id = 38, capacidade = 50, Djonk04},
				{id = 25, capacidade = 50}, 
				{id = 28, capacidade = 50}, 
				{id = 50, capacidade = 50},
			},
			mercadorias = {
				6, 3, 12, 13
			},
		},
		
		
		{
			velocidadeMedia = 250,
			idCategoria = 6,
			nome = "Aerea",
			idCarreira = 4,
			veiculos = {
				{id = 3,  capacidade = 50},
				{id = 67, capacidade = 50},
				{id = 14, capacidade = 50}, 
				{id = 65, capacidade = 50}, 
				{id = 62, capacidade = 50, UnArmed},
			},
			mercadorias = {
				6, 3, 12, 13
			},
		},
	
	}

end


function CategoriaVeiculos:GetVelocidadeCategoria(c)

	for _, cat in pairs(self.categorias) do
		
		if cat.idCategoria == c then
		
			return cat.velocidadeMedia
		end
	
	end
	return 66

end


function CategoriaVeiculos:GetMetrosPorMinuto(c)

	for _, cat in pairs(self.categorias) do
		
		if cat.idCategoria == c then
			
			return math.floor(cat.velocidadeMedia / 60 * 1000)
			
		end
	
	end
	return 66

end


function CategoriaVeiculos:GetVelocidadeCategoriaVeiculo(v)

	for _, cat in pairs(self.categorias) do
			
		for _2, vei in pairs(cat.veiculos) do
			
			if vei.id == v then
				
				return cat.velocidadeMedia
				
			end
			
		end
			
	
	end
	return 66
	
end


function CategoriaVeiculos:GetCapacidadeVeiculo(v)

	for _, cat in pairs(self.categorias) do
			
		for _2, vei in pairs(cat.veiculos) do
			
			if vei.id == v then
				
				return vei.capacidade
				
			end
			
		end
			
	
	end
	return -1

end


function CategoriaVeiculos:GetCapacidadeCategoriaMenor(c)


	for _, cat in pairs(self.categorias) do
	
		if cat.idCategoria == c then
		
			local menorCapacidade = 100000
			for _2, vei in pairs(cat.veiculos) do
			
				if menorCapacidade > vei.capacidade then
					menorCapacidade = vei.capacidade
				end
				
			end
			
			return menorCapacidade
		
		end
		
	end
	
	return -1
end


function CategoriaVeiculos:GetCategoriaById(id)

	for _, c in pairs(self.categorias) do
	
		if c.idCategoria == id then
			return c
		end
	
	end
	
end


function CategoriaVeiculos:GetCategoriaVeiculo(vei)

	for _, c in pairs(self.categorias) do
	
		for _2, v in pairs(c.veiculos) do
		
			if v.id == vei then
				return c.idCategoria
			end
		
		end
	
	end

end


function CategoriaVeiculos:GetMercadoriasVeiculo(vei)

	for _, c in pairs(self.categorias) do
	
		for _2, v in pairs(c.veiculos) do
		
			if v.id == vei then
				return c.mercadorias
			end
		
		end
	
	end

end


function CategoriaVeiculos:ValidaVeiculoMercadoriasEntrega(vei, mercadorias)

	for _, mV in pairs(self:GetMercadoriasVeiculo(vei)) do
	
		for _, m in pairs(mercadorias) do
		
			if m == mV then
				return true
			end
		
		end
	end
	
	return false

end


function CategoriaVeiculos:ValidaVeiculoMercadoriaEntrega(vei, mercadoria)

	for _, mV in pairs(self:GetMercadoriasVeiculo(vei)) do
		
		if mercadoria == mV then
			return true
		end

	end
	
	return false

end