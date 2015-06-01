class AddFatalNotFatal < ActiveRecord::Migration
  def change
    add_column :incidents, :fatal, :boolean, :null => false, :default => false
  end
end
