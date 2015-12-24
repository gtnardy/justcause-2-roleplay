class 'PlayerController'

function PlayerController:__init()

	Network:Subscribe("UpdatePlayerData", self, self.UpdatePlayerData)
end


function PlayerController:UpdatePlayerData(values)

	for key, value in pairs(values) do

		LocalPlayer:SetValue(key, value)
	end
end


PlayerController = PlayerController()