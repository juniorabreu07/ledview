class AddRoleToUsuario < ActiveRecord::Migration
  def change
    add_reference :usuarios, :role, index: true, foreign_key: true
  end
end
