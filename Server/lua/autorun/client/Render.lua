function Render:DrawShadowedText(...) return DrawShadowedText(...) end

function DrawShadowedText(position, text, color, size)
	Render:DrawText(position + Vector2.One, text, Color(0, 0, 0, 150), size)
	Render:DrawText(position, text, color, size)
end