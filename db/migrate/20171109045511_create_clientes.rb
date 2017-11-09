class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|
      t.integer :rut
      t.string :nombre
      t.date :cumple
      t.integer :compras
      t.string :direccion
      t.integer :telefono

      t.timestamps
    end
  end
end
