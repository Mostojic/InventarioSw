class AddMededaIdToInsumos < ActiveRecord::Migration[5.1]
  def change
    add_reference :insumos, :medida, foreign_key: true
  end
end
