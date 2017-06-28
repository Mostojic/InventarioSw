class CreateInsumosProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :insumos_productos, :id => false do |t|
    	t.integer :insumo_id
    	t.integer :producto_id
    end
  end

  def self.down
  	drop_table:insumos_productos
  end
end

