class InsumosController < ApplicationController
	
	before_action :validate_user	
	def index
	@insumos = Insumo.paginate(page: params[:page],per_page:7)
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
		@insumo.nombre=@insumo.nombre.strip
		@insumo.nombre=@insumo.nombre.downcase
		@insumo.nombre=@insumo.nombre.capitalize
		if @insumo.save
			redirect_to @insumo		
		else
			render :new
		end 
	end

	def destroy 
		@insumo = Insumo.find(params[:id])
		hojas = Hoja.all
		produ=0
		elem=0
    	hojas.each do |a|
      		if @insumo.id == a.insumo_id
        		produ=1
        	end
    	end
    	elementos = Elemento.all
    	elementos.each do |a|
      		if @insumo.id == a.insumo_id
        		elem=1
        	end
    	end
    	if produ==0 and elem==0
    		@insumo.delete
			redirect_to insumos_path
		else
			redirect_to insumos_path
			
		end
	end

	def edit
		@insumo = Insumo.find(params[:id])
	end

	def update
	   @nombre = params[:insumo]["nombre"]
	   @precio = params[:insumo]["precio"]
	   @medida = params[:insumo]["medida_id"]
	   @insumo = Insumo.find(params[:id])
	   @insumo.nombre = @nombre
	   @insumo.precio = @precio
	   @insumo.medida_id = @medida
	   @insumo.nombre=@insumo.nombre.strip
		@insumo.nombre=@insumo.nombre.downcase
		@insumo.nombre=@insumo.nombre.capitalize
	   if @insumo.save
			redirect_to insumos_path
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