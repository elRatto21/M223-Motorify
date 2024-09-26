# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_26_070911) do
  create_table "bikes", force: :cascade do |t|
    t.string "manufacturer"
    t.string "model"
    t.integer "horsepower"
    t.integer "weight"
    t.integer "year"
    t.integer "mileage"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_bikes_on_team_id"
  end

  create_table "jointable_services_parts", force: :cascade do |t|
    t.string "service"
    t.string "part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "price"
    t.date "date"
    t.integer "bike_id"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_parts_on_bike_id"
    t.index ["team_id"], name: "index_parts_on_team_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "bike_id", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.index ["bike_id"], name: "index_services_on_bike_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.string "password_confirmation"
    t.string "role"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "bikes", "teams"
  add_foreign_key "parts", "bikes"
  add_foreign_key "parts", "teams"
  add_foreign_key "services", "bikes"
  add_foreign_key "services", "teams"
  add_foreign_key "users", "teams"
end
