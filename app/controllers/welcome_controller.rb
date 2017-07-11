class WelcomeController < ApplicationController
  def index
  	@pedidos = Pedido.all
  	@insumos = Insumo.all
  	@elementos = Elemento.all
  end
end
