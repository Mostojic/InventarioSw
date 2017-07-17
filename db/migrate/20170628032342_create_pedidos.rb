class CreatePedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :pedidos do |t|
      t.string :cliente
      t.integer :estado
      t.date :entrega
      t.time :retiro
      t.text :comentario
      t.integer :precio
      t.integer :abonado
      t.integer :mostrar

      t.timestamps
    end
  end
end
