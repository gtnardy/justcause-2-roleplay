class 'Establishment'

function Establishment:__init()

	Events:Subscribe("ServerStart", self, self.ServerStart)
	Events:Subscribe("SetEstablishment", self, self.SetEstablishment)
end


function Establishment:SetEstablishment(args)
	local command = SQL:Command("INSERT INTO Establishment (Name, Position, Type) VALUES(?, ?, ?)")
	command:Bind(1, args.name)
	command:Bind(2, tostring(args.position))
	command:Bind(3, args.establishmentType)
	command:Execute()
	
	Events:Fire("UpdateSpots", {establishmentType = args.establishmentType})
end


function Establishment:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS Establishment(" ..
		"Id INTEGER PRIMARY KEY AUTOINCREMENT," ..
		"Name VARCHAR(40) NOT NULL," ..
		"Description INTEGER NOT NULL," ..
		"Type INT NOT NULL)")
	
	SQL:Execute("CREATE TABLE IF NOT EXISTS EstablishmentType(" ..
		"Id INTEGER PRIMARY KEY AUTOINCREMENT," ..
		"Description INTEGER NOT NULL," ..
		"Spot VARCHAR(30)," ..
		"Radius INTEGER NOT NULL)")
end


Establishment = Establishment()