class WelcomeController < ApplicationController
	before_action :validate_user
  def index
  	@pedidos = Pedido.all.order('entrega')
  	@insumos = Insumo.all
  	@elementos = Elemento.all
  	@items=Item.all
  end
  	private
  		def validate_user
  			if !usuario_signed_in?
  				redirect_to new_usuario_session_path
  			end
  		end
	
end
