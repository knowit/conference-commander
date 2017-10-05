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

ActiveRecord::Schema.define(version: 20171001164422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", id: :serial, force: :cascade do |t|
    t.integer "number_of_beds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id", null: false
  end

  create_table "activities", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ingress"
    t.integer "price"
    t.integer "max_number_of_participants"
    t.index ["event_id"], name: "index_activities_on_event_id"
  end

  create_table "activities_participations", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "participation_id", null: false
    t.index ["activity_id"], name: "index_activities_participations_on_activity_id"
    t.index ["participation_id"], name: "index_activities_participations_on_participation_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "attachable_type"
    t.bigint "attachable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"
  end

  create_table "data_migrations", id: false, force: :cascade do |t|
    t.string "version", null: false
    t.index ["version"], name: "unique_data_migrations", unique: true
  end

  create_table "event_sessions", id: :serial, force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.integer "duration", null: false
    t.integer "submitter_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "outline"
    t.datetime "start_time"
    t.integer "state", default: 0
    t.bigint "track_id"
    t.integer "language", default: 0
    t.integer "session_type", default: 1, null: false
    t.index ["event_id"], name: "index_event_sessions_on_event_id"
    t.index ["submitter_id"], name: "index_event_sessions_on_submitter_id"
    t.index ["track_id"], name: "index_event_sessions_on_track_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "description", null: false
    t.datetime "starting_at", null: false
    t.datetime "ending_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_type", default: 0, null: false
    t.boolean "is_published", default: false, null: false
  end

  create_table "flight_reservations", force: :cascade do |t|
    t.datetime "travel_date"
    t.string "flight_number"
    t.bigint "flight_id"
    t.bigint "participation_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_flight_reservations_on_event_id"
    t.index ["flight_id"], name: "index_flight_reservations_on_flight_id"
    t.index ["participation_id"], name: "index_flight_reservations_on_participation_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "airline", null: false
    t.string "from", null: false
    t.string "destination", null: false
    t.string "flight_number", null: false
    t.integer "direction", null: false
    t.datetime "travel_date", null: false
    t.date "change_reservation_before"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_flights_on_event_id"
  end

  create_table "hotels", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "event_id"
    t.float "latitude"
    t.float "longitude"
    t.string "description"
    t.index ["event_id"], name: "index_hotels_on_event_id"
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

  create_table "locks", force: :cascade do |t|
    t.string "lockable_type"
    t.bigint "lockable_id"
    t.text "field"
    t.date "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lockable_type", "lockable_id", "field"], name: "index_locks_on_lockable_type_and_lockable_id_and_field"
    t.index ["lockable_type", "lockable_id"], name: "index_locks_on_lockable_type_and_lockable_id"
  end

  create_table "participations", id: :serial, force: :cascade do |t|
    t.boolean "single_room", default: false
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.integer "accommodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "request_for_sharing_room"
    t.boolean "extended_stay"
    t.date "extended_stay_from"
    t.date "extended_stay_to"
    t.index ["accommodation_id"], name: "index_participations_on_accommodation_id"
    t.index ["event_id"], name: "index_participations_on_event_id"
    t.index ["user_id", "event_id"], name: "index_participations_on_user_id_and_event_id", unique: true
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "participations_users", id: false, force: :cascade do |t|
    t.integer "participation_id", null: false
    t.integer "user_id", null: false
  end

  create_table "passports", force: :cascade do |t|
    t.bigint "user_id"
    t.string "encrypted_first_name"
    t.string "encrypted_first_name_iv"
    t.string "encrypted_last_name"
    t.string "encrypted_last_name_iv"
    t.string "encrypted_number"
    t.string "encrypted_number_iv"
    t.string "encrypted_nationality"
    t.string "encrypted_nationality_iv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_issued_at"
    t.string "encrypted_issued_at_iv"
    t.string "encrypted_expires_at"
    t.string "encrypted_expires_at_iv"
    t.index ["user_id"], name: "index_passports_on_user_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tracks", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
    t.integer "venue_id"
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
    t.string "passport_name"
    t.string "passport_number"
    t.date "passport_issued_at"
    t.date "passport_expires_at"
    t.string "passport_nationality"
    t.date "birth_date"
    t.string "encrypted_issued_at"
    t.string "encrypted_issued_at_iv"
    t.string "encrypted_expires_at"
    t.string "encrypted_expires_at_iv"
    t.string "locale", default: "en", null: false
    t.text "about"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "venues", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "capacity"
    t.index ["event_id"], name: "index_venues_on_event_id"
  end

  add_foreign_key "accommodations", "events"
  add_foreign_key "event_sessions", "events"
  add_foreign_key "event_sessions", "users", column: "submitter_id"
  add_foreign_key "flight_reservations", "events"
  add_foreign_key "flight_reservations", "flights"
  add_foreign_key "flight_reservations", "participations"
  add_foreign_key "flights", "events"
  add_foreign_key "participations", "accommodations"
  add_foreign_key "participations", "events"
  add_foreign_key "participations", "users"
  add_foreign_key "passports", "users"
  add_foreign_key "venues", "events"
end
