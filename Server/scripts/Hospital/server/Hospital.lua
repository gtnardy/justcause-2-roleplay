class 'Hospital'

function Hospital:__init()
	self.hospitals = {}
	self.priceInsurance = 5000
	
	Events:Subscribe("PlayerDeath", self, self.PlayerDeath)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)

	Network:Subscribe("BuyLifeInsurance", self, self.BuyLifeInsurance)
end


function Hospital:PlayerDeath(args)
		
	-- {distance, position}
	local nearHospital = nil
	for _, hospital in pairs(self.hospitals) do
		local distance = Vector3.Distance(args.player:GetPosition(), hospital.position)
		if not nearHospital or distance < nearHospital.distance then
			nearHospital = {distance = distance, position = hospital.position}
		end
	end
	
	if nearHospital then
		args.player:SetValue("UltimaPosicao", nearHospital.position)
		return false
	end
end


function Hospital:BuyLifeInsurance(args, player)
	if player:GetMoney() < self.priceInsurance then return end
	
	local command = SQL:Command("UPDATE Player SET LifeInsurance = 1 WHERE Id = ?")
	command:Bind(1, player:GetSteamId().id)
	command:Execute()
	
	player:SetNetworkValue("LifeInsurance", true)
end


function Hospital:ModuleLoad()
	local query = SQL:Query("SELECT Position FROM Establishment WHERE TYPE = 17")
	local result = query:Execute()
	for _, line in pairs(result) do
		table.insert(self.hospitals, {position = Vector3.ParseString(line.Position)})
	end
end


Hospital = Hospital()