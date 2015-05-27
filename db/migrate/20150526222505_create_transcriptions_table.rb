class CreateTranscriptionsTable < ActiveRecord::Migration
  def self.up
    create_table :transcriptions do |t|
      
        t.string :civilian_name
      
      t.integer :incident_id
      t.string :user_id # by default, this will be a UUID stored by cookie
    end
  end

  def self.down
    drop_table :transcriptions
  end
end