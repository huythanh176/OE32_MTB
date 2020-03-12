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

ActiveRecord::Schema.define(version: 20200309085414) do

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
    t.integer  "payment_id"
    t.integer  "schedule_id"
    t.integer  "promotion_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["payment_id"], name: "index_bookings_on_payment_id"
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

  create_table "payments", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "payment_type"
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
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.string   "gender"
    t.datetime "birthday"
    t.boolean  "is_admin",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
  end

end
