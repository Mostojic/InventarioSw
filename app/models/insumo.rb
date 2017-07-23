class Insumo < ApplicationRecord
	belongs_to :medida
  has_many :elementos
  has_many :hojas
	has_and_belongs_to_many :productos
  
 	validates :nombre, presence: {:message => ': Se necesita nombre de producto'}
  validates :nombre, uniqueness: {:message => ': El producto ingresado ya existe'}
  validates :nombre, length: {maximum: 25, :message => ": El nombre no puede exceder los 25 caracteres"}
  validates :precio, presence: {:message => ': Ingrese precio del producto'}
  validates :precio, numericality: {:message => ': Solo debe ingresar números'}
  validates :precio, length: {maximum: 6, :message => ": El precio no puede exceder los 6 digitos"}
  validate :positivo

  def positivo
    if !precio.blank? and precio<1
      errors.add(:precio, ": Debe ingresar precio superior a $0")
    end
  end
  
end