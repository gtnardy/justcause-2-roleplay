function Player:GiveJobExperience(experience)
	Events:Fire("EarnJobExperience", {player = self, experience = experience})
	self:GiveExperience(experience)
end

function Player:GiveExperience(experience)
	Events:Fire("EarnExperience", {player = self, experience = experience})
end