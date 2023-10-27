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

ActiveRecord::Schema[7.1].define(version: 2023_10_27_091428) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experts", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "email"
    t.text "address"
    t.bigint "specializations_id", null: false
    t.integer "experience"
    t.boolean "status", default: true
    t.boolean "removed", default: false
    t.text "image"
    t.decimal "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specializations_id"], name: "index_experts_on_specializations_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "experts_id", null: false
    t.string "city"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experts_id"], name: "index_reservations_on_experts_id"
    t.index ["users_id"], name: "index_reservations_on_users_id"
  end

  create_table "specializations", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "experts", "specializations", column: "specializations_id"
  add_foreign_key "reservations", "experts", column: "experts_id"
  add_foreign_key "reservations", "users", column: "users_id"
end
