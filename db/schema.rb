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

ActiveRecord::Schema.define(version: 20200609093318) do

  create_table "booking_details", force: :cascade do |t|
    t.integer  "booking_id"
    t.integer  "seat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_details_on_booking_id"
    t.index ["seat_id"], name: "index_booking_details_on_seat_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "booking_date"
    t.integer  "user_id"
    t.integer  "schedule_id"
    t.integer  "promotion_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "payment_type"
    t.text     "notification_params"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "purchased_at"
    t.index ["promotion_id"], name: "index_bookings_on_promotion_id"
    t.index ["schedule_id"], name: "index_bookings_on_schedule_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["movie_id"], name: "index_comments_on_movie_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "name"
    t.string   "info"
    t.string   "description"
    t.integer  "time"
    t.string   "picture"
    t.string   "trailer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "status"
  end

  create_table "promotions", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "number_of_seat"
    t.integer  "theater_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["theater_id"], name: "index_rooms_on_theater_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "start_at"
    t.string   "end_at"
    t.integer  "movie_id"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_schedules_on_movie_id"
    t.index ["room_id"], name: "index_schedules_on_room_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string   "seat_type"
    t.boolean  "is_empty"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_seats_on_room_id"
  end

  create_table "theaters", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "phone"
    t.string   "gender"
    t.datetime "birthday"
    t.boolean  "is_admin",               default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.datetime "deleted_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
