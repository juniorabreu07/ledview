class AddDireccionToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :direccion, :string
  end
end
