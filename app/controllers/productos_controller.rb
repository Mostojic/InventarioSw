class ProductosController < ApplicationController
	
	def index
	@productos =	Producto.all
	end

	def show
		@producto = Producto.find(params[:id])
		@hoja = Hoja.new
		@hojas = Hoja.all
	end

	def new
	@producto = Producto.new
	end

	def create
		@producto = Producto.new(nombre: params[:producto][:nombre], 
								precio: params[:producto][:precio])
		if @producto.save
			redirect_to @producto
		else
			render :new
		end 

	end

	def destroy 
		@producto = Producto.find(params[:id])	
		@producto.delete
		redirect_to @producto
	end

end