class 'Fome'

function Fome:__init()

	self.fome = 100
	self.sede = 100
	
	Events:Subscribe("ModulesLoad", self, self.ModulesLoad)
	Events:Subscribe("PostTick", self, self.PostTick)
	Events:Subscribe("SharedObjectValueChange", self, self.SharedObjectValueChange)
	
	self.gastoBaseState = {}
	self.gastoBaseState[6] = 0.01
	self.gastoBaseState[7] = 0.015
	self.gastoBaseState[19] = 0.02
	self.gastoBaseState[27] = 0.02
	self.gastoBaseState[28] = 0.02
	self.gastoBaseState[315] = 0.02
	
	self.timer = Timer()
end


function Fome:ModulesLoad()
	
	if (LocalPlayer:GetValue("Fome") and LocalPlayer:GetValue("Sede")) then
		self.fome = LocalPlayer:GetValue("Fome")
		self.sede = LocalPlayer:GetValue("Sede")
	end
end


function Fome:SharedObjectValueChange(args)

	if args.object.__type == "Player" and args.object == LocalPlayer then
		if args.key == "Fome" then
			self.fome = args.value
		else
			if args.key == "Sede" then
				self.sede = args.value
			end
		end
	end
end


function Fome:PostTick()

	if self.timer:GetSeconds() > 1 then
		
		local gasto = self.gastoBaseState[LocalPlayer:GetBaseState()]
		if not gasto then gasto = 0.01 end
		
		self.fome = self.fome - gasto
		self.sede = self.sede - (gasto * 2)
		
		if self.fome <= 0 or self.sede <= 0 then
			Network:Send("Starving", LocalPlayer)
		end
		self.timer:Restart()
	end

end


function Fome:Render(posicao, tamanho)
	
	if self.fome and self.sede then
		-- Fome
		posicao = posicao + Vector2(0, tamanho.y + 2)
		Render:FillArea(posicao, tamanho + Vector2(0, 6), Color(0, 0, 0, 100))
			
		local tamBarraFome = self.fome / 100 * tamanho.x
		Render:FillArea(posicao + Vector2(2, 3), Vector2(tamBarraFome, tamanho.y) - Vector2(4, 6), Color(243, 156, 18, 200))
			
		-- Sede
		local tamBarraSede = self.sede / 100 * tamanho.x
		Render:FillArea(posicao + Vector2(2, tamanho.y), Vector2(tamBarraSede, tamanho.y) - Vector2(4, 6), Color(52, 152, 219, 200))
	end
end