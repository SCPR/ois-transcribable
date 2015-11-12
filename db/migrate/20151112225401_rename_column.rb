class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :incidents, :url, :incident_url
  end
end
