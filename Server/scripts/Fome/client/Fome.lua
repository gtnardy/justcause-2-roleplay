class 'Fome'

function Fome:__init()

	self.Fome = nil
	self.Sede = nil
	
	-- Network:Subscribe("UpdateFome", self, self.UpdateFome)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("NetworkObjectValueChange", self, self.NetworkObjectValueChange)
	
	self.gastoBaseState = {}
	self.gastoBaseState[6] = 0.05
	self.gastoBaseState[7] = 0.075
	self.gastoBaseState[19] = 0.1
	self.gastoBaseState[27] = 0.1
	self.gastoBaseState[28] = 0.1
	self.gastoBaseState[315] = 0.1
	
	self.timer = Timer()
	self.timerUpdate = Timer()
	self.timerSave = Timer()
end


-- function Fome:UpdateFome(args)
	-- if not self.Fome then self.Fome = 0 end
	-- self.Fome = self.Fome + args.fome
	-- if not self.Sede then self.Sede = 0 end
	-- self.Sede = self.Sede + args.sede
-- end


function Fome:ModuleLoad()
	self.Fome = LocalPlayer:GetValue("Fome")
	self.Sede = LocalPlayer:GetValue("Sede")
end


function Fome:NetworkObjectValueChange(args)
	
	if args.object == LocalPlayer then
		if args.key == "Fome" then
			self.Fome = args.value
		else
			if args.key == "Sede" then
				self.Sede = args.value
			end
		end
	end
end


function Fome:PostTick()

	if self.timerSave:GetSeconds() > 60 then
		Network:Send("SaveData", {fome = self.Fome, sede = self.Sede})
		self.timerSave:Restart()
	end
	
	if not self.Fome or not self.Sede then return end
	
	if self.timer:GetSeconds() > 1 then
		self.timer:Restart()
		
		local gasto = self:GetGasto()

		self.Fome = math.max(self.Fome - gasto, 0)
		self.Sede = math.max(self.Sede - (gasto * 2), 0)

		if self.Fome <= 0 or self.Sede <= 0 then
			self:Starving()
		end
	end

	if self.timerUpdate:GetSeconds() > 5 then
		self.timerUpdate:Restart()

		LocalPlayer:SetValue("Fome", self.Fome)
		LocalPlayer:SetValue("Sede", self.Sede)
	end
end


function Fome:GetGasto()
	local gasto = self.gastoBaseState[LocalPlayer:GetBaseState()]
	if not gasto then gasto = 0.05 end
	return gasto
end


function Fome:Starving()
	Network:Send("Starving", LocalPlayer)
end

fome = Fome()