class AddTranscribedCountToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :transcribed_count, :integer, null: true, default: 0
  end
end
