class 'Velocimetro'

function Velocimetro:__init()
	
	self.velocidadeSize = 46
end


function Velocimetro:Render(posicao, raio)
	
	Render:FillCircle(posicao, raio, Color(0, 0, 0, 75))
	
	Render:DrawCircle(posicao, raio - 9, Color(255, 255, 255, 200))
	--for i = 1, 7 do
	--	Render:DrawCircle(posicao, raio - 4 - i, Color(255, 255, 255))
	--end
	
	local veiculo = LocalPlayer:GetVehicle()
	
	-- Velocidade
	local velocidade = string.format( "%.00f", veiculo:GetLinearVelocity():Length() * 3.6)
	Render:DrawText(posicao - Render:GetTextSize(tostring(velocidade), self.velocidadeSize) / 2, tostring(velocidade), Color(255, 255, 255, 200), self.velocidadeSize)
	Render:DrawText(posicao + Vector2(-Render:GetTextWidth("Km/h", 18) / 2, Render:GetTextHeight(tostring(velocidade), self.velocidadeSize) / 2 - 5), "Km/h", Color(255, 255, 255, 200), 18)
	
	-- Nome
	local nome = string.upper(veiculo:GetName())
	Render:DrawText(posicao + Vector2(- Render:GetTextWidth(nome, 14) / 2, raio + 8), nome, Color(255, 255, 255, 200), 14)

end