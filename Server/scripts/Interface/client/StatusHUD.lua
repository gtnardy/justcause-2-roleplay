class 'StatusHUD'

function StatusHUD:__init(args)
	
	self.experienciaNecessaria = ExperienciaNecessaria()
	
	self.active = true
	
	self.dinheiro = LocalPlayer:GetMoney()
	self.experiencia = nil
	self.experienciaUpar = nil
	self.nivel = nil
	
	self.dinheiroTick = 1
	
	self.dinheiroAdicionar = 0
	self.experienciaAdicionar = 0

	self.itensGanhos = {}
	self.experienciasGanhas = {}
	
	self.posicaoItemExibindo = Vector2(0, 0)
	self.itemExibindo = nil
	self.timerItemExibindo = Timer()
		
	self.experienciaExibindo = nil
	self.timerExperienciaExibindo = Timer()
	
	-- self:AddExperienciaGanha({valor = 200, texto = "ENTREGA"})
	-- self:AddExperienciaGanha({valor = 500, texto = "CACETAO"})
	-- self:AddExperienciaGanha({valor = 1000, texto = "HEADSHOT3"})
	
	 -- self:AddItemGanho({texto = "AK47", cor = Color(255,255,255), size = 18})
	 -- self:AddItemGanho({texto = "R$ 500,000", cor = Color(162,252,145), size = 18})
	 -- self:AddItemGanho({texto = "CACETINHO", cor = Color(255,255,255), size = 18})
	
	Events:Subscribe("LocalPlayerMoneyChange", self, self.LocalPlayerMoneyChange)
	Events:Subscribe("PostRender", self, self.Render)
	
	Network:Subscribe("AdicionarItem", self, self.AddItemGanho)
	Network:Subscribe("AdicionarExperiencia", self, self.AddExperienciaGanha)
	
end

function StatusHUD:LocalPlayerMoneyChange(args)

	local dinheiro = args.new_money - args.old_money
	self.dinheiroAdicionar = self.dinheiroAdicionar + dinheiro

	self.dinheiroTick = self.dinheiroAdicionar / 50
	local cor = Color(162,252,145)
	if (dinheiro < 0) then
		cor = Color(255,146,145)
	end

	self:AddItemGanho({texto = "R$ "..dinheiro, cor = cor, size = 18})
end

function StatusHUD:AddExperiencia(xp)
	
	self.experienciaAdicionar = self.experienciaAdicionar + xp
end

function StatusHUD:AddExperienciaGanha(expe)
	Chat:Print(tostring(expe), Color(1,1,1))
	table.insert(self.experienciasGanhas, expe)
	self:ProximaExperiencia()
end

function StatusHUD:AddItemGanho(item)

	if (not item.cor) then item.cor = Color(255,255,255) end
	if (not item.size) then item.size = 18 end
	
	table.insert(self.itensGanhos, item)
	self:ProximoItem()
end

function StatusHUD:ProximaExperiencia()

	if (not self.experienciaExibindo) then 
		
		if (self.experienciasGanhas[1]) then

			self.timerExperienciaExibindo:Restart()
			self.experienciaExibindo = self.experienciasGanhas[1]
			self.experienciaExibindo.alpha = 255
			self.experienciaExibindo.circulo = 20
			self.experienciaExibindo.alphaCirculo = 150
			if not self.experienciaExibindo.cor then
				self.experienciaExibindo.cor = Color(222, 209, 59)
			
			end
			
			if not self.experienciaExibindo.naoAdicionar then
				self:AddExperiencia(tonumber(self.experienciasGanhas[1].valor))
			end
			
			table.remove(self.experienciasGanhas, 1)
			
		
		else

			self.experienciaExibindo = nil
		end
	end
	
end

function StatusHUD:ProximoItem()

	if (not self.itemExibindo) then 
	
		if (self.itensGanhos[1]) then
		
			self.posicaoItemExibindo = Vector2(Render.Width / 2 - Render:GetTextWidth(self.itensGanhos[1].texto, self.itensGanhos[1].size) / 2, Render.Height - 300)
			self.itemExibindo = self.itensGanhos[1]
			table.remove(self.itensGanhos, 1)
			self.timerItemExibindo:Restart()
		else
			self.itemExibindo = nil
		end
	end
	
end

