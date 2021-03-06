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

ActiveRecord::Schema.define(version: 20170316222214) do

  create_table "incidents", force: :cascade do |t|
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.string   "incident_url",                            limit: 255,                   null: false
    t.string   "district_attorney_file_number",           limit: 255
    t.string   "district_attorney_county",                limit: 255
    t.string   "district_attorney_prepared_report",       limit: 255
    t.string   "general_location_of_incident",            limit: 255
    t.string   "type_of_incident",                        limit: 255
    t.string   "officer_shots_fired",                     limit: 255
    t.string   "district_attorney_on_scene",              limit: 255
    t.string   "district_attorney_investigator_on_scene", limit: 255
    t.text     "narrative_notes",                         limit: 65535
    t.text     "autopsy_notes",                           limit: 65535
    t.text     "conclusion_notes",                        limit: 65535
    t.text     "officer_name_and_badge_number",           limit: 65535
    t.text     "officer_police_agency",                   limit: 65535
    t.text     "what_happened",                           limit: 65535
    t.text     "underlying_crime_leading_to_shooting",    limit: 65535
    t.text     "how_situation_escalated",                 limit: 65535
    t.string   "officer_special_unit",                    limit: 255
    t.text     "officer_charges_filed_yes_detail",        limit: 65535
    t.datetime "date_of_incident"
    t.datetime "district_attorney_date_of_letter"
    t.boolean  "verified",                                limit: 1,     default: false, null: false
    t.boolean  "multiple_officers",                       limit: 1
    t.boolean  "car_stop",                                limit: 1
    t.boolean  "potential_police_video",                  limit: 1
    t.boolean  "potential_civillian_video",               limit: 1
    t.boolean  "person_killed",                           limit: 1
    t.boolean  "on_duty_shooting_case",                   limit: 1
    t.boolean  "officer_charges_filed",                   limit: 1
    t.boolean  "officer_self_defense",                    limit: 1
    t.boolean  "officer_defense_of_civillians",           limit: 1
    t.boolean  "officer_defense_of_officers",             limit: 1
    t.boolean  "officer_serving_warrant",                 limit: 1
    t.boolean  "officer_on_surveillance",                 limit: 1
    t.boolean  "officer_on_undercover",                   limit: 1
    t.boolean  "civilian_witnesses",                      limit: 1
    t.boolean  "officer_injured",                         limit: 1
    t.boolean  "flag_for_followup",                       limit: 1
    t.boolean  "officer_routine_patrol",                  limit: 1
    t.integer  "transcribed_count",                       limit: 4,     default: 0
    t.boolean  "officer_responding_to_call",              limit: 1
    t.string   "verified_by_email",                       limit: 255
    t.string   "officer_shots_fired_specific",            limit: 255
    t.string   "type_of_incident_number",                 limit: 255
    t.string   "led_to_response_category",                limit: 255
    t.string   "user_email",                              limit: 255
    t.string   "user_id",                                 limit: 255
    t.boolean  "transcribed",                             limit: 1
    t.string   "transcribed_status",                      limit: 255
    t.boolean  "moving_car",                              limit: 1
  end

  create_table "people", force: :cascade do |t|
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "person_name",                                limit: 255,   null: false
    t.string   "district_attorney_file_number",              limit: 255,   null: false
    t.string   "incident_url",                               limit: 255,   null: false
    t.string   "person_weapon",                              limit: 255
    t.string   "person_weapon_specific",                     limit: 255
    t.string   "reason_for_shooting",                        limit: 255
    t.string   "person_place_of_death",                      limit: 255
    t.string   "person_first_name",                          limit: 255
    t.string   "person_last_name",                           limit: 255
    t.string   "person_ethnicity",                           limit: 255
    t.string   "person_gender",                              limit: 255
    t.string   "person_manner",                              limit: 255
    t.string   "person_cause_a",                             limit: 255
    t.string   "person_cause_b",                             limit: 255
    t.string   "person_cause_c",                             limit: 255
    t.string   "person_cause_d",                             limit: 255
    t.string   "person_other_significant_causes",            limit: 255
    t.string   "person_investigator",                        limit: 255
    t.string   "person_dme",                                 limit: 255
    t.string   "person_toxicology_status",                   limit: 255
    t.string   "person_media_reports_link",                  limit: 255
    t.string   "person_case_status",                         limit: 255
    t.string   "person_body_status",                         limit: 255
    t.string   "person_age",                                 limit: 255
    t.string   "in_custody_record_key_number",               limit: 255
    t.string   "coroner_case_number",                        limit: 255
    t.string   "year_of_incident",                           limit: 255
    t.string   "coroner_police_agency",                      limit: 255
    t.text     "drugs",                                      limit: 65535
    t.text     "person_criminal_case_file_number",           limit: 65535
    t.text     "person_charges_filed",                       limit: 65535
    t.text     "notes",                                      limit: 65535
    t.boolean  "person_signs_of_impairment",                 limit: 1
    t.boolean  "marijuana_alone",                            limit: 1
    t.boolean  "case_doubled_up",                            limit: 1
    t.boolean  "person_shot",                                limit: 1
    t.boolean  "person_killed",                              limit: 1
    t.boolean  "person_wounded",                             limit: 1
    t.boolean  "armed_with_firearm",                         limit: 1
    t.boolean  "armed_with_weapon",                          limit: 1
    t.boolean  "used_vehicle_as_weapon",                     limit: 1
    t.boolean  "person_reached_for_waistband",               limit: 1
    t.boolean  "person_arrested",                            limit: 1
    t.boolean  "person_fled_by_foot_or_vehicle",             limit: 1
    t.boolean  "person_signs_of_gang_affiliation",           limit: 1
    t.boolean  "person_ignored_officer_commands",            limit: 1
    t.boolean  "person_weapon_recovered",                    limit: 1
    t.boolean  "person_threatened_officer_with_weapon",      limit: 1
    t.boolean  "person_signs_of_mental_illness",             limit: 1
    t.boolean  "person_fired_gun_at_officer",                limit: 1
    t.boolean  "person_pointed_gun_at_officer",              limit: 1
    t.boolean  "person_shot_in_back",                        limit: 1
    t.boolean  "person_shot_in_head",                        limit: 1
    t.boolean  "person_unarmed",                             limit: 1
    t.boolean  "person_armed",                               limit: 1
    t.boolean  "person_hid_hands_from_officer",              limit: 1
    t.boolean  "person_grabbed_for_officers_weapon_holster", limit: 1
    t.boolean  "law_enforcement_related",                    limit: 1
    t.boolean  "officer_involved",                           limit: 1
    t.boolean  "in_custody",                                 limit: 1
    t.datetime "person_date_of_birth"
    t.datetime "person_date_of_death"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: ""
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",       limit: 4
    t.integer  "invited_by_id",          limit: 4
    t.string   "invited_by_type",        limit: 255
    t.integer  "invitations_count",      limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
