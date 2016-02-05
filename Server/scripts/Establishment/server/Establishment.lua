class 'Establishment'

function Establishment:__init()

	Events:Subscribe("ServerStart", self, self.ServerStart)
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