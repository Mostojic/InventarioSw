class CreateRecetas < ActiveRecord::Migration[5.1]
  def change
    create_table :recetas do |t|
      t.string :nombre
      t.integer :precio

      t.timestamps
    end
  end
end
