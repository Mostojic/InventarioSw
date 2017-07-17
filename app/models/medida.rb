class Medida < ApplicationRecord
	has_many :insumos
	
	validates :nombre, presence: {:message => ': Se necesita unidad de medida'}
	validates :nombre, uniqueness: {:message => ': Unidad de medida ingresada ya existe'}
	validates :nombre, length: {minimum: 1, maximum: 10, :message => ": La unidad debe tener entre 1 y 10 caracteres"}

end
