class 'Clothings'

function Clothings:__init()
	
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("PlayerJoin", self, self.PlayerJoin)
end

		
function Clothings:UpdatePlayer(player)
	local model_id = 24

	local resultClothings = SQL:Query("SELECT IdClothing, ClothingType FROM PlayerClothing WHERE IdPlayer = ? AND Equipped = 1")
	resultClothings:Bind(1, player:GetSteamId().id)
	resultClothings = resultClothings:Execute()
	local clothings = {}
	for i, line in ipairs(resultClothings) do
		if line.ClothingType == "SKIN" then
			model_id = tonumber(line.IdClothing)
		end
		clothings[line.ClothingType] = line.IdClothing
	end
	
	player:SetModelId(model_id)
	player:SetNetworkValue("Clothings", clothings)
end


function Clothings:PlayerJoin(args)
	self:UpdatePlayer(args.player)
end


function Clothings:ModuleLoad()
	for player in Server:GetPlayers() do
		self:UpdatePlayer(player)
	end
end


function Clothings:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS PlayerClothing(" ..
		"IdPlayer VARCHAR(20) NOT NULL," ..
		"IdClothing VARCHAR(100) NOT NULL," ..
		"ClothingType VARCHAR(20) NOT NULL," ..
		"Equipped BOOLEAN NOT NULL DEFAULT FALSE," ..
		"PRIMARY KEY (IdPlayer, IdClothing))")
end

Clothings = Clothings()