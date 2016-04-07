function Player:GetCustomName()
	local name = self:GetValue("Name")
	return name and name or self:GetName()
end

function Player:GetLevel()
	local level = self:GetValue("Level")
	return level and level or 1
end