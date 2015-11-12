class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|

        t.timestamps null: false

        t.string :person_name, :district_attorney_file_number, :incident_url, null:false

        t.string :person_weapon, :person_weapon_specific, :reason_for_shooting, :person_place_of_death, :person_first_name, :person_last_name, :person_ethnicity, :person_gender, :person_manner, :person_cause_a, :person_cause_b, :person_cause_c, :person_cause_d, :person_other_significant_causes, :person_investigator, :person_dme, :person_toxicology_status, :person_media_reports_link, :person_case_status, :person_body_status, :person_age, :in_custody_record_key_number, :coroner_district_attorney_file_number, :case_number, :year_of_incident, :coroner_police_agency, :officer_police_agency, null:true

        t.text :drugs, :person_case_number, :person_charges_filed, :notes, null:true

        t.boolean :case_relevant, :person_intoxicated, :marijuana_alone, :case_doubled_up, :person_shot, :fatal, :nonfatal_calc, :armed_with_firearm_calc, :armed_with_other_calc, :vehicle_as_weapon, :mention_of_waistband_in_report, :person_arrested, :pursuit_occurred, :person_gang_member, :person_ignored_officer_commands, :person_weapon_recovered, :person_initiated_physical_threat, :person_mentally_ill, :person_fired_weapon, :person_pointed_weapon, :person_shot_in_back, :person_shot_in_head, :person_unarmed, :person_armed_calc, :officer_couldnt_see_persons_hands, :grabbed_officers_weapon, :law_enforcement_related, :officer_involved, :in_custody, :male, :female, null:true

        t.datetime :date_of_incident, :person_date_of_birth, :person_date_of_death, null: true

    end
  end
end
