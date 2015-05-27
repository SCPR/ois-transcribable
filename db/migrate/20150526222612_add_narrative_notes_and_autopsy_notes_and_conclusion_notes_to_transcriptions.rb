class AddNarrativeNotesAndAutopsyNotesAndConclusionNotesToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :narrative_notes, :text
    
      add_column :transcriptions, :autopsy_notes, :text
    
      add_column :transcriptions, :conclusion_notes, :text
    
  end

  def self.down
    
      remove_column :transcriptions, :narrative_notes, :text
    
      remove_column :transcriptions, :autopsy_notes, :text
    
      remove_column :transcriptions, :conclusion_notes, :text
    
  end
end