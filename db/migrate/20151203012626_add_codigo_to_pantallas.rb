class AddCodigoToPantallas < ActiveRecord::Migration
  def change
    add_column :pantallas, :Codigo, :string
  end
end
