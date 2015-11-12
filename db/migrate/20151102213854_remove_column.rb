class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :people, :male
    remove_column :people, :female
  end
end
