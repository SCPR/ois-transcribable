class IncidentWhatLedToResponse < ActiveRecord::Migration
  def change
    add_column :incidents, :led_to_response_category, :string, null:true
  end
end
