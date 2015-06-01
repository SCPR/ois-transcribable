class AddVictimArrestedAndVictimCaseNumberAndOfficerSpecialUnitAndOfficerChargesFiledAndOfficerChargesFiledYesDetailToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :victim_arrested, :boolean
    
      add_column :transcriptions, :victim_case_number, :text
    
      add_column :transcriptions, :officer_special_unit, :text
    
      add_column :transcriptions, :officer_charges_filed, :boolean
    
      add_column :transcriptions, :officer_charges_filed_yes_detail, :text
    
  end

  def self.down
    
      remove_column :transcriptions, :victim_arrested, :boolean
    
      remove_column :transcriptions, :victim_case_number, :text
    
      remove_column :transcriptions, :officer_special_unit, :text
    
      remove_column :transcriptions, :officer_charges_filed, :boolean
    
      remove_column :transcriptions, :officer_charges_filed_yes_detail, :text
    
  end
end