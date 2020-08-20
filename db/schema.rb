# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_20_095304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.bigint "products_id", null: false
    t.bigint "carts_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carts_id"], name: "index_cart_items_on_carts_id"
    t.index ["products_id"], name: "index_cart_items_on_products_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.string "products_references"
    t.string "orders_references"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "carts_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carts_id"], name: "index_orders_on_carts_id"
    t.index ["users_id"], name: "index_orders_on_users_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.bigint "products_id", null: false
    t.bigint "categories_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categories_id"], name: "index_product_categories_on_categories_id"
    t.index ["products_id"], name: "index_product_categories_on_products_id"
  end

  create_table "product_prices", force: :cascade do |t|
    t.bigint "products_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["products_id"], name: "index_product_prices_on_products_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "products_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["products_id"], name: "index_stocks_on_products_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cart_items", "carts", column: "carts_id"
  add_foreign_key "cart_items", "products", column: "products_id"
  add_foreign_key "carts", "users"
  add_foreign_key "orders", "carts", column: "carts_id"
  add_foreign_key "orders", "users", column: "users_id"
  add_foreign_key "product_categories", "categories", column: "categories_id"
  add_foreign_key "product_categories", "products", column: "products_id"
  add_foreign_key "product_prices", "products", column: "products_id"
  add_foreign_key "stocks", "products", column: "products_id"
end
