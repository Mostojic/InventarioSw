class Item < ApplicationRecord
	belongs_to :pedido
	belongs_to :producto

	
end
