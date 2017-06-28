class CreateElementos < ActiveRecord::Migration[5.1]
  def change
    create_table :elementos do |t|
      t.integer :cod_elemento
      t.float :cantidad
      t.date :vencimiento

      t.timestamps
    end
  end
end
