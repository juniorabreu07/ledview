class RemoveClienteFromAnuncio < ActiveRecord::Migration
  def change
    remove_reference :anuncios, :cliente, index: true, foreign_key: true
  end
end
