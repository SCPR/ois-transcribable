class AddDistrictAttorneyToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :district_attorney_file_number, :string, :unique => true, :null => false, :default => ""
    add_column :incidents, :district_attorney_county, :string, :null => false, :default => ""
    add_column :incidents, :district_attorney_date_of_letter, :date, :null => false, :default => ""
    add_column :incidents, :district_attorney_conclusion, :text, :null => false, :default => ""
    add_column :incidents, :district_attorney_prepared_report, :string, :null => false, :default => ""
  end
end
