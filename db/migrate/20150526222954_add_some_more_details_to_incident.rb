class AddSomeMoreDetailsToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :car_stop, :boolean, :null => false, :default => false
    add_column :incidents, :chase_or_pursuit, :boolean, :null => false, :default => false
    add_column :incidents, :civillian_armed, :boolean, :null => false, :default => false
    add_column :incidents, :potential_police_video, :boolean, :null => false, :default => false
    add_column :incidents, :potential_civillian_video, :boolean, :null => false, :default => false
  end
end
