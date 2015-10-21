class CreateAnuncioProvincia < ActiveRecord::Migration
  def change
    create_table :anuncios_provincia do |t|
      t.references :anuncio, index: true, foreign_key: true
      t.references :provincia, index: true, foreign_key: true
    end
  end
end
