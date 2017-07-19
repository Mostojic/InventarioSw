class ItemsController < ApplicationController
	before_action :validate_user
	before_action :set_pedido
	
	def index
	

	end

	def new
	@item = Item.new
	end

	def show
		@item = Item.find(params[:id])
	end

	


	def create
		@item = Item.new(producto_id: params[:item][:producto_id],
				pedido_id: params[:item][:pedido_id],
				cantidad: params[:item][:cantidad])
		@item.pedido = @pedido
		@item.save
		redirect_to @pedido
	end

	def destroy 
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to @pedido
	end

	private
		def set_pedido 
			@pedido = Pedido.find(params[:pedido_id])
		end


  		def validate_user
  			if !usuario_signed_in?
  				redirect_to new_usuario_session_path
  			end
  		end
	
end