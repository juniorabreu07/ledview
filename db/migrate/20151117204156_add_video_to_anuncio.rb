class AddVideoToAnuncio < ActiveRecord::Migration
  def change
    add_column :anuncios, :video, :string
  end
end
