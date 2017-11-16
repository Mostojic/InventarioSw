class Insumo < ApplicationRecord
	belongs_to :medida
  has_many :elementos
  has_many :hojas
	has_and_belongs_to_many :productos
  
 	validates :nombre, presence: {:message => ': SE NECESITA NOMBRE DEL INSUMO'}
  validates :nombre, uniqueness: {:message => ': INSUMO INGRESADO YA EXISTE'}
  validates :nombre, length: {maximum: 25, :message => ": NO PUEDE EXCEDER LOS 25 CARACTERES"}
  validates :precio, presence: {:message => ': INGRESE PRECIO DE PRODUCTO'}
  validates :precio, numericality: {:message => ': SOLO DEBE INGRESAR NÚMEROS'}
  validates :precio, length: {maximum: 6, :message => ": NO PUEDE EXCEDER LAS 6 CIFRAS"}
  validate :positivo

  def positivo
    if !precio.blank? and precio<1
      errors.add(:precio, ": DEBE INGRESAR VALOR SUPERIOR A $0")
    end
  end
  
end