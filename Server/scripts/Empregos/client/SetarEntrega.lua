class 'SetarEntrega'

function SetarEntrega:__init()

	self.setando = false
	
	self.timer = Timer()
	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("KeyUp", self, self.KeyUp)

	self.tempo = 0
	self.distancia = 0
	
	self.angulo = Angle()
	self.pontos = {} -- posicao
	
end


function SetarEntrega:KeyUp(args)
	
	if LocalPlayer:GetValue("NivelUsuario") == 2 or LocalPlayer:GetValue("NivelUsuario") == 3 then
		if args.key == 45 then
			
			if LocalPlayer:InVehicle() then
				
				if self.setando then
					
					table.insert(self.pontos, LocalPlayer:GetVehicle():GetPosition())
					Chat:Print("Setando ponto "..#self.pontos-1 .." de descarga em: "..tostring(self.pontos[#self.pontos]), Color(255,0,0))
				else
					self:Limpar()
					self:Iniciar()
				end
				
			end
		
		end
		

		
		if self.setando then
		
			if args.key == 46 then
			
				table.remove(self.pontos, #self.pontos)
				Chat:Print("O ultimo ponto foi deletado!", Color(255,0,0))
				return
			end	
			
			if args.key == 35 then
				
				if LocalPlayer:InVehicle() then
					
					
						table.insert(self.pontos, LocalPlayer:GetVehicle():GetPosition())
						self.distancia = math.floor(self.distancia)
						Chat:Print("Setando final ("..#self.pontos-1 ..") em: "..tostring(self.pontos[#self.pontos]) .. " - "..self.tempo.." segundos - "..self.distancia.. " m" , Color(255,0,0))
						self:Finalizar()
						
					
				end
			
			end
		end
		
		
		if args.key == 36 then
		
			self:Limpar()
			Chat:Print("Resetado!", Color(255,0,0))
			return
		end
	end

end


function SetarEntrega:Finalizar()
	
	if #self.pontos <= 1 then
		Chat:Print("Voce setou apenas 1 ou menos pontos!", Color(255,0,0))
		return
	end

	Network:Send("NovoServico", {angulo = self.angulo, pontos = self.pontos, tempo = self.tempo, distancia = self.distancia})
	self:Limpar()
	
end


function SetarEntrega:Render()
	if self.setando then
		Render:DrawText(Render.Size / 2 - Vector2(0, 220), "Distancia: "..self.distancia.. " m\nTempo: "..self.tempo.."\nEntregas: #"..#self.pontos, Color(255,0,0,150))
	end

end


function SetarEntrega:Iniciar()

	Chat:Print("Iniciando... Va para os pontos onde deseja setar e pressione 'INSERT' para adicionar uma descarga!", Color(255,0,0))
	Chat:Print("Pressione END (acima das setas) para finalizar e salvar.", Color(255,0,0))
	Chat:Print("Pressione DELETE para deletar o ultimo ponto.", Color(255,0,0))
	Chat:Print("Pressione HOME para resetar tudo.", Color(255,0,0))
	
	self.angulo = LocalPlayer:GetVehicle():GetAngle()
	self.pontos[1] = LocalPlayer:GetVehicle():GetPosition()
	self.setando = true

end


function SetarEntrega:Limpar()

	self.tempo = 0
	self.setando = false
	self.timer:Restart()
	self.distancia = 0
	self.angulo = Angle()
	self.pontos = {}

end


function SetarEntrega:PostTick()

	if self.timer:GetSeconds() > 1 then
		
		if self.setando then
			self.tempo = self.tempo + 1
			
			if LocalPlayer:InVehicle() then
			
				local velocidade = -LocalPlayer:GetVehicle():GetAngle() * LocalPlayer:GetVehicle():GetLinearVelocity()
				local velocidadeFrente = -velocidade.z
				-- if velocidadeFrente < 0 then
					-- velocidadeFrente = velocidadeFrente * -1
				-- end
				self.distancia = self.distancia + velocidadeFrente
			end
		
		end
		self.timer:Restart()
	end
	
end


setarEntrega = SetarEntrega()