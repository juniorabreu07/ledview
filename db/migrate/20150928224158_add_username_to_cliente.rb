class AddUsernameToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :username, :string
    add_index :clientes, :username, unique: true
  end
end
