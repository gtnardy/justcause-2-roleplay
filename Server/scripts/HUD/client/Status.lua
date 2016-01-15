class 'Status'

function Status:__init()

end


function Status:Render(posicao, tamanho)
	
	-- Vida
	local tamBarra = LocalPlayer:GetHealth() * tamanho.x
	Render:FillArea(posicao - Vector2(2, 2), tamanho, Color(0, 0, 0, 100))
	Render:FillArea(posicao, tamanho - Vector2(4, 4), Color(120, 215, 121, 50))
	Render:FillArea(posicao, Vector2(tamBarra, tamanho.y) - Vector2(4, 4), Color(120, 215, 121, 200))
end