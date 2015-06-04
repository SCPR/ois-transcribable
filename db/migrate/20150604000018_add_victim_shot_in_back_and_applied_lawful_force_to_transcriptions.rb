class AddVictimShotInBackAndAppliedLawfulForceToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :victim_shot_in_back, :boolean
    
      add_column :transcriptions, :applied_lawful_force, :boolean
    
  end

  def self.down
    
      remove_column :transcriptions, :victim_shot_in_back, :boolean
    
      remove_column :transcriptions, :applied_lawful_force, :boolean
    
  end
end