class 'Velocimetro'

function Velocimetro:__init()

end


function Velocimetro:Render(posicao, raio)
	
	Render:FillCircle(posicao, raio, Color(0, 0, 0, 100))
	
	Render:DrawCircle(posicao, raio - 8, Color(255, 255, 255, 200))
	--Render:DrawCircle(posicao, raio - 7, Color(255, 255, 255, 200))
	--for i = 1, 7 do
	--	Render:DrawCircle(posicao, raio - 4 - i, Color(255, 255, 255))
	--end
	
	local veiculo = LocalPlayer:GetVehicle()
	
	-- Velocidade
	local velocidade = string.format( "%.00f", veiculo:GetLinearVelocity():Length() * 3.6)
	local velocidadeSize = 46
	Render:DrawText(posicao - Render:GetTextSize(tostring(velocidade), velocidadeSize) / 2, tostring(velocidade), Color(255, 255, 255, 200), velocidadeSize)
	Render:DrawText(posicao + Vector2(-Render:GetTextWidth("Km/h", 18) / 2, Render:GetTextHeight(tostring(velocidade), velocidadeSize) / 2 - 5), "Km/h", Color(255, 255, 255, 200), 18)
	
	-- Nome
	local nome = string.upper(veiculo:GetName())
	Render:DrawText(posicao + Vector2(- Render:GetTextWidth(nome, 12) / 2, raio + 5), nome, Color(255, 255, 255, 200), 12)

end