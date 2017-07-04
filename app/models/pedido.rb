class Pedido < ApplicationRecord
	has_many :items

	validates :cliente, presence: { message: "Debe ingresar nombre del cliente" }
	
	/validates :entrega, precence: { message: "Debe ingresar fecha de entrega" }
	validates :abonado, precence: { message: "Debe ingresar cantidad abonada, de no existir colocar 0" }
	/
	
	validates :abonado, numericality: true
end
