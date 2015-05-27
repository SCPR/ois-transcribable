class AddDistrictAttorneyConclusionAndDistrictAttorneyPreparedReportAndOfficerNameAndBadgeNumberAndOfficerPoliceAgencyAndWhatHappenedToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :district_attorney_conclusion, :text
    
      add_column :transcriptions, :district_attorney_prepared_report, :string
    
      add_column :transcriptions, :officer_name_and_badge_number, :text
    
      add_column :transcriptions, :officer_police_agency, :text
    
      add_column :transcriptions, :what_happened, :text
    
  end

  def self.down
    
      remove_column :transcriptions, :district_attorney_conclusion, :text
    
      remove_column :transcriptions, :district_attorney_prepared_report, :string
    
      remove_column :transcriptions, :officer_name_and_badge_number, :text
    
      remove_column :transcriptions, :officer_police_agency, :text
    
      remove_column :transcriptions, :what_happened, :text
    
  end
end