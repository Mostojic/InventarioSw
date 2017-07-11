class PedidosController < ApplicationController
	
	def index
	@pedidos =	Pedido.paginate(page: params[:page],per_page:8)
	end

	def edit
		@pedido = Pedido.find(params[:id])
		@abonado = @pedido.abonado
	end

	def update
	   @abonado = params[:pedido]["abonado"]
	   @comentario = params[:pedido]["comentario"]
	   @pedido = Pedido.find(params[:id])
	   @pedido.abonado = @abonado
	   @pedido.comentario = @comentario
	   @pedido.save()
	      render :edit
	   
	end



	def show
		@pedido = Pedido.find(params[:id])
		@item = Item.new
		@items = Item.all
	end

	def new
	@pedido = Pedido.new

	end

	def create
		@pedido = Pedido.new(cliente: params[:pedido][:cliente],
			entrega: params[:pedido][:entrega],
			comentario: params[:pedido][:comentario],
			abonado: params[:pedido][0])

		if @pedido.save
			redirect_to @pedido
		else
			render :new
		end 

	end

	def destroy 
		@pedido = Pedido.find(params[:id])
		@pedido.delete
		redirect_to @pedido
	end

end