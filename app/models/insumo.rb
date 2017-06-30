class Insumo < ApplicationRecord
	belongs_to :medida
  has_many :elementos
	has_and_belongs_to_many :productos
  
 	validates :nombre, presence: {:message => 'Se necesita nombre de producto'}
  	validates :nombre , uniqueness: {:message => 'El producto ingresado ya existe'}
   	validates :precio, presence: {:message => 'Ingrese precio del producto'}
   	validates :precio, numericality: true
   	/
	validates :fecha_vencimiento_valida
  	def fecha_vencimiento_valida
     	if fecha_venc.blank? and fecha_venc < Date.today
       	errors.add(:fecha_venc,"Fecha ingresada no es válida")
    	end
  	end 

  	/
end