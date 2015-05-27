class AddMultipleOfficersToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :multiple_officers, :boolean
    
  end

  def self.down
    
      remove_column :transcriptions, :multiple_officers, :boolean
    
  end
end