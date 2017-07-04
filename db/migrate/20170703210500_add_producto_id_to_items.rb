class AddProductoIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :producto, foreign_key: true
  end
end
