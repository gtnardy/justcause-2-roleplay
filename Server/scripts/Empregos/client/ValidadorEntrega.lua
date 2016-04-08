class 'EntregaFragil'

function EntregaFragil:__init(args)

	self.active = true
	
	if args.tolerancia then
		
		self.tolerancia = tonumber(args.tolerancia) -- 0-100
		if self.tolerancia == 0 then
			self.tolerancia = 10
		end
	else
		self.tolerancia = 50
	end	
	
	self.veiculo = LocalPlayer:GetVehicle()
	
	self.vidaVeiculo = 1
	
	if IsValid(self.veiculo) then
	
		self.vidaVeiculo = self.veiculo:GetHealth()
	end
	
	
	self.danoMercadoria = 0
	
	
	Events:Subscribe("Render", self, self.Render)
end


function EntregaFragil:GetDesconto()

	return self:GetPorcentagemDanoMercadoria() / 2 / 100

end


function EntregaFragil:GetPorcentagemDanoMercadoria()
	
	return math.floor(self.danoMercadoria * 100 / (self.tolerancia / 100))

end


function EntregaFragil:toString()
	
	local txt = {}
	txt[1] = "Dano na Mercadoria: "
	
	if LocalPlayer:GetValue("Lingua") == 1 then
		txt[1] = "Product Damage: "
	end
	txt[2] = self:GetPorcentagemDanoMercadoria() .. "%"
	
	return txt

end


function EntregaFragil:Render()
	
	if self.active then
	
		if IsValid(self.veiculo) then
		
			if self:GetPorcentagemDanoMercadoria() >= 100 then
				self.danoMercadoria = self.tolerancia
				return
			end
			if self.veiculo:GetHealth() < self.vidaVeiculo then

				self.danoMercadoria = self.danoMercadoria + (self.vidaVeiculo - self.veiculo:GetHealth())
				
				
				self.vidaVeiculo = self.veiculo:GetHealth()
			else
				if self.veiculo:GetHealth() > self.vidaVeiculo then
					self.vidaVeiculo = self.veiculo:GetHealth()
				
				end
			end
			
		else
		
			self.veiculo = LocalPlayer:GetVehicle()
			
			if IsValid(self.veiculo) then
			
				self.vidaVeiculo = self.veiculo:GetHealth()
			
			end
		end
		
	end
	
end


function EntregaFragil:Finalizar()

	self.active = false

end


function EntregaFragil:Aprovou()
	

	if self.active then
		if self:GetPorcentagemDanoMercadoria() >= 100 then
			return false
		end
	end
	
	return true
	
end



class 'EntregaPerecivel'

function EntregaPerecivel:__init(args)

	self.active = true
	
	if args.tempo then
		self.tempo = tonumber(args.tempo) -- segundos
	else
		self.tempo = 30
	end	
	
	self.timer = Timer()
	self.timer:Restart()
	
end


function EntregaPerecivel:GetDesconto()

	local tempoRestante = self:GetTempoRestante()
	
	if tempoRestante < 0 then
	
		if math.abs(tempoRestante) > 100 then
			return 0.5
		else
			return math.abs(tempoRestante) / 100 / 2
		end
	
	end
	
	return 0

end


function EntregaPerecivel:toString()
	
	local minutos = self:GetTempoRestante() / 60
	
	local txt = {}
	
	txt[1] = "Tempo: "
	if LocalPlayer:GetValue("Lingua") == 1 then
		txt[1] = "Time: "
	end
	txt[2] = math.floor(minutos + 1) .. " min"
	if minutos < 1 then
		txt[2] = math.floor(self:GetTempoRestante()) .. " sec"
	end
	
	return txt

end


function EntregaPerecivel:GetTempoRestante()


	return self.tempo - self.timer:GetSeconds()
	
end


function EntregaPerecivel:Finalizar()

	self.active = false

end


function EntregaPerecivel:Aprovou()

	
	if self:GetTempoRestante() <= 0 then
		return false
	end
	
	return true
	
end