function Player:GetCustomName()
	local name = self:GetValue("Name")
	return name and name or self:GetName()
end