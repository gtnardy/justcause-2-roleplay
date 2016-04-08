class 'Estrelas'

function Estrelas:__init(args)

	self.estrelas = 0
	self.estrela = "*"
	self.posicao = Vector2(Render.Width - 30, 60) 
	self.size = 50
	self.piscando = true
	self.tickPiscando = true
	self.timer = Timer()
	self.tempoPiscando = 10
	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("PostTick", self, self.PostTick)
end


function Estrelas:PostTick()

	if Game:GetState() == GUIState.Game then
		if self.timer:GetSeconds() > 0.4 then
			
			if self.piscando then
			
				self.tempoPiscando = self.tempoPiscando - 0.4
				self.tickPiscando = not(self.tickPiscando)
				if self.tempoPiscando <= 0 then
				
					self.piscando = false
				end
			end
			
			self.timer:Restart()
		end
	end

end


function Estrelas:SetEstrelas(num)

	self.estrelas = num
	self.tempoPiscando = 10
	self.piscando = true
	
end


function Estrelas:Borda(pos, text, color, size)

	Render:DrawText(pos + Vector2(2,0), text, color, size) 
	Render:DrawText(pos + Vector2(0,2), text, color, size) 
	Render:DrawText(pos + Vector2(-2,0), text, color, size) 
	Render:DrawText(pos + Vector2(0,-2), text, color, size) 
	
end


function Estrelas:Render()
	
	if self.estrelas > 0 then
		
		local pos = self.posicao
		
		for e = 1, 7 do
			
			pos = pos - Vector2(Render:GetTextWidth(self.estrela, self.size) + 2, 0)
			
			if e <= self.estrelas then
				
				local cor = Color(255,255,255)
				if self.piscando then
				
					if self.tickPiscando then
						cor = Color(120,120,120)
					end
				end
				
				self:Borda(pos, self.estrela, Color(20,20,20), self.size) 
				self:Borda(pos - Vector2(1,0), self.estrela, Color(20,20,20), self.size) 
				Render:DrawText(pos, self.estrela, cor, self.size)
				Render:DrawText(pos - Vector2(1,0), self.estrela, cor, self.size)
			else
			
				self:Borda(pos, self.estrela, Color(20,20,20,50), self.size) 
				Render:DrawText(pos, self.estrela, Color(20,20,20,150), self.size)

			end

		end
		
	end

end