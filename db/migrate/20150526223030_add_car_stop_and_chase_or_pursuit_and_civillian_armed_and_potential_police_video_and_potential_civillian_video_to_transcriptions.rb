class AddCarStopAndChaseOrPursuitAndCivillianArmedAndPotentialPoliceVideoAndPotentialCivillianVideoToTranscriptions < ActiveRecord::Migration
  def self.up
    
      add_column :transcriptions, :car_stop, :boolean
    
      add_column :transcriptions, :chase_or_pursuit, :boolean
    
      add_column :transcriptions, :civillian_armed, :boolean
    
      add_column :transcriptions, :potential_police_video, :boolean
    
      add_column :transcriptions, :potential_civillian_video, :boolean
    
  end

  def self.down
    
      remove_column :transcriptions, :car_stop, :boolean
    
      remove_column :transcriptions, :chase_or_pursuit, :boolean
    
      remove_column :transcriptions, :civillian_armed, :boolean
    
      remove_column :transcriptions, :potential_police_video, :boolean
    
      remove_column :transcriptions, :potential_civillian_video, :boolean
    
  end
end