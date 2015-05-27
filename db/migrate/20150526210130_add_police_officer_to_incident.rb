class AddPoliceOfficerToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :multiple_officers, :boolean, :null => false, :default => false
    add_column :incidents, :officer_name_and_badge_number, :text
    add_column :incidents, :officer_police_agency, :text
  end
end
