class 'InformationAlert'

function InformationAlert:__init()

	Events:Subscribe("RemoveInformationAlert", self, self.RemoveInformationAlert)
	Events:Subscribe("AddInformationAlert", self, self.AddInformationAlert)
end


function InformationAlert:AddInformationAlert(args)
	Network:Send("AddInformationAlert", args.player, args.data)
end


function InformationAlert:RemoveInformationAlert(args)
	Network:Send("RemoveInformationAlert", args.player, args.data)
end


InformationAlert = InformationAlert()