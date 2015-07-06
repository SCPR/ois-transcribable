class IncidentsController < ApplicationController
    layout "simple_frame"

    def index
        @transcriptions = Transcription.all
        @transcriptions_count = @transcriptions.count
        @victim_weapon_recovered = @transcriptions.where(victim_weapon_recovered: true).count
        @officer_defense_of_civillians = @transcriptions.where(officer_defense_of_civillians: true).count
        @victim_intoxicated = @transcriptions.where(victim_intoxicated: true).count
        @victim_mentally_ill = @transcriptions.where(victim_mentally_ill: true).count
        @victim_intoxicated_or_ill = (@victim_intoxicated + @victim_mentally_ill)
        @flag_for_followup = @transcriptions.where(flag_for_followup: true).count
    end

end
