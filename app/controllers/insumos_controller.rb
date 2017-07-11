class InsumosController < ApplicationController
	
	def index
	@insumos = Insumo.paginate(page: params[:page],per_page:8)
	end

	def show
		@insumo = Insumo.find(params[:id])
	end

	def new
	@insumo = Insumo.new
	end

	def create
		@insumo = Insumo.new(nombre: params[:insumo][:nombre],
			precio: params[:insumo][:precio],
			nombre: params[:insumo][:nombre],
			medida_id: params[:insumo][:medida_id])
		if @insumo.save
			redirect_to @insumo		
		else
			render :new
		end 
	end

	def destroy 
		@insumo = Insumo.find(params[:id])
		@insumo.delete
		redirect_to insumos_path
	end

end