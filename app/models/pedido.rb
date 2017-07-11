class Pedido < ApplicationRecord
	has_many :items

	validates :cliente, presence: { message: ": Debe ingresar nombre del cliente" }
	
	validates :entrega, presence: { message: ": Debe ingresar fecha de entrega" }
	
	validate :fecha_esta_en_pasado, :fecha_es_domingo
	

	def fecha_esta_en_pasado
		if !entrega.blank? and entrega < Date.today
			errors.add(:entrega,": Fecha entrega no puede estar en pasado")
		end

	end
	def fecha_es_domingo
		if !entrega.blank? and entrega.wday==0
			errors.add(:entrega, ": Fecha de entrega no puede ser dia domingo")
		end
	end






end
