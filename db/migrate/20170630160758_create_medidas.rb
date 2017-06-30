class CreateMedidas < ActiveRecord::Migration[5.1]
  def change
    create_table :medidas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
