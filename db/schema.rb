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

ActiveRecord::Schema.define(version: 20140703103828) do

  create_table "properties", force: true do |t|
    t.string   "title"
    t.text     "short_desc"
    t.string   "price"
    t.integer  "size"
    t.string   "property_for"
    t.string   "landmark"
    t.string   "location"
    t.string   "property_in"
    t.string   "total_no_of_floors"
    t.integer  "bed_rooms"
    t.integer  "total_rooms"
    t.integer  "bathrooms"
    t.string   "parking"
    t.string   "flooring"
    t.string   "furnishing"
    t.string   "open_for_inspection"
    t.string   "address"
    t.string   "city"
    t.string   "district"
    t.string   "zipcode"
    t.date     "available_from"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "posting_local"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "property_translations", force: true do |t|
    t.integer  "property_id",         null: false
    t.string   "locale",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "short_desc"
    t.string   "price"
    t.string   "property_for"
    t.string   "landmark"
    t.string   "location"
    t.string   "property_in"
    t.string   "parking"
    t.string   "flooring"
    t.string   "furnishing"
    t.string   "open_for_inspection"
    t.string   "address"
    t.string   "city"
    t.string   "district"
    t.string   "zipcode"
    t.string   "available_from"
  end

  add_index "property_translations", ["locale"], name: "index_property_translations_on_locale"
  add_index "property_translations", ["property_id"], name: "index_property_translations_on_property_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
