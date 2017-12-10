class Cliente < ApplicationRecord
    validate :fecha_esta_en_futuro, :fecha_muy_viejo

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