class AddMoreDetailsToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :underlying_crime_leading_to_shooting, :text
    add_column :incidents, :how_situation_escalated, :text
    add_column :incidents, :civillian_weapon, :string
  end
end
