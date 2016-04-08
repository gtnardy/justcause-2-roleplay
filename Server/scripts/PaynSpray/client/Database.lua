class 'Database'

function Database:__init()

	self.buzinas = {
		{texto = "Buzina Pequena", bank_id = 6, sound_id = 13, preco = 200},
		{texto = "Buzina Media", bank_id = 6, sound_id = 0, preco = 200},
		{texto = "Buzina Alta", bank_id = 6, sound_id = 12, preco = 200},
		{texto = "Buzina de Caminhao 1", bank_id = 6, sound_id = 14, preco = 200},
		{texto = "Buzina de Caminhao 2", bank_id = 6, sound_id = 15, preco = 200},
		{texto = "Sorvete", bank_id = 6, sound_id = 6, preco = 200},
		{texto = "Sirene Lave", bank_id = 6, sound_id = 10, preco = 200},
		{texto = "Sirene Militar", bank_id = 6, sound_id = 16, preco = 200},
		{texto = "Sorvete Pimped", bank_id = 6, sound_id = 11, preco = 200},
	}
	
	self.coresNeon = {
		{"Branco", Color(255,255,255), 400},
		{"Azul", Color(0,0,255), 400},
		{"Azul-eletrico", Color(0, 110, 249), 400},
		{"Verde", Color(0, 255, 0), 400},
		{"Verde-limao", Color(111, 255, 0), 400},
		{"Amarelo", Color(255,255,0), 400},
		{"Ouro", Color(218,145,0), 400},
		{"Laranja", Color(252,100,0), 400},
		{"Vermelho", Color(255,0,0), 400},
		{"Rosa-ponei", Color(248,129,231), 400},
		{"Rosa-choque", Color(236,13,119), 400},
		{"Roxo", Color(119,47,147), 400},
		{"Luz negra", Color(120,0,253), 400},
		
		
		-- {"Preto", Color(227,190,70), 400},
		-- {"Preto", Color(251,184,41), 400},
		-- {"Preto", Color(3,3,3), 400},
		-- {"Preto", Color(255,255,255), 400},
		-- {"Preto", Color(255,105,180), 400},
		-- {"Preto", Color(0,255,0), 400},
		-- {"Preto", Color(135,197,245), 400},
		-- {"Preto", Color(96,62,148), 400},
		-- {"Preto", Color(135,197,245 ), 400},
		-- {"Preto", Color( 111, 255, 0 ), 400},
		
	}
	
	self.cores = {
	
		{"Preto", Color(0, 0, 0), 400},
		{"Cararra", Color(242, 241, 239), 400},
		{"Pomes", Color(210, 215, 211), 400},
		{"Galeria", Color(238, 238, 238), 400},
		{"Areia de Prata", Color(189, 195, 199), 400},
		{"Porcelana", Color(236, 240, 241), 400},
		{"Cascata", Color(149, 165, 166), 400},
		{"Ferro", Color(218, 223, 225), 400},
		{"Edward", Color(171, 183, 183), 400},
		{"Prata", Color(191, 191, 191), 400},
		
		{"New York", Color(224, 130, 131), 400},
		{"Roma", Color(242, 38, 19), 400},
		{"Vermelho", Color(255, 0, 0), 400},
		{"Sunglo", Color(226, 106, 106), 400},
		{"Thunderbird", Color(217, 30, 24), 400},
		{"Tijolo Antigo", Color(150, 40, 27), 400},
		{"Flamingo", Color(239, 72, 54), 400},
		{"Valencia", Color(214, 69, 65), 400},
		{"Parede", Color(192, 57, 43), 400},
		{"Monza", Color(207, 0, 15), 400},
		{"Cinabre", Color(231, 76, 60), 400},
		
		{"Ouro Tahiti", Color(232, 126, 4), 400},
		{"Casablanca", Color(244, 179, 80), 400},
		{"Crusta", Color(242, 120, 75), 400},
		{"Jaffa", Color(235, 151, 78), 400},
		{"Relampago Amarelo", Color(245, 171, 53), 400},
		{"Acafrao", Color(244, 208, 63), 400},
		{"Laranja Quente", Color(211, 84, 0), 400},
		{"Ranunculo", Color(243, 156, 18), 400},
		{"Extase", Color(249, 105, 14), 400},
		{"Limao Maduro", Color(247, 202, 24), 400},
		{"Acafrao", Color(249, 191, 59), 400},
		{"Jaffa", Color(242, 121, 53), 400},
		{"Entusiasmo", Color(230, 126, 34), 400},
		{"Arbusto Flamejante", Color(235, 149, 50), 400},
		{"Macio", Color(101, 198, 187), 400},
		{"Pasto da Montanha", Color(27, 188, 155), 400},
		{"Mar Vende Claro", Color(27, 163, 156), 400},
		{"Agua-Marinha", Color(102, 204, 153), 400},
		{"Turquesa", Color(54, 215, 183), 400},
		{"Observatorio", Color(4, 147, 114), 400},
		{"Madang", Color(200, 247, 197), 400},
		{"Riptide", Color(134, 226, 213), 400},
		{"Trevo", Color(46, 204, 113), 400},
		{"Pasto da Montanha", Color(22, 160, 133), 400},
		{"Esmeralda", Color(63, 195, 128), 400},
		{"Neblina Verde", Color(1, 152, 117), 400},
		{"Selva Verde", Color(38, 194, 129), 400},
		{"Neblina Verde", Color(3, 166, 120), 400},
		{"Oceano Verde", Color(77, 175, 124), 400},
		{"Selva Verde", Color(42, 187, 155), 400},
		{"Jade", Color(0, 177, 106), 400},
		{"Salem", Color(30, 130, 76), 400},
		{"Eucalipto", Color(38, 166, 91), 400},
		{"Picton Azul", Color(89, 171, 227), 400},
		{"Shakespeare", Color(82, 179, 217), 400},
		{"Passaro do Zumbido", Color(197, 239, 247), 400},
		{"Picton Azul", Color(34, 167, 240), 400},
		{"Azul Curioso", Color(52, 152, 219), 400},
		{"Madison", Color(44, 62, 80), 400},
		{"Jordy Azul", Color(137, 196, 244), 400},
		{"Dodger Azul", Color(25, 181, 254), 400},
		{"Ming", Color(51, 110, 123), 400},
		{"Argila de Ebano", Color(34, 49, 63), 400},
		{"Malibu", Color(107, 185, 240), 400},
		{"Azul Curioso", Color(30, 139, 195), 400},
		{"Chambray", Color(58, 83, 155), 400},
		{"Madeira em Conserva", Color(52, 73, 94), 400},
		{"Hoki", Color(103, 128, 159), 400},
		{"Geleia de Feijao", Color(37, 116, 169), 400},
		{"Jacksons Purple", Color(31, 58, 147), 400},
		{"Azul Aço", Color(75, 119, 190), 400},
		{"Azul da Fonte", Color(92, 151, 191), 400},

	}
	
	self.modificacoes = {
		[1] = {
			{template = "Classic_Cab", texto = "Sem Capo Classico", preco = 5000},
			{template = "", texto = "Capo Classico", preco = 5000},
			{template = "Modern_Hardtop", texto = "Capo Moderno", preco = 5000},
			{template = "Modern_Cab", texto = "Sem Capo Moderno", preco = 5000},
		},

		[3] = {
			-- {template = "FullyUpgraded", texto = "Armado", preco = 5000},
		},
		
		[5] = {
			{template = "", texto = "Padrao", preco = 5000},
			{template = "Fishing", texto = "Pescador", preco = 5000},
			{template = "Cab", texto = "Sem Capota", preco = 5000},
		},

		[7] = {
			{template = "Default", texto = "Desarmado", preco = 0},
			-- {template = "Armed", texto = "Armado", preco = 0},
			-- {template = "FullyUpgraded", texto = "Armado com Missel", preco = 0},
		},
		
		[8] = {
			-- {template = "Hijack_Rear", texto = "???", preco = 5000},
		},
		
		[11] = {
			{template = "Police", texto = "Policial", preco = 5000},
		},

		[18] = {
			{template = "Russian", texto = "Russo", preco = 5000},
			-- {template = "Cannon", texto = "Canhao", preco = 5000},
		},

		[25] = {
			{template = "", texto = "Com Caixotes", preco = 5000},
			{template = "Cab", texto = "Sem Caixotes", preco = 5000},
		},

		[31] = {
			{template = "", texto = "Com Pendulo", preco = 5000},
			{template = "Cab", texto = "Sem Pendulo", preco = 5000},
			-- {template = "MG", texto = "Metralhadora", preco = 0},
		},
		
		[35] = {
			-- {template = "FullyUpgraded", texto = "Armado", preco = 0},
			-- {template = "Softtop", texto = "Softtop", preco = 0},
		},
		
		[36] = {
			{template = "", texto = "Esporte", preco = 5000},
			{template = "Gimp", texto = "Gimp", preco = 5000},
			{template = "Civil", texto = "Civil", preco = 5000},
		},

		[38] = {
			{template = "Djonk01", texto = "Modelo 01", preco = 5000},
			{template = "Djonk02", texto = "Modelo 02", preco = 5000},
			{template = "", texto = "Modelo 03", preco = 5000},
			{template = "Djonk04", texto = "Modelo 04", preco = 5000},
		},

		[40] = {
			{template = "", texto = "Padrao", preco = 0},
			{template = "Regular", texto = "Regular", preco = 5000},
			{template = "Crane", texto = "Crane", preco = 5000},
		},

		[44] = {
			{template = "", texto = "Padrao", preco = 0},
			{template = "Softtop", texto = "Capo de Lona", preco = 5000},
			{template = "Cab", texto = "Sem Capo", preco = 5000},
		},

		[46] = {
			{template = "", texto = "Padrao", preco = 500},
			{template = "Cab", texto = "Sem Capo", preco = 500},
			{template = "Combi", texto = "Combi", preco = 5000},
			-- {template = "CombiMG", texto = "Combi Armado", preco = 5000},
		},

		[48] = {
			-- {template = "Buggy", texto = "Padrao", preco = 0},
			-- {template = "BuggyMG", texto = "Armado", preco = 5000},
		},

		[56] = {
			{template = "Cab", texto = "Desarmado", preco = 0},
			-- {template = "", texto = "Com Canhao", preco = 5000},
			-- {template = "Armed", texto = "Com Metralhadora", preco = 5000},
			-- {template = "FullyUpgraded", texto = "Armado com Missel", preco = 5000},
		},

		[57] = {
			-- {template = "Mission", texto = "Armado", preco = 0},
			-- {template = "FullyUpgraded", texto = "Armado com Missel", preco = 5000},
		},

		[62] = {
			{template = "UnArmed", texto = "Desarmado", preco = 0},
			-- {template = "", texto = "Armado", preco = 0},
			-- {template = "Armed", texto = "Armado", preco = 5000},
			-- {template = "Cutscene", texto = "Sem Helice", preco = 5000},
			-- {template = "Dome", texto = "Armado com Missel", preco = 5000},
		},

		[66] = {
			-- {template = "", texto = "Padrao", preco = 0},
			-- {template = "Double", texto = "Duplo", preco = 5000},
		},

		[69] = {
			-- {template = "", texto = "Armado", preco = 0},
			-- {template = "Roaches", texto = "Armado", preco = 0},
		},

		[77] = {
			{template = "Default", texto = "Desarmado", preco = 0},
			-- {template = "", texto = "Armado", preco = 0},
			-- {template = "Armed", texto = "Armado com Missel", preco = 0},
		},

		[78] = {
			{template = "", texto = "Padrao", preco = 5000},
			{template = "Cab", texto = "Sem Capo", preco = 5000},
		},

		[84] = {
			{template = "Cab", texto = "Desarmado", preco = 0},
			-- {template = "HardtopMG", texto = "Armado", preco = 5000},
		},

		[87] = {
			{template = "Hardtop", texto = "Padrao", preco = 5000},
			{template = "Softtop", texto = "Capo de Lona", preco = 5000},
			{template = "Cab", texto = "Sem Capo", preco = 5000},
			-- {template = "Ingame", texto = "???", preco = 5000},
		},

		[88] = {
			{template = "Default", texto = "Desarmado", preco = 0},
			-- {template = "", texto = "Armado", preco = 5000},
			-- {template = "FullyUpgraded", texto = "Armado com Missel", preco = 5000},
		},

		[91] = {
			{template = "", texto = "Sem Capo", preco = 0},
			{template = "Softtop", texto = "Com Capo de Lona", preco = 5000},
			{template = "Hardtop", texto = "Com Capo", preco = 5000},
		},

	}

end


function Database:GetPrecoVeiculo(idV, template) 

	return 666
	
end