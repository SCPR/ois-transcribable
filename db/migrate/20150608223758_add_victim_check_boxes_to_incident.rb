class AddVictimCheckBoxesToIncident < ActiveRecord::Migration
  def change
        add_column :incidents, :victim_shot_in_head, :boolean, null:true
        add_column :incidents, :victim_unarmed, :boolean, null:true
        add_column :incidents, :officer_couldnt_see_victims_hands, :boolean, null:true
        add_column :incidents, :officer_routine_patrol, :boolean, null:true
  end
end
