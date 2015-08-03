class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :incidents, :civillian_armed, :believed_civillian_armed
  end
end
