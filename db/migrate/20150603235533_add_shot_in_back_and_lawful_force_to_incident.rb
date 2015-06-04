class AddShotInBackAndLawfulForceToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :victim_shot_in_back, :boolean, null:true
    add_column :incidents, :applied_lawful_force, :boolean, null:true
  end
end
