class AddConfiguradaToPantallas < ActiveRecord::Migration
  def change
    add_column :pantallas, :configurada, :boolean, default: false
  end
end
