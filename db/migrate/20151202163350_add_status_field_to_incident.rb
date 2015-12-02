class AddStatusFieldToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :transcribed_status, :string
  end
end
