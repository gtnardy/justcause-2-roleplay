class 'HealthBar'

function HealthBar:__init()

end


function HealthBar:Render(posicao, tamanho)
	-- Vida
	local tamBarra = math.max(LocalPlayer:GetHealth() * (tamanho.x - 4), 0)
	Render:FillArea(posicao - Vector2(2, 2), tamanho, Color(0, 0, 0, 100))
	Render:FillArea(posicao, tamanho - Vector2(4, 4), Color(120, 215, 121, 50))
	Render:FillArea(posicao, Vector2(tamBarra, tamanho.y) - Vector2(0, 4), Color(120, 215, 121, 200))
end