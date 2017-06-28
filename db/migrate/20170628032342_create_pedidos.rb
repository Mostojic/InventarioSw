class CreatePedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :pedidos do |t|
      t.string :cliente
      t.boolean :entregado
      t.date :entrega
      t.time :retiro
      t.text :comentario
      t.integer :precio
      t.integer :abonado

      t.timestamps
    end
  end
end
