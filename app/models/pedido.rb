class Pedido < ApplicationRecord
	has_many :items

	validates :cliente, presence: { message: ": DEBE INGRESAR NOMBRE DEL CLIENTE" }
	validates :cliente, length: {maximum: 40, :message => ": NOMBRE NO PUEDE EXCEDER LOS 40 CARACTERES"}
	validates :entrega, presence: { message: ": DEBE INGRESAR FECHA CORRECTAMENTE" }
	validates :abonado, length: {maximum: 7, :message => ": NO PUEDE SUPERAR LAS 7 CIFRAS"}
	validates :comentario, length: {maximum: 200, :message => ": NO PUEDE SUPERAR LOS 200 CARACTERES"}
	validate :fecha_esta_en_pasado, :fecha_es_domingo, :positivo, :este_ano

  	def positivo
    	if !abonado.blank? and abonado<0
      		errors.add(:abonado, ": DEBE SER SUPERIOR A 0")
    	end
  	end

	def fecha_esta_en_pasado
		if !entrega.blank? and entrega < Date.today
			errors.add(:entrega,": FECHA DE ENTREGA NO PUEDE ESTAR EN PASADO")
		end

	end
	def fecha_es_domingo
		if !entrega.blank? and entrega.wday==0
			errors.add(:entrega, ": FECHA DE ENTREGA NO PUEDE SER DOMINGO")
		end
	end

	def este_ano
    if !entrega.blank? and entrega > Date.today+365
      errors.add(:entrega,": FECHA DE ENTREGA NO PUEDE SUPERAR UN AÑO EN EL FUTURO")
    end
  end  





end
