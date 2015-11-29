# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Role.count < 2
  Role.create!( {descripcion: "Administrador", nombre: "admin" } )
  Role.create!( {descripcion: "Cliente", nombre: "cliente" } )
end

Usuario.create!( {nombre: "admin", username: "admin", password: "admin", password_confirmation: "admin", email: "juniorabreu201@gmail.com", admin: true, role_id: Role.first.id})


Usuario.create!( {nombre: "cliente", username: "cliente", password: "cliente", password_confirmation: "cliente", email: "cliente@gmail.com", admin: false, role_id: Role.last.id})

