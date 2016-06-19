class 'Weapons'

function Weapons:__init()
	
	self.textSize = 20

end


function Weapons:Render(position, size, languages)
	local weapon = LocalPlayer:GetEquippedWeapon()
	if weapon and weapon.id != 0 then
		local ammo_clip = tostring(weapon.ammo_clip)
		position.x = position.x - Render:GetTextWidth(ammo_clip, self.textSize)
		Render:DrawShadowedText(position, ammo_clip, Color(150, 150, 150), self.textSize)
		
		local ammo_reserve = tostring(weapon.ammo_reserve)
		position.x = position.x - Render:GetTextWidth(ammo_reserve, self.textSize) - 5
		Render:DrawShadowedText(position, ammo_reserve, Color.White, self.textSize)
	end
end