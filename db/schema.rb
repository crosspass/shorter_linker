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

ActiveRecord::Schema.define(version: 2021_03_24_032951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "holiday_workday_hwdays", force: :cascade do |t|
    t.date "date"
    t.integer "day_type"
    t.index ["date"], name: "index_holiday_workday_hwdays_on_date"
    t.index ["day_type"], name: "index_holiday_workday_hwdays_on_day_type"
  end

  create_table "linkers", force: :cascade do |t|
    t.string "url"
    t.string "short_path"
    t.string "uid"
    t.integer "user_id"
    t.string "email"
    t.integer "times", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "status", default: false
    t.index ["email"], name: "index_linkers_on_email"
    t.index ["short_path"], name: "index_linkers_on_short_path"
    t.index ["uid"], name: "index_linkers_on_uid"
    t.index ["url", "email"], name: "index_linkers_on_url_and_email"
    t.index ["user_id"], name: "index_linkers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
