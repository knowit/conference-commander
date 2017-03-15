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

ActiveRecord::Schema.define(version: 20170315154307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", id: :serial, force: :cascade do |t|
    t.integer "number_of_beds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id", null: false
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "description", null: false
    t.datetime "starting_at", null: false
    t.datetime "ending_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flight_reservations", force: :cascade do |t|
    t.datetime "travel_date"
    t.string "flight_number"
    t.bigint "flights_id"
    t.bigint "participations_id", null: false
    t.bigint "events_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["events_id"], name: "index_flight_reservations_on_events_id"
    t.index ["flights_id"], name: "index_flight_reservations_on_flights_id"
    t.index ["participations_id"], name: "index_flight_reservations_on_participations_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "airline", null: false
    t.string "from", null: false
    t.string "destination", null: false
    t.string "flight_number", null: false
    t.integer "direction", null: false
    t.datetime "travel_date", null: false
    t.date "change_reservation_before"
    t.bigint "events_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["events_id"], name: "index_flights_on_events_id"
  end

  create_table "hotels", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "country"
    t.float "lat"
    t.float "lon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.string "imageable_type"
    t.integer "imageable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "participations", id: :serial, force: :cascade do |t|
    t.boolean "single_room", default: false
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.integer "accommodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "request_for_single_room"
    t.index ["accommodation_id"], name: "index_participations_on_accommodation_id"
    t.index ["event_id"], name: "index_participations_on_event_id"
    t.index ["user_id", "event_id"], name: "index_participations_on_user_id_and_event_id", unique: true
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "participations_users", id: false, force: :cascade do |t|
    t.integer "participation_id", null: false
    t.integer "user_id", null: false
  end

  create_table "proposals", id: :serial, force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.integer "duration", null: false
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_proposals_on_event_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "schedules", id: :serial, force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", id: :serial, force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_tracks_on_schedule_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name", null: false
    t.text "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 3, null: false
    t.integer "gender", default: 0, null: false
    t.text "allergies"
    t.string "last_name", default: "X", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "venues", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_venues_on_event_id"
  end

  add_foreign_key "accommodations", "events"
  add_foreign_key "flight_reservations", "events", column: "events_id"
  add_foreign_key "flight_reservations", "flights", column: "flights_id"
  add_foreign_key "flight_reservations", "participations", column: "participations_id"
  add_foreign_key "flights", "events", column: "events_id"
  add_foreign_key "participations", "accommodations"
  add_foreign_key "participations", "events"
  add_foreign_key "participations", "users"
  add_foreign_key "proposals", "events"
  add_foreign_key "proposals", "users"
  add_foreign_key "tracks", "schedules"
  add_foreign_key "venues", "events"
end
