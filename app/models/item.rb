class Item < ApplicationRecord
	belongs_to :pedido
	belongs_to :producto

	validates :cantidad, presence: {:message => ': Debe ingresar numero de elementos que desea'}
	validates :cantidad, numericality: {:message => ': Solo debe ingresar números'}
end
