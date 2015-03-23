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

ActiveRecord::Schema.define(version: 20150323150310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bidder_categories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
  end

  add_index "bidder_categories", ["category_id"], name: "index_bidder_categories_on_category_id", using: :btree
  add_index "bidder_categories", ["user_id"], name: "index_bidder_categories_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_categories", force: :cascade do |t|
    t.integer "order_id"
    t.integer "category_id"
  end

  add_index "order_categories", ["category_id"], name: "index_order_categories_on_category_id", using: :btree
  add_index "order_categories", ["order_id"], name: "index_order_categories_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "item",                                             null: false
    t.integer  "quantity",                           default: 0
    t.decimal  "budget",     precision: 8, scale: 2, default: 0.0
    t.date     "target"
    t.text     "details"
    t.integer  "status",                             default: 0
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.integer  "account_type",           default: 0,     null: false
    t.string   "company_name"
    t.string   "contact_person"
    t.string   "contact_number"
    t.integer  "buyer_type",             default: 0,     null: false
    t.boolean  "disabled",               default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
