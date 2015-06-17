class AddsOfficerResponseToIncident < ActiveRecord::Migration
    def change
          add_column :incidents, :officer_responding_to_call, :boolean, null:true
          add_column :incidents, :grabbed_officers_weapon, :boolean, null:true
    end
end
