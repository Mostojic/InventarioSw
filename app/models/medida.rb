class Medida < ApplicationRecord
	validates :nombre, presence: {:message => 'Se necesita unidad de medida'}
	validates :nombre, uniqueness: {:message => 'Unidad de medida ingresada ya existe'}
end
