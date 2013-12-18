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

ActiveRecord::Schema.define(version: 20131218135540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drinks", force: true do |t|
    t.string   "name",       null: false
    t.text     "definition", null: false
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", force: true do |t|
    t.string   "name",                                 null: false
    t.string   "address",                              null: false
    t.string   "cross",                                null: false
    t.string   "city",                                 null: false
    t.string   "neighborhood",                         null: false
    t.string   "state",                                null: false
    t.integer  "zip",                                  null: false
    t.string   "phone",                                null: false
    t.decimal  "rating",       precision: 2, scale: 1
    t.text     "snippet",                              null: false
    t.string   "rating_url",                           null: false
    t.string   "image",                                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops_users", force: true do |t|
    t.integer  "shop_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
