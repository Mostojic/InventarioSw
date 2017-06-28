class Insumo < ApplicationRecord
	has_many :receta
  
 	validates :nombre, presence: {:message => 'Se necesita nombre de producto'}
  	validates :nombre , uniqueness: {:message => 'El producto ingresado ya existe'}
  	validates :cantidad, numericality: true: {:message => 'Ingrese un número'}
	validates :u_medida, presence: {:message => 'Ingrese unidad de medida delproducto'}
	validates :fecha_vencimiento_valida
   	validates :precio, presence: {:message => 'Ingrese precio del producto'}
   	validates :precio, numericality: true: {:message => 'Ingrese un número'}
  	def fecha_vencimiento_valida
     	if fecha_venc.blank? and fecha_venc < Date.today
       	errors.add(:fecha_venc,"Fecha ingresada no es válida")
    	end
  	end 
end