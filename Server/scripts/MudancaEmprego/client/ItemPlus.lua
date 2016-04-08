class 'ItemPlus'


function ItemPlus:__init()

	self.texto = "nulo"
	self.descricao = ""
	self.texto2 = false
	self.lista = false
	self.valor = nil
	self.ativo = true
	

end


function ItemPlus:SetAtivo(args)

	self.ativo = args

end
function ItemPlus:GetAtivo()

	return self.ativo

end


function ItemPlus:SetValor(args)

	self.valor = args

end


function ItemPlus:GetValor()

	return self.valor

end


function ItemPlus:GetDescricao()

	return self.descricao

end


function ItemPlus:GetTexto()

	return self.texto

end


function ItemPlus:GetLista()

	return self.lista

end


function ItemPlus:GetTexto2()

	return self.texto2

end


function ItemPlus:SetDescricao(descricao)

	self.descricao = tostring(descricao)

end


function ItemPlus:SetTexto(texto)

	self.texto = tostring(texto)

end


function ItemPlus:SetTexto2(texto)

	self.texto2 = tostring(texto)

end


function ItemPlus:GetTipo()

	return "item"

end

function ItemPlus:SetLista(lista)

	self.lista = lista

end


