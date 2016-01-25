class 'Alert'

function Alert:__init()
	self.alpha = 255
end


function Alert:Render(position, message, color, size)
	color.a = self.alpha
	Render:DrawText(position + Vector2.One, message, Color(0, 0, 0, self.alpha / 2), size)
	Render:DrawText(position, message, color, size)
	self.alpha = self.alpha - 8
end