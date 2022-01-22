# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_11_214500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documentos_lin_pedidos", id: :serial, force: :cascade do |t|
    t.string "codigo", limit: 10, null: false
    t.string "descripcion", limit: 200, null: false
    t.decimal "costo_unitario", precision: 13, scale: 5, null: false
    t.integer "cantidad", null: false
  end

  create_table "documentos_pedidos", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "nit", null: false
    t.string "tercero", limit: 200, null: false
    t.integer "id_clase", null: false
    t.string "clase", limit: 200, null: false
    t.integer "iva", null: false
    t.integer "valor_total", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.integer "cedula"
    t.string "nombre"
    t.string "apellido"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "contraseña", limit: 40
  end

  create_table "usuarios_clases", id: :bigint, default: nil, force: :cascade do |t|
    t.string "clase", limit: 7, null: false
    t.string "descripcion_clase", limit: 40, null: false
    t.integer "nit", null: false
    t.string "proveedor", limit: 200, null: false
    t.bigint "usuario_id", null: false
  end

end
