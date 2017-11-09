class ClientesController < ApplicationController
	before_action :validate_user	
def index
	@clientes = Cliente.all
end

def new
		@cliente = Cliente.new
end

	def create
		@cliente = Cliente.new(rut: params[:cliente][:rut],
			nombre: params[:cliente][:nombre])
		if @cliente.save
			redirect_to @cliente
		else
			render :new
		end 

	end




	private
  		def validate_user
  			if !usuario_signed_in?
  				redirect_to new_usuario_session_path
  			end
  		end
	
end