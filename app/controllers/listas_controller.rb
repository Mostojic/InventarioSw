class ListasController < ApplicationController

	
	def new
		pedido=Pedido.last
		Pedido.update(pedido.id, :mostrar => 1)
		redirect_to pedidos_path
	end
	
	def index
		pedido=Pedido.last
		Pedido.update(pedido.id, :mostrar => 0)
		redirect_to pedidos_path
	end
	
	def edit
		@pedido = Pedido.find(params[:id])
		pedido=Pedido.last
		Pedido.update(pedido.id, :mostrar => 2)
		redirect_to pedidos_path
	end
	
	def show
		@pedido = Pedido.find(params[:id])
		@item = Item.new
		@items = Item.all
	end
end