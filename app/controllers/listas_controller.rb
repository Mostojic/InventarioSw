class ListasController < ApplicationController
	
	before_action :validate_user
	
	def new
		pedido=Pedido.last
		Pedido.update(pedido.id, :mostrar => 1)
		redirect_to pedidos_path
	end
	
	def index
		@pedidos =	Pedido.where(estado: [2]).order('entrega').paginate(page: params[:page],per_page:15)
	end
	
	def edit
		@pedido = Pedido.find(params[:id])
		pedido=Pedido.last
		Pedido.update(pedido.id, :mostrar => 0)
		redirect_to pedidos_path
	end
	
	def show
		@pedido = Pedido.find(params[:id])
		@item = Item.new
		@items = Item.all
	end
	private
  		def validate_user
  			if !usuario_signed_in?
  				redirect_to new_usuario_session_path
  			end
  		end
	
end