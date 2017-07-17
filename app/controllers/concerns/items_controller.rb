class ItemsController < ApplicationController

def show
		@pedido = Pedido.find(params[:id])
		
	end

end