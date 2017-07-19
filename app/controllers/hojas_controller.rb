class HojasController < ApplicationController
	
	before_action :validate_user
	before_action :set_producto
	
	def index
	@productos =	Producto.all
	
	end

	def new
	@hoja = Hoja.new
	end

	def show
		@hoja = Hoja.find(params[:id])
	end

	


	def create
		@hoja = Hoja.new(producto_id: params[:hoja][:producto_id],insumo_id: params[:hoja][:insumo_id],
					porcion: params[:hoja][:porcion])
		@hoja.producto = @producto
		@hoja.save
		redirect_to @producto
	end

	def destroy 
		@hoja = Hoja.find(params[:id])
		@hoja.destroy
		redirect_to @producto
	end

	private
		def set_producto 
			@producto = Producto.find(params[:producto_id])
		end

  		def validate_user
  			if !usuario_signed_in?
  				redirect_to new_usuario_session_path
  			end
  		end
	
end