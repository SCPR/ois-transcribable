class AddMentionOfWaistbandInReportToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :mention_of_waistband_in_report, :boolean
    
  end

  def self.down
    
      remove_column :transcriptions, :mention_of_waistband_in_report, :boolean
    
  end
end