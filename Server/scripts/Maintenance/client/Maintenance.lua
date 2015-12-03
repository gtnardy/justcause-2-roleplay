class 'Maintenance'

function Maintenance:__init()

	Events:Subscribe("PostRender", self, self.PostRender)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	
	self.titleSize = 32
	self.titleText = "SERVIDOR EM MANUTENÇÃO"
	
	self.subTitleSize = 16
	self.subTitleText = "SERVER DOWN FOR MAINTENANCE"
	
	self.leftInfoSize = 16
	self.leftInfoText = "SIGA NOSSO FACEBOOK"
	
	self.rightInfoText = "FOLLOW OUR FACEBOOK"
	
	self.subLeftInfoSize = 24
	self.subLeftInfoText = "fb.com/jc2rp"
	
end

function Maintenance:PostRender()

	-- Title
	local titlePosition = Vector2(Render.Width, Render.Height / 4) / 2 - Render:GetTextSize(self.titleText, self.titleSize) / 2
	self:DrawTextShading(titlePosition, self.titleText, Color(255, 255, 255), self.titleSize)
	
	-- SubTitle
	local subTitlePosition = Vector2(Render.Width, Render.Height / 4) / 2 - Render:GetTextSize(self.subTitleText, self.subTitleSize) / 2 + Vector2(0, Render:GetTextHeight(self.titleText, self.titleSize))
	self:DrawTextShading(subTitlePosition, self.subTitleText, Color(255, 255, 255), self.subTitleSize)
	
	-- Left Info
	local leftInfoPosition = Vector2(Render.Width / 4 - Render:GetTextWidth(self.leftInfoText, self.leftInfoSize) / 2, Render.Height / 3)
	self:DrawTextShading(leftInfoPosition, self.leftInfoText, Color(255, 255, 255), self.leftInfoSize)
	
	-- SubLeft Info
	local subLeftInfoPosition = Vector2(Render.Width / 4 - Render:GetTextWidth(self.leftInfoText, self.leftInfoSize) / 2, Render.Height / 3) + Vector2(Render:GetTextWidth(self.leftInfoText, self.leftInfoSize) / 2 - Render:GetTextWidth(self.subLeftInfoText, self.subLeftInfoSize) / 2, Render:GetTextHeight(self.leftInfoText, self.leftInfoSize))
	self:DrawTextShading(subLeftInfoPosition, self.subLeftInfoText, Color(46, 204, 113), self.subLeftInfoSize)	
	
	-- Right Info
	local rightInfoPosition = Vector2(Render.Width - Render.Width / 4 - Render:GetTextWidth(self.rightInfoText, self.leftInfoSize) / 1.5, Render.Height / 3)
	self:DrawTextShading(rightInfoPosition, self.rightInfoText, Color(255, 255, 255), self.leftInfoSize)
	
	-- SubRight Info
	local subRightInfoPosition = Vector2(Render.Width - Render.Width / 4 - Render:GetTextWidth(self.rightInfoText, self.leftInfoSize) / 1.5, Render.Height / 3) + Vector2(Render:GetTextWidth(self.leftInfoText, self.leftInfoSize) / 2 - Render:GetTextWidth(self.subLeftInfoText, self.subLeftInfoSize) / 2, Render:GetTextHeight(self.leftInfoText, self.leftInfoSize))
	self:DrawTextShading(subRightInfoPosition, self.subLeftInfoText, Color(46, 204, 113), self.subLeftInfoSize)
end

function Maintenance:DrawTextShading(pos, text, color, size)

	Render:DrawText(pos + Vector2(1, 1), text, Color(0, 0, 0, 100), size)
	Render:DrawText(pos, text, color, size)
end

function Maintenance:LocalPlayerInput(args)
	
	return false
end

Maintenance = Maintenance()