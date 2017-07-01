class ProductosController < ApplicationController
	
	def index
	@productos =	Producto.all
	end

	def show
		@producto = Producto.find(params[:id])
	end

	def new
	@producto = Producto.new
	end

	def create
		@producto = Producto.new(nombre: params[:producto][:nombre])
		@producto.save
		redirect_to @producto
	end

end