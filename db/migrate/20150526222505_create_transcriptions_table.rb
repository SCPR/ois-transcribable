class CreateTranscriptionsTable < ActiveRecord::Migration
  def self.up
    create_table :transcriptions do |t|

        t.timestamps null: false

        t.string :civilian_name, :district_attorney_file_number, :district_attorney_county, :district_attorney_prepared_report, :general_location_of_incident, :type_of_incident, :civillian_weapon, :officer_shots_fired, :da_on_scene, :da_investigator_on_scene, null:true

        t.text :district_attorney_conclusion, :narrative_notes, :autopsy_notes, :conclusion_notes, :officer_name_and_badge_number, :officer_police_agency, :what_happened, :underlying_crime_leading_to_shooting, :how_situation_escalated, :victim_case_number, :officer_special_unit, :officer_charges_filed_yes_detail, :victim_charges_filed, null:true

        t.datetime :date_of_incident, :district_attorney_date_of_letter, null: true

        t.boolean :verified, null:false, default:false

        t.boolean :multiple_officers, :car_stop, :civillian_armed, :potential_police_video, :potential_civillian_video, :mention_of_waistband_in_report, :fatal, :case_relevant, :victim_arrested, :officer_charges_filed, :officer_self_defense, :officer_defense_of_civillians, :officer_defense_of_officers, :officer_unknown, :officer_serving_warrant, :officer_on_surveillance, :officer_on_undercover, :pursuit_occurred, :victim_gang_member, :victim_ignored_officer_commands, :victim_weapon_recovered, :victim_initiated_physical_threat, :victim_intoxicated, :victim_mentally_ill, :civilian_witnesses, :victim_fired_weapon, :victim_pointed_weapon, :officer_injured, :flag_for_followup, null:true

      t.integer :incident_id

      t.string :user_id # by default, this will be a UUID stored by cookie

    end
  end

  def self.down
    drop_table :transcriptions
  end
end
