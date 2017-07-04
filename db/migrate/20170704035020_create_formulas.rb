class CreateFormulas < ActiveRecord::Migration[5.1]
  def change
    create_table :formulas do |t|
      t.float :porcion
      t.integer :insumo_id

      t.timestamps
    end
  end
end
