class AddAdditionalColumns3 < ActiveRecord::Migration
  def change
    add_column :incidents, :officer_on_undercover, :boolean, :null => false, :default => false
    add_column :incidents, :pursuit_occurred, :boolean, :null => false, :default => false
    add_column :incidents, :victim_gang_member, :boolean, :null => false, :default => false
    add_column :incidents, :victim_ignored_officer_commands, :boolean, :null => false, :default => false
    add_column :incidents, :victim_weapon_recovered, :boolean, :null => false, :default => false
    add_column :incidents, :victim_initiated_physical_threat, :boolean, :null => false, :default => false
  end
end
