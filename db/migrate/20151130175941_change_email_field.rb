class ChangeEmailField < ActiveRecord::Migration
  def change
    rename_column :incidents, :email, :verified_by_email
  end
end
