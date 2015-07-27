class IncidentsController < ApplicationController
    layout "simple_frame"

    def index

        @incidents = Incident.all
        @verified_incidents = @incidents.where(verified: true)
        @on_duty_incidents = @verified_incidents.where(case_relevant: true)

        @fatal = @on_duty_incidents.where(fatal: true).count
        @fatal_pct = create_pct(@fatal, @on_duty_incidents.count)

        @victim_weapon_recovered = @on_duty_incidents.where(victim_weapon_recovered: true).count
        @victim_weapon_recovered_pct = create_pct(@victim_weapon_recovered, @on_duty_incidents.count)

        @officer_injured = @on_duty_incidents.where(officer_injured: true).count
        @officer_injured_pct = create_pct(@officer_injured, @on_duty_incidents.count)

        @victim_intoxicated = @on_duty_incidents.where(victim_intoxicated: true).count
        @victim_intoxicated_pct = create_pct(@victim_intoxicated, @on_duty_incidents.count)

        @victim_mentally_ill = @on_duty_incidents.where(victim_mentally_ill: true).count
        @victim_mentally_ill_pct = create_pct(@victim_mentally_ill, @on_duty_incidents.count)

        @victim_intoxicated_or_ill = (@victim_intoxicated + @victim_mentally_ill)
        @victim_intoxicated_or_ill_pct = create_pct(@victim_intoxicated_or_ill, @on_duty_incidents.count)

        @flag_for_followup = @incidents.where(flag_for_followup: true).count
        @flag_for_followup_pct = create_pct(@flag_for_followup, @on_duty_incidents.count)

        @officer_defense_of_civillians = @on_duty_incidents.where(officer_defense_of_civillians: true).count
        @officer_defense_of_civillians_pct = create_pct(@officer_defense_of_civillians, @on_duty_incidents.count)

    end

    def show
        @incident = Incident.find(params[:id])
    end

    def destroy
        @incident = Incident.find(params[:id])
        puts @incident
        @incident.destroy
        redirect_to(incidents_path, :alert => "Deleted")
    end

    private
    def create_pct(count, total)
        pct = (count.to_f / total.to_f) * 100
        return pct
    end

end
