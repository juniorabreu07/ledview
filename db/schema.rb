# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151117204156) do

  create_table "anuncios", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "texto"
    t.integer  "cliente_id"
    t.string   "estado"
    t.date     "fecha_end"
    t.time     "hora"
    t.decimal  "precio"
    t.string   "cfile"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "tipo"
    t.string   "video"
  end

  add_index "anuncios", ["cliente_id"], name: "index_anuncios_on_cliente_id"

  create_table "anuncios_provincia", force: :cascade do |t|
    t.integer "anuncio_id"
    t.integer "provincia_id"
  end

  add_index "anuncios_provincia", ["anuncio_id"], name: "index_anuncios_provincia_on_anuncio_id"
  add_index "anuncios_provincia", ["provincia_id"], name: "index_anuncios_provincia_on_provincia_id"

  create_table "clientes", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "cedula"
    t.string   "direccion"
    t.string   "username"
  end

  add_index "clientes", ["email"], name: "index_clientes_on_email", unique: true
  add_index "clientes", ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true
  add_index "clientes", ["username"], name: "index_clientes_on_username", unique: true

  create_table "pantallas", force: :cascade do |t|
    t.date     "tiempo"
    t.integer  "provincia_id"
    t.string   "descripcion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "pantallas", ["provincia_id"], name: "index_pantallas_on_provincia_id"

  create_table "provincias", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "cedula"
    t.string   "direccion"
    t.string   "telefono"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  add_index "usuarios", ["username"], name: "index_usuarios_on_username", unique: true

end
