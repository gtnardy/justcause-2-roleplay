class 'Clothings'

function Clothings:__init()

	self:SetLanguages()
	self.clothing_player = {}
	
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("EntitySpawn", self, self.EntitySpawn)
	Events:Subscribe("EntityDespawn", self, self.EntityDespawn)
	Events:Subscribe("NetworkObjectValueChange", self, self.PlayerValueChange)
	Events:Subscribe("SharedObjectValueChange", self, self.PlayerValueChange)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)	
end


function Clothings:Render()
	for player in Client:GetStreamedPlayers() do
		self:MoveClothing(player)
	end

	self:MoveClothing(LocalPlayer)	
end


function Clothings:MoveClothing(player)
	if not IsValid(player) then return end
	
	local clothings = self.clothing_player[player:GetId()]
	for typeClothing, clothing in pairs(clothings) do
		if clothing and IsValid(clothing) then
			-- Set the angle of the hat on every render frame
			clothing:SetAngle(player:GetBoneAngle("ragdoll_Head"))
			
			-- Create offsets from the default positioning of the hat to better fit over player models heads
			-- This offset doesn't perfectly work for all player models. Tweaking may be necessary.
			local hatoffset = clothing:GetAngle() * Vector3(0,1.62,.03)
			
			-- Set the position of the hat on every render frame
			clothing:SetPosition(player:GetBonePosition("ragdoll_Head") - hatoffset) 
		end
	end
end


function Clothings:EntitySpawn(args)
	if args.entity.__type == "Player" then
		self:CreateClothing(args.entity)
	end
end


function Clothings:EntityDespawn(args)
	if args.entity.__type == "Player" then
		self:DestroyClothing(args.entity)
	end
end


function Clothings:DestroyClothing(player)
	if not self.clothing_player[player:GetId()] then return end
	
	for typeClothing, clothing in pairs(self.clothing_player[player:GetId()]) do
		if IsValid(clothing, false) then
			clothing:Remove()
		end
	end
	self.clothing_player[player:GetId()] = nil
end


function Clothings:CreateClothing(player)
	self:DestroyClothing(player)	

	local clothings = player:GetValue("Clothings")

	if not clothings then return end
	self.clothing_player[player:GetId()] = {}
	
	for typeClothing, id in pairs(clothings) do
		self.clothing_player[player:GetId()][typeClothing] = ClientStaticObject.Create({
			position = player:GetBonePosition("ragdoll_Head"),
			angle = player:GetBoneAngle("ragdoll_Head"),
			model = id
		})
	end
end


function Clothings:PlayerValueChange(args)
	if (args.object.__type == "Player" or args.object.__type == "LocalPlayer") and args.key == "Clothings" then
		self:CreateClothing(args.object)
	end
end


function Clothings:ModuleLoad()
	for p in Client:GetStreamedPlayers() do
		self:CreateClothing(p)
	end

	self:CreateClothing(LocalPlayer)
end


function Clothings:ModuleUnload()
	for idPlayer, clothings in pairs(self.clothing_player) do
		for typeClothing, clothing in pairs(clothings) do
			if IsValid(clothing, false) then
				clothing:Remove()
			end
		end
	end
end


function Clothings:SetLanguages()
	self.Languages = Languages()
	--self.Languages:SetLanguage()
end


Clothings = Clothings()