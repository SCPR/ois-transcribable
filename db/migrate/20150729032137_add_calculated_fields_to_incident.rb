class AddCalculatedFieldsToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :civillian_weapon_specific, :string
    add_column :incidents, :officer_shots_fired_specific, :string
    add_column :incidents, :type_of_incident_number, :string
  end
end
