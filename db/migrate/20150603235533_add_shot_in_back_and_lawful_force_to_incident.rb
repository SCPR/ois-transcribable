class AddShotInBackAndLawfulForceToIncident < ActiveRecord::Migration
  def change
    t.boolean :victim_shot_in_back, :applied_lawful_force, null:true
  end
end
