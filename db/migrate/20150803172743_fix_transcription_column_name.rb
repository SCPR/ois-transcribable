class FixTranscriptionColumnName < ActiveRecord::Migration
  def change
    rename_column :transcriptions, :civillian_armed, :believed_civillian_armed
  end
end
