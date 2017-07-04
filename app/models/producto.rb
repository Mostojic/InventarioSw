class Producto < ApplicationRecord
	has_many :hojas
	has_many :items	

	validates :nombre, presence: {:message => ': Se necesita nombre del producto'}
	validates :nombre, uniqueness: {:message => ': Producto ingresado ya existe'}
	validates :precio, presence: {:message => ': Debe ingresar precio de venta'}
	validates :precio, numericality: {:message => ': Solo debe ingresar números'}
 
end
