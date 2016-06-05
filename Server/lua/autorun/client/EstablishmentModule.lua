class ("EstablishmentModule")

function EstablishmentModule:ConfigureEstablishmentModule()

	self:SetLanguages()
	self.active = false
	self.atEstablishment = false
	self.ContextMenu = nil
	self.blockOnInput = true
	self.spotType = "ESTABLISHMENT_SPOT"
	self.enterEstablishmentMessage = "Entered Establishment"
	
	Events:Subscribe("KeyUp", self, self.KeyUp)
	Events:Subscribe("PreTick", self, self.PreTick)
	Events:Subscribe("LocalPlayerInput", self, self.LocalPlayerInput)
	Events:Subscribe("LocalPlayerEnterSpot", self, self.LocalPlayerEnterSpot)
	Events:Subscribe("LocalPlayerExitSpot", self, self.LocalPlayerExitSpot)
end


function EstablishmentModule:KeyUp(args)
	if args.key == string.byte("F") then
		if self.atEstablishment then
			self:SetActive(not self.active)
		elseif self.active then
			self:SetActive(false)
		end
	end
end


function EstablishmentModule:LocalPlayerEnterSpot(args)
	if args.spotType == self.spotType then
		self.atEstablishment = true
		Events:Fire("AddInformationAlert", {id = "PLAYER_ENTER_"..self.spotType, message = self.enterEstablishmentMessage, priority = true})
	end
end


function EstablishmentModule:LocalPlayerExitSpot(args)
	if args.spotType == self.spotType then
		self.atEstablishment = false
		Events:Fire("RemoveInformationAlert", {id = "PLAYER_ENTER_"..self.spotType})
	end
end


function EstablishmentModule:ConfigureContextMenu()

end


function EstablishmentModule:LocalPlayerInput(args)
	if self.active and self.blockOnInput and (args.input < Action.LookUp or args.input > Action.LookRight) then
		return false
	end
end


function EstablishmentModule:PreTick()
	if self.active and self.ContextMenu and not self.ContextMenu.active then
		self:SetActive(false)
	end
end


function EstablishmentModule:SetActive(bool)
	self.active = bool
	if bool then
		self:ConfigureContextMenu()
		self.active = self.ContextMenu:SetActive(true)
	else
		if self.ContextMenu then
			self.ContextMenu:SetActive(false)
		end
		self.ContextMenu = nil
	end
end
