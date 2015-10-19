class AddCedulaToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :cedula, :string
  end
end
