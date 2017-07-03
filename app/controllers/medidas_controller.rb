class MedidasController < ApplicationController
	
	def index
	@medidas = Medida.all
	end

	def show
		@medida = Medida.find(params[:id])
	end

	def new
	@medida = Medida.new
	end

	def create
		@medida = Medida.new(nombre: params[:medida][:nombre])
		if @medida.save
			redirect_to @medida
		else
			render :new
		end 

	end
end
