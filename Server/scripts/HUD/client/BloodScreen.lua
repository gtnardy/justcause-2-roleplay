class 'BloodScreen'

function BloodScreen:__init()

	self.image = Image.Create(AssetLocation.Resource, "Blood_Screen")
	
	self.timer = Timer()
	Events:Subscribe("LocalPlayerExplosionHit", self, self.LocalPlayerHit)
	Events:Subscribe("LocalPlayerBulletHit", self, self.LocalPlayerHit)
	Events:Subscribe("LocalPlayerForcePulseHit", self, self.LocalPlayerHit)
end


function BloodScreen:LocalPlayerHit(args)
	if args.damage > 0 then
		self.timer:Restart()
	end
end


function BloodScreen:Render()
	
	local health = LocalPlayer:GetHealth()
	if health < 0.4 then
		self.image:SetAlpha(math.sqrt(0.4 - health))
		self.image:SetSize(Render.Size)
		self.image:Draw()
		
		if health < 0.2 then
			local color = Color.Red
			color.a = 255*(0.3-health)
			Render:FillArea(Vector2(0, 0), Render.Size, color)
		end
	elseif self.timer:GetSeconds() < 5 then
		self.image:SetAlpha(math.sqrt(0.5 - self.timer:GetSeconds() / 8))
		self.image:SetSize(Render.Size)
		self.image:Draw()
	end

end