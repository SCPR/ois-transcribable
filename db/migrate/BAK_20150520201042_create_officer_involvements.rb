class CreateOfficerInvolvements < ActiveRecord::Migration
  def change
    create_table :officer_involvements do |t|
      t.integer :incident_id
      t.integer :police_officer_id
      t.datetime :created_at
      t.timestamps null: false
    end
  end
end
