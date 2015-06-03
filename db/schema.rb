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

ActiveRecord::Schema.define(version: 20150601201225) do

  create_table "incidents", force: :cascade do |t|
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "url"
    t.string   "civilian_name"
    t.string   "district_attorney_file_number"
    t.string   "district_attorney_county"
    t.string   "district_attorney_prepared_report"
    t.string   "general_location_of_incident"
    t.string   "type_of_incident"
    t.string   "civillian_weapon"
    t.string   "officer_shots_fired"
    t.string   "da_on_scene"
    t.string   "da_investigator_on_scene"
    t.text     "district_attorney_conclusion"
    t.text     "narrative_notes"
    t.text     "autopsy_notes"
    t.text     "conclusion_notes"
    t.text     "officer_name_and_badge_number"
    t.text     "officer_police_agency"
    t.text     "what_happened"
    t.text     "underlying_crime_leading_to_shooting"
    t.text     "how_situation_escalated"
    t.text     "victim_case_number"
    t.text     "officer_special_unit"
    t.text     "officer_charges_filed_yes_detail"
    t.text     "victim_charges_filed"
    t.datetime "date_of_incident"
    t.datetime "district_attorney_date_of_letter"
    t.boolean  "verified",                             default: false, null: false
    t.boolean  "multiple_officers"
    t.boolean  "car_stop"
    t.boolean  "civillian_armed"
    t.boolean  "potential_police_video"
    t.boolean  "potential_civillian_video"
    t.boolean  "mention_of_waistband_in_report"
    t.boolean  "fatal"
    t.boolean  "case_relevant"
    t.boolean  "victim_arrested"
    t.boolean  "officer_charges_filed"
    t.boolean  "officer_self_defense"
    t.boolean  "officer_defense_of_civillians"
    t.boolean  "officer_defense_of_officers"
    t.boolean  "officer_unknown"
    t.boolean  "officer_serving_warrant"
    t.boolean  "officer_on_surveillance"
    t.boolean  "officer_on_undercover"
    t.boolean  "pursuit_occurred"
    t.boolean  "victim_gang_member"
    t.boolean  "victim_ignored_officer_commands"
    t.boolean  "victim_weapon_recovered"
    t.boolean  "victim_initiated_physical_threat"
    t.boolean  "victim_intoxicated"
    t.boolean  "victim_mentally_ill"
    t.boolean  "civilian_witnesses"
    t.boolean  "victim_fired_weapon"
    t.boolean  "victim_pointed_weapon"
    t.boolean  "officer_injured"
    t.boolean  "flag_for_followup"
  end

  create_table "transcriptions", force: :cascade do |t|
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "civilian_name"
    t.string   "district_attorney_file_number"
    t.string   "district_attorney_county"
    t.string   "district_attorney_prepared_report"
    t.string   "general_location_of_incident"
    t.string   "type_of_incident"
    t.string   "civillian_weapon"
    t.string   "officer_shots_fired"
    t.string   "da_on_scene"
    t.string   "da_investigator_on_scene"
    t.text     "district_attorney_conclusion"
    t.text     "narrative_notes"
    t.text     "autopsy_notes"
    t.text     "conclusion_notes"
    t.text     "officer_name_and_badge_number"
    t.text     "officer_police_agency"
    t.text     "what_happened"
    t.text     "underlying_crime_leading_to_shooting"
    t.text     "how_situation_escalated"
    t.text     "victim_case_number"
    t.text     "officer_special_unit"
    t.text     "officer_charges_filed_yes_detail"
    t.text     "victim_charges_filed"
    t.datetime "date_of_incident"
    t.datetime "district_attorney_date_of_letter"
    t.boolean  "verified",                             default: false, null: false
    t.boolean  "multiple_officers"
    t.boolean  "car_stop"
    t.boolean  "civillian_armed"
    t.boolean  "potential_police_video"
    t.boolean  "potential_civillian_video"
    t.boolean  "mention_of_waistband_in_report"
    t.boolean  "fatal"
    t.boolean  "case_relevant"
    t.boolean  "victim_arrested"
    t.boolean  "officer_charges_filed"
    t.boolean  "officer_self_defense"
    t.boolean  "officer_defense_of_civillians"
    t.boolean  "officer_defense_of_officers"
    t.boolean  "officer_unknown"
    t.boolean  "officer_serving_warrant"
    t.boolean  "officer_on_surveillance"
    t.boolean  "officer_on_undercover"
    t.boolean  "pursuit_occurred"
    t.boolean  "victim_gang_member"
    t.boolean  "victim_ignored_officer_commands"
    t.boolean  "victim_weapon_recovered"
    t.boolean  "victim_initiated_physical_threat"
    t.boolean  "victim_intoxicated"
    t.boolean  "victim_mentally_ill"
    t.boolean  "civilian_witnesses"
    t.boolean  "victim_fired_weapon"
    t.boolean  "victim_pointed_weapon"
    t.boolean  "officer_injured"
    t.boolean  "flag_for_followup"
    t.integer  "incident_id"
    t.string   "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
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
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
