class 'Jobs'

function Jobs:__init()
	Events:Subscribe("ServerStart", self, self.ServerStart)
end


function Jobs:ServerStart()
	SQL:Execute("CREATE TABLE IF NOT EXISTS Jobs(" ..
		"Id INTEGER NOT NULL PRIMARY KEY," ..
		"MinimumLevel INTEGER NOT NULL," ..
		"Experiencia INTEGER NOT NULL DEFAULT 0)")
end

Jobs = Jobs()