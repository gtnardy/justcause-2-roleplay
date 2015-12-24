class("Tela")

function Tela:__init()

	self.nome = "Tela Pai"
	self.active = false
	
end


function Tela:SetActive(bool)
	self.active = bool
	Chat:SetEnabled(not bool)
end


function Tela:GetActive()
	return self.active
end


function Tela:Render()
	Chat:Print("Tela não implementada!", Color(255, 0, 0))
end