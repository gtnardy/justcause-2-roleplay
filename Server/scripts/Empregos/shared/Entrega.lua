class 'Entrega'

function Entrega:__init(args)

	if args.id then
		self.id = args.id
	else
		self.id = 0
	end
	
	if args.pagamento then
		self.pagamento = args.pagamento
	else
		self.pagamento = 0
	end
	
	if args.capacidadeMinima then
		self.capacidadeMinima = args.capacidadeMinima
	else
		self.capacidadeMinima = -2
	end
	
	if args.pagamentoMercadoria then
		self.pagamentoMercadoria = args.pagamentoMercadoria
	else
		self.pagamentoMercadoria = -1
	end
	
	
	if args.mercadorias then
		self.mercadorias = args.mercadorias
	else
		self.mercadorias = {}
	end	
	
	if args.mercadoria then
		self.mercadoria = args.mercadoria
	else
		self.mercadoria = "NULL"
	end
	
	
	if args.descargas then
		self.descargas = args.descargas
	else
		self.descargas = {}
	end
	
	
	if args.tempo then
		self.tempo = args.tempo
	else
		self.tempo = 15
	end	
	
	
	if args.angulo then
		self.angulo = args.angulo
	else
		self.angulo = Angle(0,0,0)
	end	

	if args.distancia then
		self.distancia = args.distancia
	else
		self.distancia = 100
	end

end


function Entrega:GetMercadoria(id)

	if self.mercadorias[id] then
		return true
	else
		return false
	end

end


function Entrega:GetCountMercadorias()

	i = 0
	for _, m in pairs(self.mercadorias) do
		
		i = i + 1
		
	end
	return i

end


function Entrega:AddMercadoria(idMercadoria, m)
	
	if m then
		self.mercadorias[tonumber(idMercadoria)] = m

	else
		self.mercadorias[tonumber(idMercadoria)] = true
	end
	

end


function Entrega:SetDescarga(i, descarga)

	self.descargas[i] = descarga

end


function Entrega:SetMercadoria(m)

	self.mercadoria = m

end
