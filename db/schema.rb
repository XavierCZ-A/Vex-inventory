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

ActiveRecord::Schema[8.0].define(version: 2025_03_29_160231) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.bigint "organization_id", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["organization_id"], name: "index_products_on_organization_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "warehouse_id", null: false
    t.integer "quantity", null: false
    t.date "entry_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id", null: false
    t.index ["organization_id"], name: "index_stocks_on_organization_id"
    t.index ["product_id"], name: "index_stocks_on_product_id"
    t.index ["warehouse_id"], name: "index_stocks_on_warehouse_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "supplier_name", null: false
    t.string "supplier_phone", null: false
    t.string "supplier_email", null: false
    t.string "supplier_address"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id", null: false
    t.index ["organization_id"], name: "index_suppliers_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "last_name", null: false
    t.bigint "organization_id", null: false
    t.integer "role"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "capacity"
    t.bigint "organization_id", null: false
    t.index ["organization_id"], name: "index_warehouses_on_organization_id"
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "organizations"
  add_foreign_key "sessions", "users"
  add_foreign_key "stocks", "organizations"
  add_foreign_key "stocks", "products"
  add_foreign_key "stocks", "warehouses"
  add_foreign_key "suppliers", "organizations"
  add_foreign_key "users", "organizations"
  add_foreign_key "warehouses", "organizations"
end
