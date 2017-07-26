class ElementosController < ApplicationController
	before_action :validate_user	
	
	def index
	@insumos = Insumo.order("nombre").paginate(page: params[:page],per_page:7)
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

private
  		def validate_user
  			if !usuario_signed_in?
  				redirect_to new_usuario_session_path
  			end
  		end
	
end