class WelcomeController < ApplicationController
  def index
  	@pedidos = Pedido.all
  	@insumos = Insumo.all
  	@elementos = Elemento.all
  	@items=Item.all
  end
end
