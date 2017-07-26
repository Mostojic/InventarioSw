class Pedido < ApplicationRecord
	has_many :items

	validates :cliente, presence: { message: ": Debe ingresar nombre del cliente" }
	validates :cliente, length: {maximum: 40, :message => ": Nombre no puede exeder los 40 caracteres"}
	validates :entrega, presence: { message: ": Debe ingresar fecha de entrega correctamente" }
	validates :abonado, length: {maximum: 7, :message => ": No puede superar las 7 cifras"}
	validates :comentario, length: {maximum: 200, :message => ": No puede superar los 200 caracteres"}
	validate :fecha_esta_en_pasado, :fecha_es_domingo, :positivo, :este_ano

  	def positivo
    	if !abonado.blank? and abonado<=0
      		errors.add(:abonado, ": Debe ingresar porcion superior a 0")
    	end
  	end

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

	def este_ano
    if !entrega.blank? and entrega > Date.today+365
      errors.add(:entrega,": Fecha no puede superar 1 año en el futuro")
    end
  end  





end
