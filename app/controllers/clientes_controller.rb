class ClientesController < ApplicationController
	before_action :validate_user	

def index
	@clientes = Cliente.all
end

def show
		@cliente = Cliente.find(params[:id])
end

def new
		@cliente = Cliente.new
end

	def create
		@cliente = Cliente.new(rut: params[:cliente][:rut],
			digito: params[:cliente][:digito],nombre: params[:cliente][:nombre])
		if @cliente.save
			redirect_to @cliente
		else
			render :new
		end 

	end

def edit
		@cliente = Cliente.find(params[:id])
	end

	def update
	   @cumple = params[:cliente]["cumple"]
	   @telefono = params[:cliente]["telefono"]
	   @cliente = Cliente.find(params[:id])
	   @cliente.cumple = @cumple
	   @cliente.telefono = @telefono
	   if @cliente.save
			redirect_to clientes_path
		else
			render :edit
		end 
	    
	end



	private
  		def validate_user
  			if !usuario_signed_in?
  				redirect_to new_usuario_session_path
  			end
  		end
	
end