class AddWaistbandToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :mention_of_waistband_in_report, :boolean, :null => false, :default => false
  end
end
