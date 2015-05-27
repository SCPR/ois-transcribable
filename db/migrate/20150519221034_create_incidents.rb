class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :url
      t.boolean :verified, :null => false, :default => false
      t.string :civilian_name
      t.timestamps null: false
    end
  end
end
