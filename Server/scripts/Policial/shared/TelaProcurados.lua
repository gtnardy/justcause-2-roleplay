class 'TelaProcurados'

function TelaProcurados:__init(args)

	self.active = false
	
	self.procurados = {}
	
	self.tempoAtualizarProcurados = 30

	self.timer = Timer()
	Events:Subscribe("Render", self, self.Render)
	Events:Subscribe("PostTick", self, self.PostTick)
	Network:Subscribe("AtualizarProcurados", self, self.AtualizarProcurados)
	
	self.tamanho = Vector2(225, 280)
	
end


function TelaProcurados:DrawText(pos, text, cor, size)

	if not size then
		size = 15
	end
	
	alfa = cor.a

	Render:DrawText(Vector2(1,1) + pos, text, Color(0,0,0,alfa / 2), size)
	Render:DrawText(pos, text, cor, size)

end


function TelaProcurados:Render()

	if self.active then
	
		local pos = Vector2(Render.Width - self.tamanho.x - 30, Render.Height / 5)
		Render:FillArea(pos, self.tamanho, Color(0,0,0,50))
		Render:FillArea(pos, Vector2(self.tamanho.x, 40), Color(0,0,0,75))
		
		local tit = "PROCURADOS"
		local sizeTit = 24
		
		self:DrawText(pos + Vector2(self.tamanho.x / 2, 22) - Render:GetTextSize(tit, sizeTit) / 2, tit, Color(230, 126, 34, 150), sizeTit)
		
		Render:FillArea(pos + Vector2(0, 39), Vector2(self.tamanho.x, 3), Color(255,255,255, 60))
		Render:FillArea(pos + Vector2(0, 40), Vector2(self.tamanho.x, 1), Color(255,255,255, 120))
		
		for _ = 1, 8 do
			local p = self.procurados[_] 
			if not p then return end
		-- for _, p in pairs(self.procurados) do
			-- idUsuario, nome, sigla, estrelas
			
			local cor = Color(255, 255, 220, 200)
			if tonumber(p.estrelas) > 2 then
				if tonumber(p.estrelas) > 3 then
					cor = Color(255, 0, 0, 200)
				else
					cor = Color(255, 255, 0, 200)
				end
			end
			
			local size = 17
			local txt = " [".. tostring(p.id) .. "] "..tostring(p.nome)
			local txtEstrela = tostring(p.estrelas) .. "* "
			
			Render:FillArea(pos + Vector2(4, 17 + 29 * (_)), Vector2(self.tamanho.x - 8, 26), Color(0,0,0, 20))
			self:DrawText(pos + Vector2(15, 26 + 28 * (_)), txtEstrela, cor, size)
			self:DrawText(pos + Vector2(15 + Render:GetTextWidth(txtEstrela, size), 26 + 28 * (_)), txt, Color(255,255,220,200), size)
		
		
		end
	
	end
	
end


function TelaProcurados:AtualizarProcurados(args)
	
	self.procurados = {}

	-- idUsuario, nome, sigla, estrelas
	for _, p in pairs(args) do

		for player in Client:GetPlayers() do
			
			if player:GetSteamId().id == p.idUsuario then
				p.id = player:GetId()
				self.procurados[_] = p
			end
		end
		
		if LocalPlayer:GetSteamId().id == p.idUsuario then
			p.id = LocalPlayer:GetId()
			self.procurados[_] = p
		end		
		
	end

end


function TelaProcurados:SetActive(args)

	if args then
		Network:Send("AtualizarProcurados", LocalPlayer)
	end
	self.timer:Restart()
	self.active = args

end


function TelaProcurados:GetActive()

	return self.active 
	
end


function TelaProcurados:PostTick()

	if self.active then
		if self.timer:GetSeconds() >= self.tempoAtualizarProcurados then
			
			
			Network:Send("AtualizarProcurados", LocalPlayer)
			
			self.timer:Restart()
		end
	end

end
