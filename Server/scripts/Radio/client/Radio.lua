class 'Radio'

function Radio:__init()

	self.active = false
	self.musicaAtual = nil
	self.timer = Timer()
	
	self.musics = {
		{bank_id = 25, sound_id = 89, position = LocalPlayer:GetPosition()}, -- country			
		{bank_id = 25, sound_id = 43, position = LocalPlayer:GetPosition()}, -- title
		{bank_id = 25, sound_id = 51, position = LocalPlayer:GetPosition()}, -- hino eletro
		{bank_id = 25, sound_id = 88, position = LocalPlayer:GetPosition()}, -- old west
		{bank_id = 25, sound_id = 54, position = LocalPlayer:GetPosition()}, -- hino harp
		{bank_id = 25, sound_id = 48, position = LocalPlayer:GetPosition()}, -- hino
		{bank_id = 25, sound_id = 53, position = LocalPlayer:GetPosition()}, -- hino militar
		{bank_id = 25, sound_id = 59, position = LocalPlayer:GetPosition()}, -- rico 
		{bank_id = 25, sound_id = 60, position = LocalPlayer:GetPosition()}, -- rico 
		{bank_id = 25, sound_id = 55, position = LocalPlayer:GetPosition()}, -- hino flute
		{bank_id = 25, sound_id = 52, position = LocalPlayer:GetPosition()}, -- calm
		{bank_id = 25, sound_id = 69, position = LocalPlayer:GetPosition()}, -- rico
		{bank_id = 25, sound_id = 68, position = LocalPlayer:GetPosition()}, -- rico main
		{bank_id = 25, sound_id = 86, position = LocalPlayer:GetPosition()}, -- country
		{bank_id = 25, sound_id = 87, position = LocalPlayer:GetPosition()}, -- 
		{bank_id = 25, sound_id = 94, position = LocalPlayer:GetPosition()}, -- hino faccao
		{bank_id = 25, sound_id = 95, position = LocalPlayer:GetPosition()}, -- hino faccao assobio
		{bank_id = 25, sound_id = 99, position = LocalPlayer:GetPosition()}, -- hino faccao grito
		{bank_id = 25, sound_id = 105, position = LocalPlayer:GetPosition()}, -- 
		{bank_id = 25, sound_id = 97, position = LocalPlayer:GetPosition()}, -- hino faccao vós
		{bank_id = 25, sound_id = 101, position = LocalPlayer:GetPosition()}, -- hino som
		{bank_id = 25, sound_id = 106, position = LocalPlayer:GetPosition()}, -- hindu
		{bank_id = 25, sound_id = 116, position = LocalPlayer:GetPosition()}, -- harpa
		{bank_id = 25, sound_id = 107, position = LocalPlayer:GetPosition()}, -- hindu
		{bank_id = 25, sound_id = 118, position = LocalPlayer:GetPosition()},
		{bank_id = 25, sound_id = 117, position = LocalPlayer:GetPosition()},
		{bank_id = 25, sound_id = 120, position = LocalPlayer:GetPosition()},
		{bank_id = 25, sound_id = 119, position = LocalPlayer:GetPosition()},
		{bank_id = 25, sound_id = 121, position = LocalPlayer:GetPosition()},
		{bank_id = 25, sound_id = 122, position = LocalPlayer:GetPosition()},
		{bank_id = 25, sound_id = 169, position = LocalPlayer:GetPosition()}, -- main menu
		{bank_id = 25, sound_id = 171, position = LocalPlayer:GetPosition()}, -- bar praia
		{bank_id = 25, sound_id = 172, position = LocalPlayer:GetPosition()}, -- hindu
		{bank_id = 25, sound_id = 173, position = LocalPlayer:GetPosition()}, -- hindu flute
		{bank_id = 25, sound_id = 174, position = LocalPlayer:GetPosition()}, -- viola
		{bank_id = 25, sound_id = 178, position = LocalPlayer:GetPosition()}, -- rico parachute
		{bank_id = 25, sound_id = 148, position = LocalPlayer:GetPosition()}, -- mile club
	}
	

	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("LocalPlayerEnterVehicle", self, self.LocalPlayerEnterVehicle)
	Events:Subscribe("LocalPlayerExitVehicle", self, self.LocalPlayerExitVehicle)
	Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	
	self:NextMusic()
end


function Radio:NextMusic()
	self:PullMusic()
	if self.musicaAtual then
		self.musicaAtual:Remove()
	end
	self.musicaAtual = ClientSound.Create(AssetLocation.Game, self.musics[1])
	self.musicaAtual:SetParameter(0, 0)
	self.musicaAtual:Play()
end


function Radio:TurnOn()
	if not self.musicaAtual then
		self:NextMusic()
	end
	
	self.musicaAtual:SetParameter(0, 1)
	self.active = true
end


function Radio:TurnOff(vehiclePosition)
	if self.musicaAtual then
		if vehiclePosition then
			self.musicaAtual:SetPosition(vehiclePosition)
		end
	end
	self.timer:Restart()	
	self.active = false	
end


function Radio:LocalPlayerEnterVehicle(args)
	self:TurnOn()
end


function Radio:LocalPlayerExitVehicle(args)
	self:TurnOff(args.vehicle:GetPosition() + Vector3(0, 1, 0))
end


function Radio:PullMusic()
	table.insert(self.musics, self.musics[1])
	table.remove(self.musics, 1)
end


function Radio:Render()
	if self.active and self.musicaAtual then
		self.musicaAtual:SetPosition(Camera:GetPosition() + Vector3(0, -1, 0))
		if not self.musicaAtual:IsPlaying() then
			self:NextMusic()
			self:TurnOn()
		end
		
		if not LocalPlayer:InVehicle() then
			self:TurnOff()
		end
	end
end


function Radio:PostTick()
	if not self.active and self.timer:GetSeconds() > 10 then
		self.musicaAtual:SetParameter(0, 0)
		self.musicaAtual:SetParameter(1, 0)
		self.timer:Restart()
	end
end


function Radio:ModuleUnload()
	if self.musicaAtual then
		self.musicaAtual:Remove()
	end
end


function Radio:ModuleLoad()
	if LocalPlayer:InVehicle() then
		self:TurnOn()
	end
end


Radio = Radio()