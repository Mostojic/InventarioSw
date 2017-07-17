class Hoja < ApplicationRecord
	belongs_to :insumo
	belongs_to :producto

	validates :porcion, presence: {:message => ': Ingrese porcion del insumo'}
	validates :porcion, numericality: {:message => ': Solo debe ingresar números'}
	validates :porcion, length: {maximum: 5, :message => ": no puede exceder los 5 digitos"}
  	validate :positivo

  	def positivo
    	if !porcion.blank? and porcion<=0
      		errors.add(:porcion, ": Debe ingresar porcion superior a 0")
    	end
  	end
  

end
