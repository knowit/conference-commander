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

ActiveRecord::Schema.define(version: 20170201171038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.integer  "number_of_beds"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "event_id",       null: false
  end

  create_table "events", force: :cascade do |t|
    t.text     "name",        null: false
    t.text     "description", null: false
    t.datetime "starting_at", null: false
    t.datetime "ending_at",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name",                 null: false
    t.string   "address"
    t.string   "country"
    t.float    "lat"
    t.float    "lon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "participations", force: :cascade do |t|
    t.boolean  "single_room",             default: false
    t.integer  "user_id",                                 null: false
    t.integer  "event_id",                                null: false
    t.integer  "accommodation_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.text     "request_for_single_room"
    t.index ["accommodation_id"], name: "index_participations_on_accommodation_id", using: :btree
    t.index ["event_id"], name: "index_participations_on_event_id", using: :btree
    t.index ["user_id", "event_id"], name: "index_participations_on_user_id_and_event_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_participations_on_user_id", using: :btree
  end

  create_table "participations_users", id: false, force: :cascade do |t|
    t.integer "participation_id", null: false
    t.integer "user_id",          null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.text     "title",       null: false
    t.text     "description", null: false
    t.integer  "duration",    null: false
    t.integer  "user_id",     null: false
    t.integer  "event_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id"], name: "index_proposals_on_event_id", using: :btree
    t.index ["user_id"], name: "index_proposals_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.text     "name",                   null: false
    t.text     "email",                  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "role",       default: 3, null: false
    t.integer  "gender",     default: 0, null: false
    t.text     "allergies"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "accommodations", "events"
  add_foreign_key "participations", "accommodations"
  add_foreign_key "participations", "events"
  add_foreign_key "participations", "users"
  add_foreign_key "proposals", "events"
  add_foreign_key "proposals", "users"
end
