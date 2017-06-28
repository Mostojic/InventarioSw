class ElementosController < ApplicationController
	
	def index
	@elemento =	Elemento.all
	end

	#get
	def show
		@elemento = Elemento.find(params[:insumo_id])
	end

	def new
	@elemento = Elemento.new
	end

