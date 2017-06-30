class ElementosController < ApplicationController
	
	def index
	@elementos =	Elemento.all
	end

	#get/elemento/id
	def show
		@elemento = Elemento.find(params[:insumo_id])
	end

	def new
		@elemento = Elemento.new
	end

end