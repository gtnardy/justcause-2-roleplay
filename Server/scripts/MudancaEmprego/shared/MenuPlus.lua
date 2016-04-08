class 'MenuPlus'


function MenuPlus:__init()

	self.posicao = Vector2(0,0)
	self.tamanho = Vector2(270,75)
	self.titulo = "titulo"
	self.tituloCor = Color(0,0,0)
	self.tituloCorFundo = Color(255,255,255)
	self.tituloTamanho = 25
	self.margem = 15
	self.lista = ListaPlus(self)
	self.ativo = false
	
	Events:Subscribe("Render", self, self.Render)
	
end


function MenuPlus:Render()

	if self.ativo then
	
		Render:FillArea(self.posicao, self.tamanho, self.tituloCorFundo)
		Render:DrawText(self.posicao + Vector2(self.margem, self.margem) + Vector2(1,1), self.titulo, Color(0,0,0,200), self.tituloTamanho)
		Render:DrawText(self.posicao + Vector2(self.margem, self.margem), self.titulo, self.tituloCor, self.tituloTamanho)
		Render:DrawText(self.posicao + Vector2(self.margem, self.margem) + Vector2(1,0), self.titulo, self.tituloCor, self.tituloTamanho)
	
	
	end

end


function MenuPlus:SetTamanho(vector2)

	self.tamanho = Vector2(vector2.x, vector2.y)

end


function MenuPlus:GetAtivo(args)

	return self.ativo
	
end


function MenuPlus:SetAtivo(args)

	self.ativo = args
	
end


function MenuPlus:GetLista()

	return self.lista
	
end


function MenuPlus:SetTituloCor(cor)

	self.tituloCor = cor
	
end


function MenuPlus:SetTituloCorFundo(cor)

	self.tituloCorFundo = cor
	
end


function MenuPlus:SetTitulo(titulo)

	self.titulo = tostring(titulo)
	
end


function MenuPlus:GetTamanho()

	return self.tamanho
	
end


function MenuPlus:GetTipo()

	return "menu"

end


function MenuPlus:SetPosicao(args)

	self.posicao = Vector2(args.x, args.y)
	
end


function MenuPlus:GetPosicao()

	return self.posicao
	
end
