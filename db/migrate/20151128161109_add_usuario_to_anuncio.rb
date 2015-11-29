class AddUsuarioToAnuncio < ActiveRecord::Migration
  def change
    add_reference :anuncios, :usuario, index: true, foreign_key: true
  end
end
