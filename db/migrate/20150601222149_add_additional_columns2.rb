class AddAdditionalColumns2 < ActiveRecord::Migration
  def change
    add_column :incidents, :officer_self_defense, :boolean, :null => false, :default => false
    add_column :incidents, :officer_defense_of_civillians, :boolean, :null => false, :default => false
    add_column :incidents, :officer_defense_of_officers, :boolean, :null => false, :default => false
    add_column :incidents, :officer_unknown, :boolean, :null => false, :default => false
    add_column :incidents, :officer_serving_warrant, :boolean, :null => false, :default => false
    add_column :incidents, :officer_on_surveillance, :boolean, :null => false, :default => false
  end
end
