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

ActiveRecord::Schema.define(version: 20170628160134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "elementos", force: :cascade do |t|
    t.integer "cod_elemento"
    t.float "cantidad"
    t.date "vencimiento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "insumo_id"
    t.index ["insumo_id"], name: "index_elementos_on_insumo_id"
  end

  create_table "insumos", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.string "u_medida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insumos_productos", id: false, force: :cascade do |t|
    t.integer "insumo_id"
    t.integer "producto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "cliente"
    t.boolean "entregado"
    t.date "entrega"
    t.time "retiro"
    t.text "comentario"
    t.integer "precio"
    t.integer "abonado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos_pedidos", id: false, force: :cascade do |t|
    t.integer "producto_id"
    t.integer "pedido_id"
  end

  add_foreign_key "elementos", "insumos"
end
