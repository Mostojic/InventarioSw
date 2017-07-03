class AddInsumoIdToHojas < ActiveRecord::Migration[5.1]
  def change
    add_reference :hojas, :insumo, foreign_key: true
  end
end
