class Elemento < ApplicationRecord
	belongs_to :insumo
	
   	validates :cantidad, numericality: {:message => ': SOLO DEBE INGRESAR NUMEROS'}
   	validates :cantidad, presence: {:message => ': INGRESE CANTIDAD QUE DESEA AGREGAR	'}
   	validates :vencimiento, presence: {:message => ': INGRESE FECHA DE VENCIMIENTO CORRECTAMENTE'}
   	validates :cantidad, length: {maximum: 5, :message => ": NO PUEDE SUPERAR LAS 4 CIFRAS"}
   	validate :fecha_esta_en_pasado, :positivo, :esta_decada
	

	def fecha_esta_en_pasado
		if !vencimiento.blank? and vencimiento < Date.today
			errors.add(:vencimiento,": FECHA DE VENCIMIENTO NO PUEDE ESTAR EN PASADO")
		end

	end

	def positivo
    if !cantidad.blank? and cantidad<=0
      errors.add(:cantidad, ": DEBE INGRESAR CANTIDAD SUPERIOR A 0")
    end
  end
  
  def esta_decada
    if !vencimiento.blank? and vencimiento > Date.today+1095
      errors.add(:vencimiento,": FECHA DE VENCIMIENTO NO PÚEDE SUPERAR 3 AÑOS EN EL FUTURO")
    end
  end  

end