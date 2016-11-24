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

ActiveRecord::Schema.define(version: 20161124081752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listing_images", force: :cascade do |t|
    t.integer  "listing_id"
    t.string   "img_url",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "listing_images", ["listing_id"], name: "index_listing_images_on_listing_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "room_type",                    null: false
    t.string   "house_type",                   null: false
    t.string   "price_per_night"
    t.integer  "beds_number"
    t.integer  "bathrooms_number"
    t.integer  "guest_no"
    t.time     "check_in_time"
    t.time     "check_out_time"
    t.string   "country"
    t.string   "state"
    t.string   "zip_code"
    t.string   "address"
    t.boolean  "is_available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "smoker",           default: 0
    t.integer  "wifi",             default: 0
    t.integer  "pool",             default: 0
    t.integer  "tv",               default: 0
    t.integer  "Kitchen",          default: 0
    t.integer  "air_con",          default: 0
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "email",                                      null: false
    t.string   "encrypted_password", limit: 128,             null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "birthday"
    t.string   "gender"
    t.string   "phone_number"
    t.string   "state"
    t.string   "country"
    t.string   "zip_code"
    t.integer  "is_admin",                       default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "listing_images", "listings"
  add_foreign_key "listings", "users"
end
