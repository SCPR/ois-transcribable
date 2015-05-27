class AddDateOfIncidentAndGeneralLocationOfIncidentAndTypeOfIncidentToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :date_of_incident, :datetime
    
      add_column :transcriptions, :general_location_of_incident, :string
    
      add_column :transcriptions, :type_of_incident, :string
    
  end

  def self.down
    
      remove_column :transcriptions, :date_of_incident, :datetime
    
      remove_column :transcriptions, :general_location_of_incident, :string
    
      remove_column :transcriptions, :type_of_incident, :string
    
  end
end