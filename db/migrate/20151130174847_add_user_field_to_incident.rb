class AddUserFieldToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :user_email, :string
    add_column :incidents, :user_id, :string
    add_column :incidents, :transcribed, :boolean
    rename_column :incidents, :email, :verified_by_email
  end
end
