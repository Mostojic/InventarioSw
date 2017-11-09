class Cliente < ApplicationRecord

	validate :rut_valido

  def rut_valido
  	suma=0
  	c=2
  	salir=0
    if !rut.blank? and !direccion.blank?
    	ruti=0
    	ruti=rut
    	while salir==0
    		resto = ruti%10
    		multiplicacion=c*resto
    		suma=suma+multiplicacion
    		c=c+1
    		if c==8
    			c=2
    		end
    		ruti = ruti / 10
    		if ruti==0
    			salir=1
    		end
    	end
    	resto=suma%11
    	digi=11-resto
    	if 	digi==11 and direccion !='0'
    		errors.add(:rut, ": RUT INGRESADO NO ES VALIDO")
    	end
    	if 	digi==10 and direccion !='k'
    		errors.add(:rut, ": RUT INGRESADO NO ES VALIDO")
    	end
    	if 	digi<10 and direccion.to_i !=digi
    		errors.add(:rut, ": RUT INGRESADO NO ES VALIDO")
    	end
    end
   end
end