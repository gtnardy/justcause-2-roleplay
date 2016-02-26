class 'Tutorial'

function Tutorial:__init()
	
	Events:Subscribe("TutorialNewPlayer", self, self.TutorialNewPlayer)
	Network:Subscribe("NewPlayerCreated", self, self.NewPlayerCreated)
	Network:Subscribe("UpdateSkin", self, self.UpdateSkin)
	Network:Subscribe("UpdateLanguage", self, self.UpdateLanguage)
end


function Tutorial:TutorialNewPlayer(player)
	Network:Send(player, "TutorialNewPlayer")
	player:SetAngle(Angle(1.2, 0, 0))
	player:SetPosition(Vector3( -6728.92, 225, -3589.9 ))
end


function Tutorial:NewPlayerCreated(args, player)
	player:SetNetworkValue("Name", args.name)
	Events:Fire("NewPlayerCreated", player)
end


function Tutorial:UpdateSkin(args, player)
	player:SetModelId(args.idSkin)
end


function Tutorial:UpdateLanguage(lang, player)
	player:SetValue("Language", lang)
end



Tutorial = Tutorial()