function StatusHUD:GetActive()

	return self.active
end

function StatusHUD:SetActive(b)

	self.active = b
end

function StatusHUD:Render(args)
	
	if (not self.experiencia) then
		self.experiencia = tonumber(LocalPlayer:GetValue("experiencia"))
		return
	end
	
	if (not self.nivel) then
		self.nivel = tonumber(LocalPlayer:GetValue("nivel"))
		self.experienciaUpar = self.experienciaNecessaria:GetExperienciaNecessariaGlobal(self.nivel)
		return
	end
	
	self:ExibirItem()
	
	self:ExibirExperiencia()
	
	self:AdicionarExperiencia()
	
	self:AdicionarDinheiro()
	
	
	if (Game:GetState() == GUIState.Game) then
	
		if (self.active or args.boolean) then
			
			
			local size = 18
			local espacamento = 80
			
			local pos = Vector2(Render.Width - 200, 60)
			
			
			-- DINHEIRO
			local textDinheiro = "R$ "..tostring(math.floor(self.dinheiro))
			DrawTextSombreado(pos, textDinheiro, Color(255,255,255), size)

			
			-- EXP
			pos = pos - Vector2(espacamento, 0)
			
			local textExp1 = tostring(self.experiencia) .. " EXP "
			local textExp2 = "/ "..tostring(self.experienciaUpar)
			DrawTextSombreado(pos, textExp2, Color(255,255,255), size)
			
			pos = pos - Vector2(Render:GetTextWidth(textExp1, size), 0)
			
			DrawTextSombreado(pos, textExp1, Color(247,241,140), size)
			local tamanhoBarra = Render:GetTextWidth(textExp1 .. textExp2, size)
			self:DrawBarraProgresso(pos + Vector2(tamanhoBarra - tamanhoBarra / 1.2, 20), Vector2(tamanhoBarra / 1.2, 10), self.experiencia, self.experienciaUpar)
			
			-- NIVEL
			pos = pos - Vector2(espacamento / 2.5, 0)

			Render:FillCircle(pos + Render:GetTextSize(tostring(self.nivel), size) / 2 - Vector2(0, 2), 16, Color(247,241,140))
			Render:FillCircle(pos + Vector2(1,0) + Render:GetTextSize(tostring(self.nivel), size) / 2 - Vector2(0, 2), 16, Color(247,241,140))
			
			Render:FillArea(pos + Render:GetTextSize(tostring(self.nivel), size) / 2 - Vector2(10, 12), Vector2(21, 20), Color(153, 124, 46))
			
			DrawTextSombreado(pos, self.nivel, Color(247,241,140), size)
			
		end
	end
		
end


function StatusHUD:DrawBarraProgresso(pos, tamanho, valor, valorMaximo)
	
	local margem = 2
	Render:FillArea(pos, tamanho, Color(0,0,0,100))
	
	local tamanhoBarraProgresso = Vector2((tamanho.x - margem * 2) * valor / valorMaximo, tamanho.y - margem * 2)
	tamanhoBarraProgresso.x = math.max(math.min(tamanhoBarraProgresso.x, tamanho.x - margem * 2), 0)

	Render:FillArea(pos + Vector2(margem, margem), tamanhoBarraProgresso, Color(236,232,130))
	Render:FillArea(pos + Vector2(margem, margem), tamanho - Vector2(margem, margem) * 2, Color(255,255,255,50))
	Render:FillArea(pos + tamanhoBarraProgresso - Vector2(1, tamanhoBarraProgresso.y), Vector2(3, tamanho.y), Color(255,255,240))

end


function StatusHUD:AdicionarDinheiro()

	if (self.dinheiroAdicionar == 0) then
		self.dinheiro = LocalPlayer:GetMoney()
	else
	
		if (self.dinheiroAdicionar > 0) then
		
			self.dinheiro = self.dinheiro + self.dinheiroTick
			self.dinheiroAdicionar = self.dinheiroAdicionar - self.dinheiroTick
			
			if (self.dinheiroAdicionar < 0) then
				self.dinheiro = self.dinheiro + self.dinheiroAdicionar
				self.dinheiroAdicionar = 0
			end
		else
		
			self.dinheiro = self.dinheiro + self.dinheiroTick
			self.dinheiroAdicionar = self.dinheiroAdicionar - self.dinheiroTick
			
			if (self.dinheiroAdicionar > 0) then
				self.dinheiro = self.dinheiro + self.dinheiroAdicionar
				self.dinheiroAdicionar = 0
			end
		end
		
	end
	
