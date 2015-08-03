class IncidentsController < ApplicationController

    layout "simple_frame"

    def index
        @incidents = Incident.all
        @verified_incidents = @incidents.where(verified: true)
        @on_duty_incidents = @verified_incidents.where(case_relevant: true)
        @fatal = @on_duty_incidents.group(:fatal).count
        @multiple_officers = @on_duty_incidents.group(:multiple_officers).count
        @car_stop = @on_duty_incidents.group(:car_stop).count
        @civillian_armed = @on_duty_incidents.group(:civillian_armed).count
        @potential_police_video = @on_duty_incidents.group(:potential_police_video).count
        @potential_civillian_video = @on_duty_incidents.group(:potential_civillian_video).count
        @mention_of_waistband_in_report = @on_duty_incidents.group(:mention_of_waistband_in_report).count
        @fatal = @on_duty_incidents.group(:fatal).count
        @case_relevant = @on_duty_incidents.group(:case_relevant).count
        @victim_arrested = @on_duty_incidents.group(:victim_arrested).count
        @officer_charges_filed = @on_duty_incidents.group(:officer_charges_filed).count
        @officer_self_defense = @on_duty_incidents.group(:officer_self_defense).count
        @officer_defense_of_civillians = @on_duty_incidents.group(:officer_defense_of_civillians).count
        @officer_defense_of_officers = @on_duty_incidents.group(:officer_defense_of_officers).count
        @officer_unknown = @on_duty_incidents.group(:officer_unknown).count
        @officer_serving_warrant = @on_duty_incidents.group(:officer_serving_warrant).count
        @officer_on_surveillance = @on_duty_incidents.group(:officer_on_surveillance).count
        @officer_on_undercover = @on_duty_incidents.group(:officer_on_undercover).count
        @pursuit_occurred = @on_duty_incidents.group(:pursuit_occurred).count
        @victim_gang_member = @on_duty_incidents.group(:victim_gang_member).count
        @victim_ignored_officer_commands = @on_duty_incidents.group(:victim_ignored_officer_commands).count
        @victim_weapon_recovered = @on_duty_incidents.group(:victim_weapon_recovered).count
        @victim_initiated_physical_threat = @on_duty_incidents.group(:victim_initiated_physical_threat).count
        @victim_intoxicated = @on_duty_incidents.group(:victim_intoxicated).count
        @victim_mentally_ill = @on_duty_incidents.group(:victim_mentally_ill).count
        @civilian_witnesses = @on_duty_incidents.group(:civilian_witnesses).count
        @victim_fired_weapon = @on_duty_incidents.group(:victim_fired_weapon).count
        @victim_pointed_weapon = @on_duty_incidents.group(:victim_pointed_weapon).count
        @officer_injured = @on_duty_incidents.group(:officer_injured).count
        @flag_for_followup = @on_duty_incidents.group(:flag_for_followup).count
        @victim_shot_in_back = @on_duty_incidents.group(:victim_shot_in_back).count
        @applied_lawful_force = @on_duty_incidents.group(:applied_lawful_force).count
        @victim_shot_in_head = @on_duty_incidents.group(:victim_shot_in_head).count
        @victim_unarmed = @on_duty_incidents.group(:victim_unarmed).count
        @officer_couldnt_see_victims_hands = @on_duty_incidents.group(:officer_couldnt_see_victims_hands).count
        @officer_routine_patrol = @on_duty_incidents.group(:officer_routine_patrol).count
        @officer_responding_to_call = @on_duty_incidents.group(:officer_responding_to_call).count
        @grabbed_officers_weapon = @on_duty_incidents.group(:grabbed_officers_weapon).count




        #@fatal_pct = create_pct(@fatal, @on_duty_incidents.count)
        #@victim_weapon_recovered = @on_duty_incidents.where(victim_weapon_recovered: true).count
        #@victim_weapon_recovered_pct = create_pct(@victim_weapon_recovered, @on_duty_incidents.count)
        #@officer_injured = @on_duty_incidents.where(officer_injured: true).count
        #@officer_injured_pct = create_pct(@officer_injured, @on_duty_incidents.count)
        #@victim_intoxicated = @on_duty_incidents.where(victim_intoxicated: true).count
        #@victim_intoxicated_pct = create_pct(@victim_intoxicated, @on_duty_incidents.count)

        #@victim_mentally_ill = @on_duty_incidents.where(victim_mentally_ill: true).count
        #@victim_mentally_ill_pct = create_pct(@victim_mentally_ill, @on_duty_incidents.count)

        #@victim_intoxicated_or_ill = (@victim_intoxicated + @victim_mentally_ill)
        #@victim_intoxicated_or_ill_pct = create_pct(@victim_intoxicated_or_ill, @on_duty_incidents.count)

        #@flag_for_followup = @incidents.where(flag_for_followup: true).count
        #@flag_for_followup_pct = create_pct(@flag_for_followup, @on_duty_incidents.count)

        #@officer_defense_of_civillians = @on_duty_incidents.where(officer_defense_of_civillians: true).count
        #@officer_defense_of_civillians_pct = create_pct(@officer_defense_of_civillians, @on_duty_incidents.count)
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
    def create_pct(count)
        @incidents = Incident.all
        @verified_incidents = @incidents.where(verified: true)
        @on_duty_incidents = @verified_incidents.where(case_relevant: true)
        pct = (count.to_f / @on_duty_incidents.to_f) * 100
        return pct
    end

end
