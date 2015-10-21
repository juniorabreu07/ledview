class CreatePantallas < ActiveRecord::Migration
  def change
    create_table :pantallas do |t|
      t.date :tiempo
      t.references :provincia, index: true, foreign_key: true
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
