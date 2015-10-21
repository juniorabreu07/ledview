class CreateAnuncios < ActiveRecord::Migration
  def change
    create_table :anuncios do |t|
      t.string :descripcion
      t.string :texto
      t.references :cliente, index: true, foreign_key: true
      t.string :estado
      t.date :fecha_end
      t.time :hora
      t.decimal :precio
      t.string :cfile

      t.timestamps null: false
    end
  end
end
