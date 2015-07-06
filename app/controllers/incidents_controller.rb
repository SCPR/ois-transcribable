class IncidentsController < ApplicationController
    layout "simple_frame"

    def index
        @transcriptions = Transcription.all
        @transcriptions_count = @transcriptions.count

        @fatal = @transcriptions.where(fatal: true).count
        @fatal_pct = create_pct(@fatal, @transcriptions_count)

        @victim_weapon_recovered = @transcriptions.where(victim_weapon_recovered: true).count
        @victim_weapon_recovered_pct = create_pct(@victim_weapon_recovered, @transcriptions_count)

        @officer_defense_of_civillians = @transcriptions.where(officer_defense_of_civillians: true).count
        @officer_defense_of_civillians_pct = create_pct(@officer_defense_of_civillians, @transcriptions_count)

        @officer_injured = @transcriptions.where(officer_injured: true).count
        @officer_injured_pct = create_pct(@officer_injured, @transcriptions_count)

        @victim_intoxicated = @transcriptions.where(victim_intoxicated: true).count
        @victim_intoxicated_pct = create_pct(@victim_intoxicated, @transcriptions_count)

        @victim_mentally_ill = @transcriptions.where(victim_mentally_ill: true).count
        @victim_mentally_ill_pct = create_pct(@victim_mentally_ill, @transcriptions_count)

        @victim_intoxicated_or_ill = (@victim_intoxicated + @victim_mentally_ill)
        @victim_intoxicated_or_ill_pct = create_pct(@victim_intoxicated_or_ill, @transcriptions_count)

        @flag_for_followup = @transcriptions.where(flag_for_followup: true).count
        @flag_for_followup_pct = create_pct(@flag_for_followup, @transcriptions_count)

    end

    private
    def create_pct(count, total)
        pct = (count.to_f / total.to_f) * 100
        return pct
    end

end
