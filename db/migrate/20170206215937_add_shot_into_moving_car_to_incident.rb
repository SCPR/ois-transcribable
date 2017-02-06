class AddShotIntoMovingCarToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :moving_car, :boolean
  end
end
