class 'GerenciadorEconomia'

function GerenciadorEconomia:__init()

	
	self.pedidos = {}
	
	Network:Subscribe("AtualizarPedidos", self, self.AtualizarPedidos)
end


function GerenciadorEconomia:AtualizarPedidos(args)

	Events:Fire("AtualizarPedidos", args)
end


function GerenciadorEconomia:AtualizarPedido(args)

	Events:Fire("AtualizarPedido", args)
end


gerenciadorEconomia = GerenciadorEconomia()