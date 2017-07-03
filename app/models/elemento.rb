class Elemento < ApplicationRecord
	belongs_to :insumo
	
   	validates :cantidad, numericality: {:message => ': Solo debe ingresar números'}
   	validates :cantidad, presence: {:message => ': Ingrese cantidad que desea ingresar	'}
   	

end
