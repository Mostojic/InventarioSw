class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :cantidad

      t.timestamps
    end
  end
end
