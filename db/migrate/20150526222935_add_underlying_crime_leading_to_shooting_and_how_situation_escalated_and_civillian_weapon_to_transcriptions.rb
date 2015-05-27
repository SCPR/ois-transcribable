class AddUnderlyingCrimeLeadingToShootingAndHowSituationEscalatedAndCivillianWeaponToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :underlying_crime_leading_to_shooting, :text
    
      add_column :transcriptions, :how_situation_escalated, :text
    
      add_column :transcriptions, :civillian_weapon, :string
    
  end

  def self.down
    
      remove_column :transcriptions, :underlying_crime_leading_to_shooting, :text
    
      remove_column :transcriptions, :how_situation_escalated, :text
    
      remove_column :transcriptions, :civillian_weapon, :string
    
  end
end