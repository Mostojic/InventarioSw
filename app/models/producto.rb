class Producto < ApplicationRecord
	has_many :hojas
	has_many :items	

	validates :nombre, presence: {:message => ': Se necesita nombre del producto'}
	validates :nombre, uniqueness: {:message => ': Producto ingresado ya existe'}
	validates :nombre, length: {maximum: 40, :message => ": no puede exceder los 40 caracteres"}
 	validates :precio, length: {maximum: 6, :message => ": no puede exceder los 6 digitos"}
 	validate :positivo

  def positivo
    if !precio.blank? and precio<1
      errors.add(:precio, ": Debe ingresar precio superior a $0")
    end
  end
  

end
