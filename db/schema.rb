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

ActiveRecord::Schema.define(version: 20160729074646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.string   "uuid",               null: false
    t.string   "full_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "number_invited"
    t.integer  "number_attending"
    t.text     "notes"
    t.text     "wedding_gift"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "salutation_id"
    t.string   "party"
    t.boolean  "sent_save_the_date"
    t.boolean  "sent_invitation"
    t.string   "delivery_format"
    t.integer  "number_who_drink"
  end

  create_table "salutations", force: :cascade do |t|
    t.string   "value"
    t.string   "uuid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "admin",                        default: false
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

end
