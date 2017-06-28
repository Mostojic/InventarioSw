class Elemento < ApplicationRecord
	belongs_to :insumo
	
   	validates :cantidad, numericality: true
   	

end
