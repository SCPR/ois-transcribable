# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150601180949) do

  create_table "incidents", force: :cascade do |t|
    t.string   "url"
    t.boolean  "verified",                             default: false, null: false
    t.string   "civilian_name"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "district_attorney_file_number",        default: "",    null: false
    t.string   "district_attorney_county",             default: "",    null: false
    t.date     "district_attorney_date_of_letter",                     null: false
    t.text     "district_attorney_conclusion",         default: "",    null: false
    t.string   "district_attorney_prepared_report",    default: "",    null: false
    t.text     "narrative_notes"
    t.text     "autopsy_notes"
    t.text     "conclusion_notes"
    t.boolean  "multiple_officers",                    default: false, null: false
    t.text     "officer_name_and_badge_number"
    t.text     "officer_police_agency"
    t.datetime "date_of_incident"
    t.text     "what_happened"
    t.string   "general_location_of_incident"
    t.string   "type_of_incident"
    t.text     "underlying_crime_leading_to_shooting"
    t.text     "how_situation_escalated"
    t.string   "civillian_weapon"
    t.boolean  "car_stop",                             default: false, null: false
    t.boolean  "chase_or_pursuit",                     default: false, null: false
    t.boolean  "civillian_armed",                      default: false, null: false
    t.boolean  "potential_police_video",               default: false, null: false
    t.boolean  "potential_civillian_video",            default: false, null: false
    t.boolean  "mention_of_waistband_in_report",       default: false, null: false
    t.boolean  "fatal",                                default: false, null: false
  end

  create_table "transcriptions", force: :cascade do |t|
    t.string   "civilian_name"
    t.integer  "incident_id"
    t.string   "user_id"
    t.string   "district_attorney_file_number"
    t.string   "district_attorney_county"
    t.date     "district_attorney_date_of_letter"
    t.text     "narrative_notes"
    t.text     "autopsy_notes"
    t.text     "conclusion_notes"
    t.boolean  "multiple_officers"
    t.datetime "date_of_incident"
    t.string   "general_location_of_incident"
    t.string   "type_of_incident"
    t.text     "underlying_crime_leading_to_shooting"
    t.text     "how_situation_escalated"
    t.string   "civillian_weapon"
    t.boolean  "car_stop"
    t.boolean  "chase_or_pursuit"
    t.boolean  "civillian_armed"
    t.boolean  "potential_police_video"
    t.boolean  "potential_civillian_video"
    t.text     "district_attorney_conclusion"
    t.string   "district_attorney_prepared_report"
    t.text     "officer_name_and_badge_number"
    t.text     "officer_police_agency"
    t.text     "what_happened"
    t.boolean  "mention_of_waistband_in_report"
    t.boolean  "fatal"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
