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

ActiveRecord::Schema.define(version: 2019_02_27_110235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.integer "idCliente"
    t.string "Nombre"
    t.string "CIF"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facturas", force: :cascade do |t|
    t.integer "NumFactura"
    t.date "Fecha"
    t.integer "Cliente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lin_facturas", force: :cascade do |t|
    t.integer "NumFactura"
    t.text "Concepto"
    t.decimal "Cantidad"
    t.decimal "Precio"
    t.decimal "Total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.string "Nombre"
    t.string "Descripcion"
    t.integer "Stock"
    t.integer "Precio_Unitario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
