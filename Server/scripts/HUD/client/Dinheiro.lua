class 'Dinheiro'

function Dinheiro:__init()
	
	self.textSize = 20
	self.moneyChanged = nil
	
	Events:Subscribe("LocalPlayerMoneyChange", self, self.LocalPlayerMoneyChange)
	self.timerVisible = Timer()
	self.timerMoneyChanged = Timer()
end


function Dinheiro:Render(position)

	if self.moneyChanged then
		local text = "+" .. tostring(self.moneyChanged)
		local color = Color(46, 204, 113)
		if self.moneyChanged < 0 then
			color = Color(231, 76, 60)
			text = "-" .. tostring(self.moneyChanged)
		end
		
		Render:DrawShadowedText(position + Vector2(-Render:GetTextWidth(text, self.textSize), 20), text, color, self.textSize)
		if self.timerMoneyChanged:GetSeconds() >= 5 then
			self.moneyChanged = nil
		end
	end
	
	local money = "$ " .. tostring(LocalPlayer:GetMoney())
	position.x = position.x - Render:GetTextWidth(money, self.textSize)
	Render:DrawShadowedText(position, money, Color(255, 255, 255), self.textSize)
end


function Dinheiro:LocalPlayerMoneyChange(args)
	self.timerVisible:Restart()
	self.timerMoneyChanged:Restart()
	self.moneyChanged = args.new_money - args.old_money
end