class Producto < ApplicationRecord
	has_many :hojas
	has_and_belongs_to_many :insumos
	has_and_belongs_to_many :pedidos
 
end
