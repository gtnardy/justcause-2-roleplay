class 'Feeding'

function Feeding:__init()

	self.Fome = nil
	self.Sede = nil
	
	-- Network:Subscribe("UpdateFome", self, self.UpdateFome)
	Events:Subscribe("ModulesLoad", self, self.ModulesLoad)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("NetworkObjectValueChange", self, self.NetworkObjectValueChange)
	
	Network:Subscribe("ConsumeFood", self, self.ConsumeFood)
	
	self.gastoBaseState = {}
	self.gastoBaseState[6] = 0.025
	self.gastoBaseState[7] = 0.03
	self.gastoBaseState[19] = 0.05
	self.gastoBaseState[27] = 0.05
	self.gastoBaseState[28] = 0.05
	self.gastoBaseState[315] = 0.05
	
	self.timer = Timer()
	self.timerUpdate = Timer()
	self.timerSave = Timer()
end


function Feeding:ConsumeFood(args)
	self.Fome = math.max(math.min(100, self.Fome + args.hunger), 0)
	self.Sede = math.max(math.min(100, self.Sede + args.thirst), 0)
	LocalPlayer:SetValue("Fome", self.Fome)
	LocalPlayer:SetValue("Sede", self.Sede)
	Events:Fire("UpdateDataStatus")
end


-- function Feeding:UpdateFome(args)
	-- if not self.Fome then self.Fome = 0 end
	-- self.Fome = self.Fome + args.fome
	-- if not self.Sede then self.Sede = 0 end
	-- self.Sede = self.Sede + args.sede
-- end


function Feeding:ModuleLoad()
	self.Fome = LocalPlayer:GetValue("Fome")
	self.Sede = LocalPlayer:GetValue("Sede")
end


function Feeding:ModulesLoad()
	Events:Fire("UpdateFeedingList", FeedingList()["FOOD"])
end


function Feeding:NetworkObjectValueChange(args)
	
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


function Feeding:PostTick()

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


function Feeding:GetGasto()
	local gasto = self.gastoBaseState[LocalPlayer:GetBaseState()]
	if not gasto then gasto = 0.05 end
	return gasto
end


function Feeding:Starving()
	Network:Send("Starving", LocalPlayer)
end

Feeding = Feeding()