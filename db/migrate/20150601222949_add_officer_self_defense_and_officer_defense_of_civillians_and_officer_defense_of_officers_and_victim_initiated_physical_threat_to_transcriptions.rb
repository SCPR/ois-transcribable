class AddOfficerSelfDefenseAndOfficerDefenseOfCivilliansAndOfficerDefenseOfOfficersAndVictimInitiatedPhysicalThreatToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :officer_self_defense, :boolean
    
      add_column :transcriptions, :officer_defense_of_civillians, :boolean
    
      add_column :transcriptions, :officer_defense_of_officers, :boolean
    
      add_column :transcriptions, :victim_initiated_physical_threat, :boolean
    
  end

  def self.down
    
      remove_column :transcriptions, :officer_self_defense, :boolean
    
      remove_column :transcriptions, :officer_defense_of_civillians, :boolean
    
      remove_column :transcriptions, :officer_defense_of_officers, :boolean
    
      remove_column :transcriptions, :victim_initiated_physical_threat, :boolean
    
  end
end