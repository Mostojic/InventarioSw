class InsumosController < ApplicationController
	
	def index
	@insumos =	Insumo.all
	end

	def show
		@insumo = Insumo.find(params[:id])
	end

	def new
	@insumo = Insumo.new
	end

	def create
		@insumo = Insumo.new(nombre: params[:insumo][:nombre],precio: params[:insumo][:precio],
					nombre: params[:insumo][:nombre],
					u_medida: params[:insumo][:u_medida])
		@insumo.save
		redirect_to @insumo
	end

end