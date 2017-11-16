class Pedido < ApplicationRecord
	has_many :items

	validates :cliente, presence: { message: ": DEBE INGRESAR NOMBRE DEL CLIENTE" }
	validates :cliente, length: {maximum: 40, :message => ": NOMBRE NO PUEDE EXCEDER LOS 40 CARACTERES"}
	validates :entrega, presence: { message: ": DEBE INGRESAR FECHA CORRECTAMENTE" }
	validates :abonado, length: {maximum: 7, :message => ": NO PUEDE SUPERAR LAS 7 CIFRAS"}
	validates :comentario, length: {maximum: 200, :message => ": NO PUEDE SUPERAR LOS 200 CARACTERES"}
	validate :fecha_esta_en_pasado, :fecha_es_domingo, :positivo, :este_ano
	validates :rut, presence: {:message => ': Ingrese rut válido'}
 	validates :rut, length: {maximum: 8, :message => ': INGRESE RUT VÁLIDO'}
 	validates :rut, length: {minimum: 7, :message => ': INGRESE RUT VÁLIDO'}
 	validates :digito, presence: {:message => ': NO HA INGRESADO DÍGITO VERIFICADOR'}
 	validate :rut_valido

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
  
  	def positivo
    	if !abonado.blank? and abonado<0
      		errors.add(:abonado, ": DEBE SER SUPERIOR A 0")
    	end
  	end

	def fecha_esta_en_pasado
		if !entrega.blank? and entrega < Date.today
			errors.add(:entrega,": FECHA DE ENTREGA NO PUEDE ESTAR EN PASADO")
		end

	end
	def fecha_es_domingo
		if !entrega.blank? and entrega.wday==0
			errors.add(:entrega, ": FECHA DE ENTREGA NO PUEDE SER DOMINGO")
		end
	end

	def este_ano
    if !entrega.blank? and entrega > Date.today+365
      errors.add(:entrega,": FECHA DE ENTREGA NO PUEDE SUPERAR UN AÑO EN EL FUTURO")
    end
  end  





end
