class ElementosController < ApplicationController
	
	def index
	@insumos = Insumo.all
	end

	#get/elemento/id
	def show
		@elemento = Elemento.find(params[:id])
	end

	def new
		@elemento = Elemento.new
	end

	def create
		@elemento = Elemento.new(cantidad: params[:elemento][:cantidad],
					vencimiento: params[:elemento][:vencimiento],insumo_id: params[:elemento][:insumo_id])
		if @elemento.save
			redirect_to @elemento
		else
			render :new
		end 

	end

end