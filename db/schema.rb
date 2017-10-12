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

ActiveRecord::Schema.define(version: 20171010101541) do

  create_table "bookings", force: :cascade do |t|
    t.integer "cleaner_id"
    t.integer "client_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cleaner_id"], name: "index_bookings_on_cleaner_id"
    t.index ["client_id"], name: "index_bookings_on_client_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_cleaners", force: :cascade do |t|
    t.integer "city_id"
    t.integer "cleaner_id"
    t.index ["city_id", nil], name: "index_cities_cleaners_on_city_id_and_cleanr_id", unique: true
    t.index ["city_id"], name: "index_cities_cleaners_on_city_id"
    t.index ["cleaner_id"], name: "index_cities_cleaners_on_cleaner_id"
  end

  create_table "cleaners", force: :cascade do |t|
    t.string "fname", default: "", null: false
    t.string "lname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "fname", default: "", null: false
    t.string "lname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
