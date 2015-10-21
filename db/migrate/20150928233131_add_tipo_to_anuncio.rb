class AddTipoToAnuncio < ActiveRecord::Migration
  def change
    add_column :anuncios, :tipo, :string
  end
end
