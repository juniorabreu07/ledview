class CreateRole < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :descripcion
      t.string :nombre
    end
  end
end
