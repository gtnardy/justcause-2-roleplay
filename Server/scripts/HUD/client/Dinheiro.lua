class 'Dinheiro'

function Dinheiro:__init()
	
	self.textSize = 20
	self.moneyChanged = nil
	--Events:Subscribe("LocalPlayerMoneyChange", self, self.LocalPlayerMoneyChange)
	self.timerVisible = Timer()
	self.timerMoneyChanged = Timer()
end


function Dinheiro:Render(position)
	-- if Game:GetGUIState() == GUIState.PDA or Game:GetGUIState() == GUIState.ContextMenu or self.timerVisible:GetSeconds() < 10 then
		
		 local money = "$ " .. tostring(LocalPlayer:GetMoney())
		 position.x = position.x - Render:GetTextWidth(money, self.textSize)
		 Render:DrawText(position + Vector2.One, money, Color(0, 0, 0, 100), self.textSize)
		 Render:DrawText(position, money, Color(255, 255, 255), self.textSize)
		
		-- if self.moneyChanged then
			-- if self.timerMoneyChanged:GetSeconds() >= 5 then
				-- self.moneyChanged = nil
			-- end
			-- Render:DrawText(position, money, Color(255, 255, 255), self.textSize)
		-- end
	-- end
end


function Dinheiro:LocalPlayerMoneyChange(args)
	self.timerVisible:Restart()
	self.timerMoneyChanged:Restart()
	self.moneyChanged = args.new_money - args.old_money
end