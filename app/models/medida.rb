class Medida < ApplicationRecord
	has_many :insumos
	
	validates :nombre, presence: {:message => ': INGRESE NOMBRE UNIDAD'}
	validates :nombre, uniqueness: {:message => ': UNIDAD DE MEDIDA YA EXISTE'}
	validates :nombre, length: {minimum: 1, maximum: 10, :message => ": DEBE TENER ENTRE 1 Y 10 CARACTERES"}

end
