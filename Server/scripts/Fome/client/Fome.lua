class 'Fome'

function Fome:__init()

	self.fome = 5
	self.sede = 5

	self.fomeAdicionar = 0
	self.sedeAdicionar = 0
	
	self.fomeTick = 10
	self.sedeTick = 10

	self.timerSalvar = Timer()
	self.timer = Timer()
	
	self.gastoFomeBaseState = {}
	self.gastoFomeBaseState[6] = 0.01
	self.gastoFomeBaseState[7] = 0.015
	self.gastoFomeBaseState[19] = 0.02
	self.gastoFomeBaseState[27] = 0.02
	self.gastoFomeBaseState[28] = 0.02
	self.gastoFomeBaseState[315] = 0.02
	
	Network:Subscribe("Ingerir", self, self.Ingerir)
	Network:Subscribe("AtualizarFome", self, self.Atualizar)
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("ModuleUnload", self, self.Salvar)

end


function Fome:PostTick()

	if (self.timerSalvar:GetSeconds() >= 60) then
	
		self:Salvar()
		self.timerSalvar:Restart()
	end
	
	
	if (self.timer:GetSeconds() >= 1) then
		
		self:DescrescerFome()
		
		self.timer:Restart()
	end
end


function Fome:DescrescerFome()
	
	local state = LocalPlayer:GetBaseState()
	
	local gasto = self.gastoFomeBaseState[state]
	
	if (not gasto) then
		gasto = 0.01
	end
	
	self.fome = self.fome - gasto
	self.sede = self.sede - (gasto * 2)
	
	if (self.fome <= 0) then
		Network:Send("MorrendoFome")
	end	
	
	if (self.sede <= 0) then
		Network:Send("MorrendoSede")
	end
	
end


function Fome:Salvar()

	Network:Send("Salvar", {fome = math.ceil((self.fome + self.fomeAdicionar) * 10) / 10, sede =  math.ceil((self.sede + self.sedeAdicionar) * 10) / 10})
	
end


function Fome:Ingerir(args)

	if (args.fome) then
		self.fomeAdicionar = self.fomeAdicionar + tonumber(args.fome)
		self.fomeTick = self.fomeAdicionar / 60
	end
	
	if (args.sede) then
		self.sedeAdicionar = self.sedeAdicionar + tonumber(args.sede)	
		self.sedeTick = self.sedeAdicionar / 60
	end

end


function Fome:Atualizar(args)

	self.fomeAdicionar = self.fomeAdicionar + tonumber(args.fome) - self.fome
	self.sedeAdicionar = self.sedeAdicionar + tonumber(args.sede) - self.sede
	
	self.fomeTick = self.fomeAdicionar / 60
	self.sedeTick = self.sedeAdicionar / 60
end


function Fome:Render()

	self:AdicionarFome()
	self:AdicionarSede()
	
	local txtFome = "Fome"
	local txtSede = "Sede"
	
	local pos = Vector2(Render.Width - 220, Render.Height - Render.Height / 3.5)
	local tam = Vector2(190,35)
	
	local propFome = (tam.x - 20) * tonumber(self.fome) / 100
	
	Render:FillArea(pos, tam, Color(0,0,0,75))
	Render:DrawText(pos + Vector2(10, tam.y / 2 + 2- Render:GetTextHeight(txtFome, 15)), txtFome, Color(255,255,255), 15)
	Render:FillArea(pos + Vector2(10, tam.y / 2 + 2), Vector2(tam.x - 20, 8), Color(100,100,100,230))
	Render:FillArea(pos + Vector2(10, tam.y / 2 + 2), Vector2(propFome, 8), Color(240,240,240,230))
	
	if (self.fomeAdicionar != 0) then
		local propFomeAdicionar = (tam.x - 20) * tonumber(self.fomeAdicionar) / 100
		local corFomeAdicionar = Color(89, 171, 227)
		if (propFomeAdicionar < 0 ) then
			corFomeAdicionar = Color(231, 76, 60)
		end	
		Render:SetClip(true, pos + Vector2(10 + propFome, tam.y / 2 + 2), Vector2(tam.x - 20,8))
		Render:FillArea(pos + Vector2(10 + propFome, tam.y / 2 + 2), Vector2(propFomeAdicionar, 8),corFomeAdicionar)
		Render:SetClip(false)
	end	
		
	local propSede = (tam.x - 20) * tonumber(self.sede) / 100

	pos = pos + Vector2(0, tam.y + 3)		
	Render:FillArea(pos, tam, Color(0,0,0,75))
	Render:DrawText(pos + Vector2(10, tam.y / 2 + 2- Render:GetTextHeight(txtSede, 15)), txtSede, Color(255,255,255), 15)
	Render:FillArea(pos + Vector2(10, tam.y / 2 + 2), Vector2(tam.x - 20, 8), Color(100,100,100,230))
	Render:FillArea(pos + Vector2(10, tam.y / 2 + 2), Vector2(propSede, 8), Color(240,240,240,230))
	
	if (self.sedeAdicionar != 0) then
		local propSedeAdicionar = (tam.x - 20) * tonumber(self.sedeAdicionar) / 100	
		local corSedeAdicionar = Color(89, 171, 227)
		if (propSedeAdicionar < 0 ) then
			corSedeAdicionar = Color(231, 76, 60)
		end
		Render:SetClip(true, pos + Vector2(10 + propSede, tam.y / 2 + 2), Vector2(tam.x - 20,8))
		Render:FillArea(pos + Vector2(10 + propSede, tam.y / 2 + 2), Vector2(propSedeAdicionar, 8), corSedeAdicionar)
		Render:SetClip(false)
	end
		
end


function Fome:AdicionarFome()

	if (self.fomeAdicionar != 0) then
	
		if (self.fomeAdicionar > 0) then
		
			self.fome = self.fome + self.fomeTick
			self.fomeAdicionar = self.fomeAdicionar - self.fomeTick
			
			if (self.fomeAdicionar < 0) then
				self.fome = self.fome + self.fomeAdicionar
				self.fomeAdicionar = 0
			end
		else
		
			self.fome = self.fome + self.fomeTick
			self.fomeAdicionar = self.fomeAdicionar - self.fomeTick
			
			if (self.fomeAdicionar > 0) then
				self.fome = self.fome + self.fomeAdicionar
				self.fomeAdicionar = 0
			end
		end
		self.fome = math.max(math.min(self.fome, 100), 0)
		if (self.fome == 100 or self.fome == 0) then self.fomeAdicionar = 0 end

	end
end


function Fome:AdicionarSede()

	if (self.sedeAdicionar != 0) then
	
		if (self.sedeAdicionar > 0) then
		
			self.sede = self.sede + self.sedeTick
			self.sedeAdicionar = self.sedeAdicionar - self.sedeTick
			
			if (self.sedeAdicionar < 0) then
				self.sede = self.sede + self.sedeAdicionar
				self.sedeAdicionar = 0
			end
		else
		
			self.sede = self.sede + self.sedeTick
			self.sedeAdicionar = self.sedeAdicionar - self.sedeTick
			
			if (self.sedeAdicionar > 0) then
				self.sede = self.sede + self.sedeAdicionar
				self.sedeAdicionar = 0
			end
		end
		self.sede = math.max(math.min(self.sede, 100), 0)
		if (self.sede == 100 or self.sede == 0) then self.sedeAdicionar = 0 end
	end
	
end


fome = Fome()