class RemoveFieldsFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :officer_police_agency
    remove_column :people, :on_duty_shooting_case
    remove_column :people, :date_of_incident
  end
end