end


function StatusHUD:AdicionarExperiencia()

	if (self.experienciaAdicionar != 0) then
	
		if (self.experienciaAdicionar > 0) then
		
			self.experiencia = self.experiencia + math.ceil(self.experienciaAdicionar / 50)
			self.experienciaAdicionar = self.experienciaAdicionar - math.ceil(self.experienciaAdicionar / 50)
			
			if (self.experienciaAdicionar < 0) then
				self.experiencia = self.experiencia + self.experienciaAdicionar
				self.experienciaAdicionar = 0
			end
		else
		
			self.experiencia = self.experiencia + math.ceil(self.experienciaAdicionar / 50)
			self.experienciaAdicionar = self.experienciaAdicionar - math.ceil(self.experienciaAdicionar / 50)
			
			if (self.experienciaAdicionar > 0) then
				self.experiencia = self.experiencia + self.experienciaAdicionar
				self.experienciaAdicionar = 0
			end
		end
		
		-- Upou
		if (self.experiencia >= self.experienciaUpar) then
			
			self.nivel = self.nivel + 1
			self.experiencia = self.experiencia - self.experienciaUpar
			self.experienciaUpar = self.experienciaNecessaria:GetExperienciaNecessariaGlobal(self.nivel)
		end
		
	end
	
end


function StatusHUD:ExibirExperiencia()

	if (self.experienciaExibindo) then
		
		local alpha = self.experienciaExibindo.alpha
		local pos = Vector2(45, Render.Height / 2)
		
		self.experienciaExibindo.circulo = self.experienciaExibindo.circulo + 2
		self.experienciaExibindo.alphaCirculo = self.experienciaExibindo.alphaCirculo - 12
		Render:FillCircle(pos, self.experienciaExibindo.circulo, Color(45, 45, 21, math.max(self.experienciaExibindo.alphaCirculo, 0)))
				
		
		Render:FillCircle(pos, 30, Color(41, 39, 36, alpha))
		
		Render:SetClip(true, pos - Vector2(0, 30), Vector2(30, 30))
		self.experienciaExibindo.cor.a = alpha
		Render:FillCircle(pos, 29, self.experienciaExibindo.cor)
		
		Render:SetClip(false)
		Render:FillCircle(pos, 23, Color(9, 8, 6, alpha))
		
		if (self.timerExperienciaExibindo:GetSeconds() > 0.5) then

			local textSize = Render:GetTextSize(tostring(self.experienciaExibindo.valor), 16)
			DrawTextSombreado(pos - Vector2(textSize.x / 2, textSize.y - 3), tostring(self.experienciaExibindo.valor), Color(230,230,230, alpha), 16)
			DrawTextSombreado(pos - Vector2(Render:GetTextWidth("EXP", 14) / 2, -3), "EXP", Color(230,230,230, alpha), 14)

		end
		
		local texto = self.experienciaExibindo.texto
		
		DrawTextSombreado(pos + Vector2(50, - Render:GetTextHeight(texto, 20) / 2), texto, Color(250,250,250, alpha), 20)
		
		if (self.timerExperienciaExibindo:GetSeconds() > 4) then
			self.experienciaExibindo.alpha = math.max(self.experienciaExibindo.alpha - 30, 0)

		end
			
		if (self.timerExperienciaExibindo:GetSeconds() > 5) then
			self.experienciaExibindo = nil
			self:ProximaExperiencia()
		end

	end
	
end


function StatusHUD:ExibirItem()
	
	if (self.itemExibindo) then

		DrawTextSombreado(self.posicaoItemExibindo, self.itemExibindo.texto, self.itemExibindo.cor, self.itemExibindo.size)

		if (self.timerItemExibindo:GetSeconds() > 2.5) then
			self.posicaoItemExibindo = self.posicaoItemExibindo + Vector2(0, 10)
			self.itemExibindo.cor.a = math.max(self.itemExibindo.cor.a - 20, 0)
		end
		
		if (self.timerItemExibindo:GetSeconds() > 3) then
			self.itemExibindo = nil
			self:ProximoItem()
		end

	end	
	
end