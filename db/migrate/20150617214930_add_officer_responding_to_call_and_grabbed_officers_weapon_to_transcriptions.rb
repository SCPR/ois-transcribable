class AddOfficerRespondingToCallAndGrabbedOfficersWeaponToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :officer_responding_to_call, :boolean
    
      add_column :transcriptions, :grabbed_officers_weapon, :boolean
    
  end

  def self.down
    
      remove_column :transcriptions, :officer_responding_to_call, :boolean
    
      remove_column :transcriptions, :grabbed_officers_weapon, :boolean
    
  end
end