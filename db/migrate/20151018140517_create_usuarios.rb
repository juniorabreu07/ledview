class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.string :cedula
      t.string :direccion
      t.string :telefono
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
