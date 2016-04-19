class RenameTranscriptionFields < ActiveRecord::Migration
  def change
    rename_column :transcriptions, :da_on_scene, :district_attorney_on_scene
    rename_column :transcriptions, :da_investigator_on_scene, :district_attorney_investigator_on_scene
    rename_column :transcriptions, :case_relevant, :on_duty_shooting_case
    rename_column :transcriptions, :fatal, :person_killed
    rename_column :transcriptions, :person_case_number, :person_criminal_case_file_number
    rename_column :transcriptions, :person_intoxicated, :person_signs_of_impairment
    rename_column :transcriptions, :person_mentally_ill, :person_signs_of_mental_illness
    rename_column :transcriptions, :mention_of_waistband_in_report, :person_reached_for_waistband
    rename_column :transcriptions, :pursuit_occurred, :person_fled_by_foot_or_vehicle
    rename_column :transcriptions, :person_gang_member, :person_signs_of_gang_affiliation
    rename_column :transcriptions, :person_initiated_physical_threat, :person_threatened_officer_with_weapon
    rename_column :transcriptions, :person_fired_weapon, :person_fired_gun_at_officer
    rename_column :transcriptions, :person_pointed_weapon, :person_pointed_gun_at_officer
    rename_column :transcriptions, :officer_couldnt_see_persons_hands, :person_hid_hands_from_officer
    rename_column :transcriptions, :grabbed_officers_weapon, :person_grabbed_for_officers_weapon_holster
  end
end
