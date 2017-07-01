class Producto < ApplicationRecord
	has_and_belongs_to_many :insumos
	has_and_belongs_to_many :pedidos
 
end
