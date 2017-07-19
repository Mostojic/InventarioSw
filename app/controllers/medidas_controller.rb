class MedidasController < ApplicationController
	before_action :validate_user	
	def index
	@medidas = Medida.all.order('nombre')
	end

	def show
		@medida = Medida.find(params[:id])
	end

	def new
	@medida = Medida.new
	end

	def create
		@medida = Medida.new(nombre: params[:medida][:nombre])
		if @medida.save
			redirect_to @medida
		else
			render :new
		end 

	end

	def destroy 
		@medida = Medida.find(params[:id])
		insumos = Insumo.all
		insu=0
    	insumos.each do |a|
      		if @medida.id == a.medida_id
        		insu=1
        	end
    	end
    	if insu==0
    		@medida.delete
			redirect_to medidas_path
		else
			redirect_to medidas_path
			
		end
	end


	def edit
		@medida = Medida.find(params[:id])
	end

	def update
	   @nombre = params[:medida]["nombre"]
	   @medida = Medida.find(params[:id])
	   @medida.nombre = @nombre
	   @medida.save()
	      redirect_to medidas_path
	   
	end
	private
  		def validate_user
  			if !usuario_signed_in?
  				redirect_to new_usuario_session_path
  			end
  		end
	
end
