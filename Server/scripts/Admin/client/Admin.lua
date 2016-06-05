class 'Admin'

function Admin:__init()
	
	self.commands = {}
	self:ConfigureCommands()
	
	Events:Subscribe("PlayerChatCommand", self, self.PlayerChatCommand) 
end


function Admin:ConfigureCommands()
	self:SetCommand("BAN", 3, {"player"}, function(args)
		local player = self:GetPlayer(args[1])
		if player then
			Network:Send("Ban", {player = player})
		end
	end)
	
	self:SetCommand("KICK", 2, {"player"}, function(args)
		local player = self:GetPlayer(args[1])
		if player then
			Network:Send("Kick", {player = player})
		end
	end)
	
	self:SetCommand("TP", 2, {"player"}, function(args)
		local player = self:GetPlayer(args[1])
		if player then
			Network:Send("TP", {player = player})
		end
	end)
	
	self:SetCommand("TPW", 2, {}, function(args)
		Network:Send("TPW", {position = Waypoint:GetPosition()})
	end)
	
	self:SetCommand("BRING", 2, {"player"}, function(args)
		local player = self:GetPlayer(args[1])
		if player then
			Network:Send("Bring", {player = player})
		end
	end)
	
	self:SetCommand("SETESTABLISHMENT", 2, {"type", "name"}, function(args)
		Network:Send("SetEstablishment", {
			position = LocalPlayer:GetPosition() + Vector3(0, 1, 0),
			establishmentType = tonumber(args[1]),
			name = args[2],
		})
	end)
	
	self:SetCommand("VSPAWN", 2, {"model_id"}, function(args)
		local model_id = tonumber(args[1])
		if model_id then
			Network:Send("Vspawn", {model_id = model_id})
		end
	end)
end


function Admin:SetCommand(command, userLevel, args, func)
	self.commands[command] = {userLevel = userLevel, args = args, func = func}
end


function Admin:PlayerChatCommand(args)
	local userLevel = LocalPlayer:GetValue("NivelUsuario")
	if not userLevel then userLevel = 1 end
	local data = self.commands[string.upper(args.command)]
	if data then
		if userLevel < data.userLevel then
			Events:Fire("AddNotificationAlert", {message = "Você não tem permissão para isso!"})
			return
		end
		self:ExecuteFunction(string.upper(args.command), data, args.args)
	else
		Events:Fire("AddNotificationAlert", {message = "Comando inexistente!"})
	end
end


function Admin:ExecuteFunction(command, data, args)
	local argsRequired = data.args
	if #args != #argsRequired then
		local argsText = ""
		for _, arg in pairs(data.args) do
			argsText = argsText .. " [" .. arg .. "]"
		end
		argsText = argsText:sub(2)
		Events:Fire("AddNotificationAlert", {message = "Sintaxe incorreta: /" .. command .. " " .. argsText})
		return
	end
	
	data.func(args)
end


function Admin:GetPlayer(args)
	local player = nil
	if tonumber(args) then
		player = Player.GetById(tonumber(args))
	else
		player = Player.Match(args)[1]
	end
	
	if not player then
		Chat:Print("Jogador não encontrado: ".. tostring(args), Color.Red)
	end
	return player
end


Admin = Admin()