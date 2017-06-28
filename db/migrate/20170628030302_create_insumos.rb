class CreateInsumos < ActiveRecord::Migration[5.1]
  def change
    create_table :insumos do |t|
      t.string :nombre
      t.integer :cantidad
      t.integer :precio
      t.string :u_medida

      t.timestamps
    end
  end
end
