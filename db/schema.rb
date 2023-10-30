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

ActiveRecord::Schema[7.1].define(version: 2023_10_30_075500) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experts", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "email"
    t.text "address"
    t.integer "experience"
    t.boolean "status", default: true
    t.boolean "removed", default: false
    t.decimal "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "specialization_id", null: false
    t.index ["specialization_id"], name: "index_experts_on_specialization_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "experts_id", null: false
    t.bigint "users_id", null: false
    t.text "city"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experts_id"], name: "index_reservations_on_experts_id"
    t.index ["users_id"], name: "index_reservations_on_users_id"
  end

  create_table "specializations", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "name"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "experts", "specializations"
  add_foreign_key "reservations", "experts", column: "experts_id"
  add_foreign_key "reservations", "users", column: "users_id"
end
