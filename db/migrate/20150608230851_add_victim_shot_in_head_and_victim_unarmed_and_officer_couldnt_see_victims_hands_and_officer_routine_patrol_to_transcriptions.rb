class AddVictimShotInHeadAndVictimUnarmedAndOfficerCouldntSeeVictimsHandsAndOfficerRoutinePatrolToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :victim_shot_in_head, :boolean
    
      add_column :transcriptions, :victim_unarmed, :boolean
    
      add_column :transcriptions, :officer_couldnt_see_victims_hands, :boolean
    
      add_column :transcriptions, :officer_routine_patrol, :boolean
    
  end

  def self.down
    
      remove_column :transcriptions, :victim_shot_in_head, :boolean
    
      remove_column :transcriptions, :victim_unarmed, :boolean
    
      remove_column :transcriptions, :officer_couldnt_see_victims_hands, :boolean
    
      remove_column :transcriptions, :officer_routine_patrol, :boolean
    
  end
end