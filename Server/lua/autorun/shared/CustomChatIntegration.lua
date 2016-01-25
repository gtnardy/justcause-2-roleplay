function ChatPrint(player, ...)

	if Client then
		Events:Fire("ChatPrint", {...})
		
	elseif IsValid(player) then
		Network:Send(player, "ChatPrint", {...})
	else
		Network:Broadcast("ChatPrint", {...})
	end

end

Events:Subscribe("ModuleLoad", function()

	if Client then
		function Chat:Print(...) ChatPrint(nil, ...) end
	end

	if Server then
		function Chat:Send(...) ChatPrint(...) end
		function Chat:Broadcast(...) ChatPrint(nil, ...) end
		function Player:SendChatMessage(...) ChatPrint(self, ...) end
	end
end)
