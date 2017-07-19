class AddRoleToUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :role, :string, default: "user"
  end
end
