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

ActiveRecord::Schema.define(version: 20150803172743) do

  create_table "incidents", force: :cascade do |t|
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.string   "url",                                  limit: 255,                   null: false
    t.string   "civilian_name",                        limit: 255
    t.string   "district_attorney_file_number",        limit: 255
    t.string   "district_attorney_county",             limit: 255
    t.string   "district_attorney_prepared_report",    limit: 255
    t.string   "general_location_of_incident",         limit: 255
    t.string   "type_of_incident",                     limit: 255
    t.string   "civillian_weapon",                     limit: 255
    t.string   "officer_shots_fired",                  limit: 255
    t.string   "da_on_scene",                          limit: 255
    t.string   "da_investigator_on_scene",             limit: 255
    t.text     "district_attorney_conclusion",         limit: 65535
    t.text     "narrative_notes",                      limit: 65535
    t.text     "autopsy_notes",                        limit: 65535
    t.text     "conclusion_notes",                     limit: 65535
    t.text     "officer_name_and_badge_number",        limit: 65535
    t.text     "officer_police_agency",                limit: 65535
    t.text     "what_happened",                        limit: 65535
    t.text     "underlying_crime_leading_to_shooting", limit: 65535
    t.text     "how_situation_escalated",              limit: 65535
    t.text     "victim_case_number",                   limit: 65535
    t.text     "officer_special_unit",                 limit: 65535
    t.text     "officer_charges_filed_yes_detail",     limit: 65535
    t.text     "victim_charges_filed",                 limit: 65535
    t.datetime "date_of_incident"
    t.datetime "district_attorney_date_of_letter"
    t.boolean  "verified",                             limit: 1,     default: false, null: false
    t.boolean  "multiple_officers",                    limit: 1
    t.boolean  "car_stop",                             limit: 1
    t.boolean  "believed_civillian_armed",             limit: 1
    t.boolean  "potential_police_video",               limit: 1
    t.boolean  "potential_civillian_video",            limit: 1
    t.boolean  "mention_of_waistband_in_report",       limit: 1
    t.boolean  "fatal",                                limit: 1
    t.boolean  "case_relevant",                        limit: 1
    t.boolean  "victim_arrested",                      limit: 1
    t.boolean  "officer_charges_filed",                limit: 1
    t.boolean  "officer_self_defense",                 limit: 1
    t.boolean  "officer_defense_of_civillians",        limit: 1
    t.boolean  "officer_defense_of_officers",          limit: 1
    t.boolean  "officer_unknown",                      limit: 1
    t.boolean  "officer_serving_warrant",              limit: 1
    t.boolean  "officer_on_surveillance",              limit: 1
    t.boolean  "officer_on_undercover",                limit: 1
    t.boolean  "pursuit_occurred",                     limit: 1
    t.boolean  "victim_gang_member",                   limit: 1
    t.boolean  "victim_ignored_officer_commands",      limit: 1
    t.boolean  "victim_weapon_recovered",              limit: 1
    t.boolean  "victim_initiated_physical_threat",     limit: 1
    t.boolean  "victim_intoxicated",                   limit: 1
    t.boolean  "victim_mentally_ill",                  limit: 1
    t.boolean  "civilian_witnesses",                   limit: 1
    t.boolean  "victim_fired_weapon",                  limit: 1
    t.boolean  "victim_pointed_weapon",                limit: 1
    t.boolean  "officer_injured",                      limit: 1
    t.boolean  "flag_for_followup",                    limit: 1
    t.boolean  "victim_shot_in_back",                  limit: 1
    t.boolean  "applied_lawful_force",                 limit: 1
    t.boolean  "victim_shot_in_head",                  limit: 1
    t.boolean  "victim_unarmed",                       limit: 1
    t.boolean  "officer_couldnt_see_victims_hands",    limit: 1
    t.boolean  "officer_routine_patrol",               limit: 1
    t.integer  "transcribed_count",                    limit: 4,     default: 0
    t.boolean  "officer_responding_to_call",           limit: 1
    t.boolean  "grabbed_officers_weapon",              limit: 1
    t.string   "email",                                limit: 255
    t.string   "civillian_weapon_specific",            limit: 255
    t.string   "officer_shots_fired_specific",         limit: 255
    t.string   "type_of_incident_number",              limit: 255
  end

  create_table "transcriptions", force: :cascade do |t|
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.string   "civilian_name",                        limit: 255
    t.string   "district_attorney_file_number",        limit: 255
    t.string   "district_attorney_county",             limit: 255
    t.string   "district_attorney_prepared_report",    limit: 255
    t.string   "general_location_of_incident",         limit: 255
    t.string   "type_of_incident",                     limit: 255
    t.string   "civillian_weapon",                     limit: 255
    t.string   "officer_shots_fired",                  limit: 255
    t.string   "da_on_scene",                          limit: 255
    t.string   "da_investigator_on_scene",             limit: 255
    t.text     "district_attorney_conclusion",         limit: 65535
    t.text     "narrative_notes",                      limit: 65535
    t.text     "autopsy_notes",                        limit: 65535
    t.text     "conclusion_notes",                     limit: 65535
    t.text     "officer_name_and_badge_number",        limit: 65535
    t.text     "officer_police_agency",                limit: 65535
    t.text     "what_happened",                        limit: 65535
    t.text     "underlying_crime_leading_to_shooting", limit: 65535
    t.text     "how_situation_escalated",              limit: 65535
    t.text     "victim_case_number",                   limit: 65535
    t.text     "officer_special_unit",                 limit: 65535
    t.text     "officer_charges_filed_yes_detail",     limit: 65535
    t.text     "victim_charges_filed",                 limit: 65535
    t.datetime "date_of_incident"
    t.datetime "district_attorney_date_of_letter"
    t.boolean  "verified",                             limit: 1,     default: false, null: false
    t.boolean  "multiple_officers",                    limit: 1
    t.boolean  "car_stop",                             limit: 1
    t.boolean  "believed_civillian_armed",             limit: 1
    t.boolean  "potential_police_video",               limit: 1
    t.boolean  "potential_civillian_video",            limit: 1
    t.boolean  "mention_of_waistband_in_report",       limit: 1
    t.boolean  "fatal",                                limit: 1
    t.boolean  "case_relevant",                        limit: 1
    t.boolean  "victim_arrested",                      limit: 1
    t.boolean  "officer_charges_filed",                limit: 1
    t.boolean  "officer_self_defense",                 limit: 1
    t.boolean  "officer_defense_of_civillians",        limit: 1
    t.boolean  "officer_defense_of_officers",          limit: 1
    t.boolean  "officer_unknown",                      limit: 1
    t.boolean  "officer_serving_warrant",              limit: 1
    t.boolean  "officer_on_surveillance",              limit: 1
    t.boolean  "officer_on_undercover",                limit: 1
    t.boolean  "pursuit_occurred",                     limit: 1
    t.boolean  "victim_gang_member",                   limit: 1
    t.boolean  "victim_ignored_officer_commands",      limit: 1
    t.boolean  "victim_weapon_recovered",              limit: 1
    t.boolean  "victim_initiated_physical_threat",     limit: 1
    t.boolean  "victim_intoxicated",                   limit: 1
    t.boolean  "victim_mentally_ill",                  limit: 1
    t.boolean  "civilian_witnesses",                   limit: 1
    t.boolean  "victim_fired_weapon",                  limit: 1
    t.boolean  "victim_pointed_weapon",                limit: 1
    t.boolean  "officer_injured",                      limit: 1
    t.boolean  "flag_for_followup",                    limit: 1
    t.integer  "incident_id",                          limit: 4
    t.string   "user_id",                              limit: 255
    t.boolean  "victim_shot_in_back",                  limit: 1
    t.boolean  "applied_lawful_force",                 limit: 1
    t.string   "email",                                limit: 255
    t.boolean  "victim_shot_in_head",                  limit: 1
    t.boolean  "victim_unarmed",                       limit: 1
    t.boolean  "officer_couldnt_see_victims_hands",    limit: 1
    t.boolean  "officer_routine_patrol",               limit: 1
    t.boolean  "officer_responding_to_call",           limit: 1
    t.boolean  "grabbed_officers_weapon",              limit: 1
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
