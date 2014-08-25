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

ActiveRecord::Schema.define(version: 20140813234824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credit_cards", force: true do |t|
    t.integer  "customer_id"
    t.string   "number"
    t.string   "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_cards", ["customer_id"], name: "index_credit_cards_on_customer_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zip_code"
    t.string   "state"
  end

  create_table "line_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "customer_id"
    t.datetime "placed_at"
    t.decimal  "total_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shipping_address_id"
    t.integer  "credit_card_id"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.text     "description"
  end

  create_table "shipping_addresses", force: true do |t|
    t.integer  "customer_id"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shipping_addresses", ["customer_id"], name: "index_shipping_addresses_on_customer_id", using: :btree

  create_table "subscriptions", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
