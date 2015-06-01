class AddOfficerOnUndercoverAndPursuitOccurredAndVictimGangMemberAndVictimIgnoredOfficerCommandsAndVictimWeaponRecoveredToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :officer_on_undercover, :boolean
    
      add_column :transcriptions, :pursuit_occurred, :boolean
    
      add_column :transcriptions, :victim_gang_member, :boolean
    
      add_column :transcriptions, :victim_ignored_officer_commands, :boolean
    
      add_column :transcriptions, :victim_weapon_recovered, :boolean
    
  end

  def self.down
    
      remove_column :transcriptions, :officer_on_undercover, :boolean
    
      remove_column :transcriptions, :pursuit_occurred, :boolean
    
      remove_column :transcriptions, :victim_gang_member, :boolean
    
      remove_column :transcriptions, :victim_ignored_officer_commands, :boolean
    
      remove_column :transcriptions, :victim_weapon_recovered, :boolean
    
  end
end