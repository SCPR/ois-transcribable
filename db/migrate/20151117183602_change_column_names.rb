class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_column :incidents, :da_on_scene, :district_attorney_on_scene
    rename_column :incidents, :da_investigator_on_scene, :district_attorney_investigator_on_scene
    rename_column :incidents, :case_relevant, :on_duty_shooting_case
    rename_column :incidents, :fatal, :person_killed
    rename_column :people, :person_case_number, :person_criminal_case_file_number
    rename_column :people, :case_number, :coroner_case_number
    rename_column :people, :fatal, :person_killed
    rename_column :people, :nonfatal_calc, :person_wounded
    rename_column :people, :person_intoxicated, :person_signs_of_impairment
    rename_column :people, :person_mentally_ill, :person_signs_of_mental_illness
    rename_column :people, :armed_with_firearm_calc, :armed_with_firearm
    rename_column :people, :armed_with_other_calc, :armed_with_weapon
    rename_column :people, :vehicle_as_weapon, :used_vehicle_as_weapon
    rename_column :people, :mention_of_waistband_in_report, :person_reached_for_waistband
    rename_column :people, :pursuit_occurred, :person_fled_by_foot_or_vehicle
    rename_column :people, :person_armed_calc, :person_armed
    rename_column :people, :case_relevant, :on_duty_shooting_case
    rename_column :people, :person_gang_member, :person_signs_of_gang_affiliation
    rename_column :people, :person_initiated_physical_threat, :person_threatened_officer_with_weapon
    rename_column :people, :person_fired_weapon, :person_fired_gun_at_officer
    rename_column :people, :person_pointed_weapon, :person_pointed_gun_at_officer
    rename_column :people, :officer_couldnt_see_persons_hands, :person_hid_hands_from_officer
    rename_column :people, :grabbed_officers_weapon, :person_grabbed_for_officers_weapon_holster
    remove_column :people, :coroner_district_attorney_file_number
  end
end
