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

ActiveRecord::Schema.define(version: 20160805182840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alcoholic_beverages", force: :cascade do |t|
    t.string   "uuid"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drinkings", force: :cascade do |t|
    t.string   "uuid"
    t.integer  "guest_id"
    t.integer  "alcoholic_beverage_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string   "uuid"
    t.string   "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "party_id"
    t.integer  "account_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "parties", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "uuid"
    t.string   "name"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "save_the_date_sent", default: false
    t.boolean  "invitation_sent",    default: false
  end

  add_index "parties", ["account_id"], name: "index_parties_on_account_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "account_id"
    t.boolean  "account_owner",                default: false
    t.string   "email"
    t.string   "uuid",                                         null: false
    t.string   "password_digest"
    t.string   "authentication_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_token_sent_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.string   "full_name"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id", using: :btree

end
