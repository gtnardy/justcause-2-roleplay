class 'Produtor'

function Produtor:__init()

	self.produtores = {}
	
	Network:Subscribe("AtualizarPlayer", self, self.AtualizarPlayer)
	
	Events:Subscribe("Render", self, self.Render)
	
	Events:Subscribe("AtualizarSpots", self, self.AtualizarSpots)
end


function Produtor:AtualizarPlayer(args)

	if args.produtores then
		self.produtores = args.produtores
		self:AtualizarSpots()
	end
	
end


function Produtor:AddSpot(produtor)

	local idImagem = 3
	local tipo = -3
	local nome = "Produtor"

	local descricao = ""

	Events:Fire("AddSpot", {nome = nome, tipo = tipo, descricao = descricao, posicao = produtor.posicao, grupo = "Produtor", index = produtor.idProdutor, idImagem = idImagem})

end


function Produtor:AtualizarSpots(args)

	for idProdutor, produtor in ipairs(self.produtores) do
	
		--descricao, nome, posicao, idImagem, grupo, index,
		self:AddSpot(produtor)

	end
end


function Produtor:ModuleUnload()

	Events:Fire("DeleteSpot", {grupo = "Produtor"})

end


function Produtor:Render()

	for _, produtor in pairs(self.produtores) do
	
		local pos = produtor.posicao + Vector3(0, 1, 0)
		local dist = pos:Distance(LocalPlayer:GetPosition())

		if dist <= 150 then
		
			local pos_2d, success = Render:WorldToScreen(pos)
			if success then 
			
				local escala = self:CalculateAlpha(dist, 10, 150)

				local alpha = escala--math.max(0, escala * 1 * (1.0 - (aim * 10)))
				
				-- local imagemDesenhar = self.imagemProdutorLiberada
				-- if self.ProdutorPropria and self.ProdutorPropria.idProdutor == produtor.idProdutor then
					-- imagemDesenhar = self.imagemProdutorPropria
				-- else
					-- if #produtor.moradores > 0 then
						-- imagemDesenhar = self.imagemProdutorBloqueada
					-- end
				-- end
				-- imagemDesenhar:SetSize(self.imagemProdutorTamanho * escala)
				-- imagemDesenhar:SetPosition(pos_2d - imagemDesenhar:GetSize() / 2)
				-- imagemDesenhar:SetAlpha(alpha)
				-- imagemDesenhar:Draw()
				
				if dist <= 50 then
					local texto = produtor.descricao
					local size = 18
					Render:DrawText(pos_2d - Vector2(Render:GetTextWidth(texto, size, escala) / 2, 40 * escala), texto, Color(255, 255, 255), size, escala)
				end
				
			end

		end
	end

end


function Produtor:CalculateAlpha( dist, bias, max )

    local alpha = 1

    if dist > bias then
        alpha =  1.0 - ( dist - bias ) /
                       ( max  - bias )
    end

    return alpha
end


produtor = Produtor()