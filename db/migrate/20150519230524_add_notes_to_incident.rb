class AddNotesToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :narrative_notes, :text
    add_column :incidents, :autopsy_notes, :text
    add_column :incidents, :conclusion_notes, :text
  end
end
