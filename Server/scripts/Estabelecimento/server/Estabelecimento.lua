class 'Estabelecimento'

function Estabelecimento:__init()

	Events:Subscribe("ServerStart", self, self.ServerStart)
end


function Estabelecimento:ServerStart()
	
	SQL:Execute("CREATE TABLE IF NOT EXISTS Estabelecimento(" ..
		"Id INTEGER PRIMARY KEY AUTOINCREMENT," ..
		"Nome VARCHAR(40) NOT NULL," ..
		"Descricao INTEGER NOT NULL," ..
		"Posicao VARCHAR(50) NOT NULL," ..
		"Tipo INT NOT NULL)")
	
	SQL:Execute("CREATE TABLE IF NOT EXISTS EstabelecimentoTipo(" ..
		"Id INTEGER PRIMARY KEY AUTOINCREMENT," ..
		"Descricao INTEGER NOT NULL," ..
		"Spot VARCHAR(30))")
end


Estabelecimento = Estabelecimento()