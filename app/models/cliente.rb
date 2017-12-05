class Cliente < ApplicationRecord

	validate :rut_valido
    validates :telefono ,length: {maximum: 9, :message => ":INGRESE NUMERO DE 9 CIFRAS"}
    validates :telefono ,length: {minimum: 9, :message => ":INGRESE NUMERO DE 9 CIFRAS"}
    validates :telefono, numericality: {:message => ': SOLO DEBE INGRESAR NÚMEROS'}
    validates :cumple, presence: { message: ": DEBE INGRESAR FECHA CORRECTAMENTE" }
    validate :fecha_esta_en_futuro, :fecha_muy_viejo
  
  def rut_valido
  	suma=0
  	c=2
  	salir=0
    if !rut.blank? and !digito.blank?
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
    	if 	digi==11 and digito !='0'
    		errors.add(:rut, ": RUT INGRESADO NO ES VALIDO")
    	end
    	if 	digi==10 and digito !='k'
    		errors.add(:rut, ": RUT INGRESADO NO ES VALIDO")
    	end
    	if 	digi<10 and digito.to_i !=digi
    		errors.add(:rut, ": RUT INGRESADO NO ES VALIDO")
    	end
    end
   end

   def fecha_esta_en_futuro
        if !cumple.blank? and cumple > Date.today
            errors.add(:cumple,": FECHA CUMPLEAÑOS NO PUEDE ESTAR EN FUTURO")
        end
    end

    def fecha_muy_viejo
        if !cumple.blank? and Date.today-cumple>37000
            errors.add(:cumple,": FECHA CUMPLEAÑOS NO PUEDE SUPERAR 100 AÑOS")
        end
    end

        
end