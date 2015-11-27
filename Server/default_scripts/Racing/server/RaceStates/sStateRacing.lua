class("StateRacing")

function StateRacing:__init(race) ; EGUSM.SubscribeUtility.__init(self)
	self.race = race
	self.timer = Timer()
	-- Key: number of CPs completed.
	-- Value: map of player ids that have completed key number of CPs.
	--     Key: player Id, value = pointermabob to checkpoint distance.
	self.racePosTracker = {}
	-- Starts at 0. When someone hits the first checkpoint, this becomes 1, etc.
	self.currentCheckpoint = 0
	-- Number of times PostTick has been called.
	self.numTicks = 0
	
	-- Array of RacerBases. This is used to update one RacerBase per tick.
	self.updateList = {}
	for id , racer in pairs(self.race.playerIdToRacer) do
		table.insert(self.updateList , racer)
	end
	for id , spectator in pairs(self.race.playerIdToSpectator) do
		table.insert(self.updateList , spectator)
	end
	
	self.racePosTracker[0] = {}
	for id , racer in pairs(self.race.playerIdToRacer) do
		racer.bestTimeTimer = Timer()
		self.racePosTracker[0][id] = racer.targetCheckpointDistanceSqr -- wut
	end
	
	Events:Fire("RaceStart" , {id = self.race.id})
	
	self:EventSubscribe("PlayerEnterCheckpoint")
	self:EventSubscribe("PlayerEnterVehicle")
	self:EventSubscribe("PostTick")
	self:EventSubscribe("PlayerSpawn")
	self:NetworkSubscribe("ReceiveCheckpointDistanceSqr")
	self:NetworkSubscribe("SpectateRequestTarget")
	self:NetworkSubscribe("RequestRespawn")
end

function StateRacing:End()
	self:Destroy()
end

function StateRacing:GetRacePosInfo()
	-- TODO: the actual fuck
	local finishedPlayerIds = {}
	for index , racer in ipairs(self.race.finishedRacers) do
		table.insert(finishedPlayerIds , racer.playerId)
	end
	
	return {
		self.race.state.racePosTracker ,
		self.race.state.currentCheckpoint ,
		finishedPlayerIds
	}
end

-- Race callbacks

function StateRacing:RacerLeave(racer)
	-- Remove them from self.updateList.
	for index , racerBase in ipairs(self.updateList) do
		if racerBase.player == racer.player then
			table.remove(self.updateList , index)
			break
		end
	end
	
	-- Remove them from the racePosTracker.
	local removed = false
	for cp , map in pairs(self.racePosTracker) do
		for id , bool in pairs(self.racePosTracker[cp]) do
			if id == racer.playerId then
				self.racePosTracker[cp][id] = nil
				removed = true
				break
			end
		end
		if removed then
			break
		end
	end
end

function StateRacing:SpectatorJoin(spectator)
	-- Add them to self.updateList.
	table.insert(self.updateList , spectator)
end

function StateRacing:SpectatorLeave(spectator)
	-- Remove them from self.updateList.
	for index , racerBase in ipairs(self.updateList) do
		if racerBase.player == spectator.player then
			table.remove(self.updateList , index)
			break
		end
	end
end

-- Events

function StateRacing:PlayerEnterCheckpoint(args)
	local racer = self.race.playerIdToRacer[args.player:GetId()]
	if racer then	
		local checkpoint = self.race.course.checkpointMap[args.checkpoint:GetId()]
		if checkpoint then
			checkpoint:Enter(racer)
		end
	end
end

function StateRacing:PlayerEnterVehicle(args)
	local racer = self.race.playerIdToRacer[args.player:GetId()]
	if racer then
		racer:EnterVehicle(args)
	end
end

function StateRacing:PostTick()
	-- Call Update on one Racer or Spectator. If the list is less than 10, then sometimes skip.
	local index = (self.numTicks % math.max(10 , #self.updateList)) + 1
	if index <= #self.updateList then
		local racerBase = self.updateList[index]
		if IsValid(racerBase.player) then
			racerBase:Update(self:GetRacePosInfo())
		end
	end
	
	self.numTicks = self.numTicks + 1
end

function StateRacing:PlayerSpawn(args)
	local racer = self.race.playerIdToRacer[args.player:GetId()]
	if racer then
		racer:Respawn()
	end
	
	return false
end

-- Network events

function StateRacing:ReceiveCheckpointDistanceSqr(args)
	local playerId = args[1]
	local distSqr = args[2]
	local cpIndex = args[3]
	
	local racer = self.race.playerIdToRacer[playerId]
	
	-- If player is in race and they're sending us the correct checkpoint distance.
	if racer and racer.targetCheckpoint == cpIndex then
		racer.targetCheckpointDistanceSqr[1] = distSqr
	end
end

function StateRacing:SpectateRequestTarget(playerId , player)
	local spectator = self.race.playerIdToSpectator[player:GetId()]
	if spectator then
		spectator:RequestTarget(playerId)
	end
end

function StateRacing:RequestRespawn(unused , player)
	local racer = self.race.playerIdToRacer[player:GetId()]
	if racer then
		racer:RequestRespawn()
	end
end
