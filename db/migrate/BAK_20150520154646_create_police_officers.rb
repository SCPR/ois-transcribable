class CreatePoliceOfficers < ActiveRecord::Migration
  def change
    create_table :police_officers do |t|
      t.string :officer_name
      t.string :officer_agency
      t.string :officer_badge_number
      t.timestamps null: false
    end
  end
end
