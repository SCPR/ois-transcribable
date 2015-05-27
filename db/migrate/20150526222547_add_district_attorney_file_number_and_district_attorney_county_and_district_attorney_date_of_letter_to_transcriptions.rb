class AddDistrictAttorneyFileNumberAndDistrictAttorneyCountyAndDistrictAttorneyDateOfLetterToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :district_attorney_file_number, :string
    
      add_column :transcriptions, :district_attorney_county, :string
    
      add_column :transcriptions, :district_attorney_date_of_letter, :date
    
  end

  def self.down
    
      remove_column :transcriptions, :district_attorney_file_number, :string
    
      remove_column :transcriptions, :district_attorney_county, :string
    
      remove_column :transcriptions, :district_attorney_date_of_letter, :date
    
  end
end