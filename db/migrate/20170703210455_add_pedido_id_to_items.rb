class AddPedidoIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :pedido, foreign_key: true
  end
end
