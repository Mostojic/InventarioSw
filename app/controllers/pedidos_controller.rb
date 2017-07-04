class PedidosController < ApplicationController
	
	def index
	@pedidos =	Pedido.all
	end

	def show
		@pedido = Pedido.find(params[:id])
		@item = Item.new
		@items = Item.all
	end

	def new
	@pedido = Pedido.new
	end

	def create
		@pedido = Pedido.new(cliente: params[:pedido][:cliente],
			entrega: params[:pedido][:entrega],
			comentario: params[:pedido][:comentario],
			abonado: params[:pedido][:abonado])

		if @pedido.save
			redirect_to @pedido
		else
			render :new
		end 

	end

	def destroy 
		@pedido = Pedido.find(params[:id])
		@pedido.delete
		redirect_to @pedido
	end

end