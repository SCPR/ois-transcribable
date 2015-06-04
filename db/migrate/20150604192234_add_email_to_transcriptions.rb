class AddEmailToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :email, :string
    
  end

  def self.down
    
      remove_column :transcriptions, :email, :string
    
  end
end