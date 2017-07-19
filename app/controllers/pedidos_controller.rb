class PedidosController < ApplicationController
	before_action :validate_user	
	def index
	@pedidos_pendiente =	Pedido.where(estado: [1]).order('entrega')
	@pedidos_espera =	Pedido.where(estado: [0]).order('entrega')
	@pedidos_entregado =	Pedido.where(estado: [2]).paginate(page: params[:page],per_page:2)
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
		items=Item.all
		items.each do |a|
			if a.pedido_id==@pedido.id
				a.delete
			end
		end
		@pedido.delete
		redirect_to @pedido
	end


private
  		def validate_user
  			if !usuario_signed_in?
  				redirect_to new_usuario_session_path
  			end
  		end
	
end