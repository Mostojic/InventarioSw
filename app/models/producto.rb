class Producto < ApplicationRecord
	has_and_belongs_to_many :insumos
	has_and_belongs_to_many :pedidos
  
  validates :cod_receta , uniqueness: true
  validates :nombre, presence: {:message => 'Se necesita nombre de la receta'}
  validates :nombre, uniqueness: {:message => 'La receta ingresada ya existe'}
  validates :precio_venta, numericality: true
end
