class ProductosController < ApplicationController
	
	def index
	@productos = Producto.paginate(page: params[:page],per_page:7)
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
								precio: params[:producto][1])
		if @producto.save
			redirect_to @producto
		else
			render :new
		end 

	end

	def destroy 
		@producto = Producto.find(params[:id])	
		pedid=0
		items=Item.all
		items.each do |a|
			if a.producto_id==@producto.id
				pedid=1
			end
		end
		if pedid==0
			hojas=Hoja.all
			hojas.each do |a|
				if a.producto_id==@producto.id
					a.delete
				end
			end
			@producto.delete
		end
		redirect_to productos_path
	end

	def edit
		@producto = Producto.find(params[:id])
	end

	def update
	   @precio = params[:producto]["precio"]
	   @producto = Producto.find(params[:id])
	   @producto.precio = @precio
	   if @producto.save()
	   		redirect_to productos_path
	   	else
	   		render :edit
	   	end
	end

end