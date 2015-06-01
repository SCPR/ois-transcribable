class AddFatalToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :fatal, :boolean
    
  end

  def self.down
    
      remove_column :transcriptions, :fatal, :boolean
    
  end
end