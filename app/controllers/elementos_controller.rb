class ElementosController < ApplicationController
	
	def index
	@insumos = Insumo.paginate(page: params[:page],per_page:8)
	end

	#get/elemento/id
	def show
		@elemento = Elemento.find(params[:id])
	end

	def new
		@elemento = Elemento.new
	end

	def create
		@elemento = Elemento.new(insumo_id: params[:elemento][:insumo_id],cantidad: params[:elemento][:cantidad],
					vencimiento: params[:elemento][:vencimiento])
		if @elemento.save
			redirect_to @elemento
		else
			render :new
		end 

	end

	def destroy 
		@elemento = Elemento.find(params[:id])
		@elemento.destroy
		redirect_to @elemento
	end

end