class AddDetailsToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :date_of_incident, :datetime
    add_column :incidents, :what_happened, :text
    add_column :incidents, :general_location_of_incident, :string
    add_column :incidents, :type_of_incident, :string
  end
end
