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

ActiveRecord::Schema.define(version: 2021_01_26_073013) do

  create_table "airs", force: :cascade do |t|
    t.date "departure_day"
    t.string "departure_time"
    t.string "arrival_time"
    t.string "departure_place"
    t.string "arrival_place"
    t.integer "flight_number"
    t.string "airline"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "travel_id"
  end

  create_table "trains", force: :cascade do |t|
    t.date "departure_day"
    t.string "departure_time"
    t.string "arrival_time"
    t.string "departure_place"
    t.string "arrival_place"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "travel_id"
  end

  create_table "travelitems", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "travel_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "travels", force: :cascade do |t|
    t.string "transport"
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
