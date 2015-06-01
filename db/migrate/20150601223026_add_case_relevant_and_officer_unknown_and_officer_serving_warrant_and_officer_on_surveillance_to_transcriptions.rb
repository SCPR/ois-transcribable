class AddCaseRelevantAndOfficerUnknownAndOfficerServingWarrantAndOfficerOnSurveillanceToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :case_relevant, :boolean
    
      add_column :transcriptions, :officer_unknown, :boolean
    
      add_column :transcriptions, :officer_serving_warrant, :boolean
    
      add_column :transcriptions, :officer_on_surveillance, :boolean
    
  end

  def self.down
    
      remove_column :transcriptions, :case_relevant, :boolean
    
      remove_column :transcriptions, :officer_unknown, :boolean
    
      remove_column :transcriptions, :officer_serving_warrant, :boolean
    
      remove_column :transcriptions, :officer_on_surveillance, :boolean
    
  end
end