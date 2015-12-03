class 'UsuarioController'

function UsuarioController:__init()

	Events:Subscribe("ClientModulesLoad", self, self.ClientModulesLoad)
	Events:Subscribe("ServerStart", self, self.ServerStart)
end

function UsuarioController:ClientModulesLoad(args)
	
	args.player:GiveWeapon(WeaponSlot.Left, Weapon(11, 100, 99)) 
end

function UsuarioController:ServerStart()
	
	SQL:Execute("CREATE TABLE IF NOT EXISTS Usuario(" ..
		"Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT," ..
		"Nome VARCHAR(40) NOT NULL," ..
		"Nivel INTEGER NOT NULL," ..
		"Experiencia INTEGER NOT NULL," ..
		"Dinheiro INTEGER NOT NULL," ..
		"DinheiroBanco INTEGER NOT NULL," ..
		"Idioma INTEGER NOT NULL," ..
		"DataEntrada DATETIME NOT NULL," ..
		"DataUltimaEntrada DATETIME NOT NULL," ..
		"UltimaPosicao VARCHAR(50) NOT NULL," ..
		"HabilitacaoA BIT NOT NULL," ..
		"HabilitacaoB BIT NOT NULL," ..
		"HabilitacaoC BIT NOT NULL," ..
		"HabilitacaoD BIT NOT NULL)")
end

UsuarioController = UsuarioController()