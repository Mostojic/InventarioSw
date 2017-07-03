class Hoja < ApplicationRecord
	belongs_to :insumo
	belongs_to :producto

	validates :porcion, presence: {:message => ': Ingrese porcion del insumo'}
	validates :porcion, numericality: {:message => ': Solo debe ingresar números'}
end
