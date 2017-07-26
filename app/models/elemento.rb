class Elemento < ApplicationRecord
	belongs_to :insumo
	
   	validates :cantidad, numericality: {:message => ': Solo debe ingresar números'}
   	validates :cantidad, presence: {:message => ': Ingrese cantidad que desea agregar	'}
   	validates :vencimiento, presence: {:message => ': Ingrese Fecha vencimiento correctamente'}
   	validates :cantidad, length: {maximum: 6, :message => ": cantidad no puede superar las 4 cifras"}
   	validate :fecha_esta_en_pasado, :positivo, :esta_decada
	

	def fecha_esta_en_pasado
		if !vencimiento.blank? and vencimiento < Date.today
			errors.add(:vencimiento,": Fecha vencimiento no puede estar en pasado")
		end

	end

	def positivo
    if !cantidad.blank? and cantidad<=0
      errors.add(:cantidad, ": Debe ingresar cantidad superior a 0")
    end
  end
  
  def esta_decada
    if !vencimiento.blank? and vencimiento > Date.today+1095
      errors.add(:vencimiento,": Fecha no puede superar 3 años en el futuro")
    end
  end  

end