class Item < ApplicationRecord
	belongs_to :pedido
	belongs_to :producto

	validates :cantidad, presence: {:message => ': Debe ingresar numero de elementos que desea'}
	validates :cantidad, numericality: {:message => ': Solo debe ingresar números'}
	validates :cantidad, length: {maximum: 4, :message => ": No puede superar las 4 cifras"}
end
