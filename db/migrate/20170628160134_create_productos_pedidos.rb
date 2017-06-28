class CreateProductosPedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos_pedidos, :id => false do |t|
    	t.integer :producto_id
    	t.integer :pedido_id
    end
  end

  def self.down
  	drop_table:productos_pedidos
  end
end

