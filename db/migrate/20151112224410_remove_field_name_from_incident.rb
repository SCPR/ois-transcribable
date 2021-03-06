class RemoveFieldNameFromIncident < ActiveRecord::Migration
  def change
    remove_column :incidents, :person_name
    remove_column :incidents, :person_weapon
    remove_column :incidents, :person_case_number
    remove_column :incidents, :person_charges_filed
    remove_column :incidents, :mention_of_waistband_in_report
    remove_column :incidents, :person_arrested
    remove_column :incidents, :pursuit_occurred
    remove_column :incidents, :person_gang_member
    remove_column :incidents, :person_ignored_officer_commands
    remove_column :incidents, :person_weapon_recovered
    remove_column :incidents, :person_initiated_physical_threat
    remove_column :incidents, :person_intoxicated
    remove_column :incidents, :person_mentally_ill
    remove_column :incidents, :person_fired_weapon
    remove_column :incidents, :person_pointed_weapon
    remove_column :incidents, :person_shot_in_back
    remove_column :incidents, :person_shot_in_head
    remove_column :incidents, :person_unarmed
    remove_column :incidents, :officer_couldnt_see_persons_hands
    remove_column :incidents, :grabbed_officers_weapon
    remove_column :incidents, :person_weapon_specific
    remove_column :incidents, :officer_unknown
    remove_column :incidents, :applied_lawful_force
    remove_column :incidents, :believed_person_armed
    remove_column :incidents, :coroner_case_number
    remove_column :incidents, :in_custody_record_key_number
    remove_column :incidents, :district_attorney_conclusion
    rename_column :incidents, :url, :incident_url
    change_column :incidents, :officer_special_unit, :string
  end
end
