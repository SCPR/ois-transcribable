class AddUserFieldToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :user_email, :string
    add_column :incidents, :user_id, :string
  end
end
