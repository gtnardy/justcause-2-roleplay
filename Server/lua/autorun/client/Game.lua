class 'GUIStateHandler'

function GUIStateHandler:__init()

	self.GUIStateObject = SharedObject.Create("GUIState")
	
	self.state = GUIState.Loading
	self.states = {}
	
	--self.toUpdate = false
	--self.timerUpdateState = Timer()
	
	Events:Subscribe("SharedObjectValueChange", self, self.SharedObjectValueChange)
	Events:Subscribe("ModuleLoad", self, self.ModuleLoad)
	--Events:Subscribe("PostTick", self, self.PostTick)
end


-- function GUIStateHandler:PostTick()
	-- if self.toUpdate and self.timerUpdateState:GetSeconds() > 0.2 then
		-- self.toUpdate = false
		-- self:UpdateState()
	-- end
-- end


function GUIStateHandler:SharedObjectValueChange(args)
	if args.object.__type == "SharedObject" and args.object:GetName() == "GUIState" then
		self.states[tonumber(args.key)] = args.value
		self:UpdateState()
		--self.timerUpdateState:Restart()
		--self.toUpdate = true
	end
end


function GUIStateHandler:GetState()
	if Game:GetState() == GUIState.Menu or Game:GetState() == GUIState.Loading then
		return Game:GetState()
	end
	return self.state
end


function GUIStateHandler:UpdateStates()
	for key, value in pairs(self.GUIStateObject:GetValues()) do
		self.states[tonumber(key)] = value
	end
	self:UpdateState()
end


function GUIStateHandler:UpdateState()

	local upd = GUIState.Loading
	if self.states[GUIState.Menu] then
		upd = GUIState.Menu
	elseif self.states[GUIState.PDA] then
		upd = GUIState.PDA
	elseif self.states[GUIState.Chat] then
		upd = GUIState.Chat		
	elseif self.states[GUIState.ContextMenu] then
		upd = GUIState.ContextMenu
	else 
		upd = GUIState.Game
	end
	self.state = upd
end


function GUIStateHandler:ModuleLoad()
	GUIState.ContextMenu = 6
	GUIState.Chat = 7
	function Game:GetGUIState(...) return GUIStateHandler:GetState(...) end
	self:UpdateStates()
end


GUIStateHandler = GUIStateHandler()