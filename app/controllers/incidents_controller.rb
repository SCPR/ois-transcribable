class IncidentsController < ApplicationController

    layout "simple_frame"

    def index
        @incidents = Incident.all
        @transcriptions = Transcription.all
    end

    def statistics
        @incidents = Incident.all
    end

    def show
        @transcription = Transcription.find(params[:id])
        @incident = Incident.find_by id: @transcription.incident_id
    end

    def new
        @incident = Incident.new
    end

    def create
        @incident = Incident.new(incident_params)
    end

    def edit
        @incident = Incident.find(params[:id])
        @transcription = Transcription.find_by district_attorney_file_number: @incident.district_attorney_file_number
    end

    def update
        @incident = Incident.find(params[:incident_id])
        @transcription = Transcription.find_by district_attorney_file_number: @incident.district_attorney_file_number
        if @incident.update_attributes(incident_params)
            @transcription.created_at = @incident.created_at
            @transcription.updated_at = @incident.updated_at
            @transcription.civilian_name = @incident.civilian_name
            @transcription.district_attorney_file_number = @incident.district_attorney_file_number
            @transcription.district_attorney_county = @incident.district_attorney_county
            @transcription.district_attorney_prepared_report = @incident.district_attorney_prepared_report
            @transcription.general_location_of_incident = @incident.general_location_of_incident
            @transcription.type_of_incident = @incident.type_of_incident
            @transcription.civillian_weapon = @incident.civillian_weapon
            @transcription.officer_shots_fired = @incident.officer_shots_fired
            @transcription.da_on_scene = @incident.da_on_scene
            @transcription.da_investigator_on_scene = @incident.da_investigator_on_scene
            @transcription.district_attorney_conclusion = @incident.district_attorney_conclusion
            @transcription.narrative_notes = @incident.narrative_notes
            @transcription.autopsy_notes = @incident.autopsy_notes
            @transcription.conclusion_notes = @incident.conclusion_notes
            @transcription.officer_name_and_badge_number = @incident.officer_name_and_badge_number
            @transcription.officer_police_agency = @incident.officer_police_agency
            @transcription.what_happened = @incident.what_happened
            @transcription.underlying_crime_leading_to_shooting = @incident.underlying_crime_leading_to_shooting
            @transcription.how_situation_escalated = @incident.how_situation_escalated
            @transcription.victim_case_number = @incident.victim_case_number
            @transcription.officer_special_unit = @incident.officer_special_unit
            @transcription.officer_charges_filed_yes_detail = @incident.officer_charges_filed_yes_detail
            @transcription.victim_charges_filed = @incident.victim_charges_filed
            @transcription.date_of_incident = @incident.date_of_incident
            @transcription.district_attorney_date_of_letter = @incident.district_attorney_date_of_letter
            @transcription.verified = @incident.verified
            @transcription.multiple_officers = @incident.multiple_officers
            @transcription.car_stop = @incident.car_stop
            @transcription.believed_civillian_armed = @incident.believed_civillian_armed
            @transcription.potential_police_video = @incident.potential_police_video
            @transcription.potential_civillian_video = @incident.potential_civillian_video
            @transcription.mention_of_waistband_in_report = @incident.mention_of_waistband_in_report
            @transcription.fatal = @incident.fatal
            @transcription.case_relevant = @incident.case_relevant
            @transcription.victim_arrested = @incident.victim_arrested
            @transcription.officer_charges_filed = @incident.officer_charges_filed
            @transcription.officer_self_defense = @incident.officer_self_defense
            @transcription.officer_defense_of_civillians = @incident.officer_defense_of_civillians
            @transcription.officer_defense_of_officers = @incident.officer_defense_of_officers
            @transcription.officer_unknown = @incident.officer_unknown
            @transcription.officer_serving_warrant = @incident.officer_serving_warrant
            @transcription.officer_on_surveillance = @incident.officer_on_surveillance
            @transcription.officer_on_undercover = @incident.officer_on_undercover
            @transcription.pursuit_occurred = @incident.pursuit_occurred
            @transcription.victim_gang_member = @incident.victim_gang_member
            @transcription.victim_ignored_officer_commands = @incident.victim_ignored_officer_commands
            @transcription.victim_weapon_recovered = @incident.victim_weapon_recovered
            @transcription.victim_initiated_physical_threat = @incident.victim_initiated_physical_threat
            @transcription.victim_intoxicated = @incident.victim_intoxicated
            @transcription.victim_mentally_ill = @incident.victim_mentally_ill
            @transcription.civilian_witnesses = @incident.civilian_witnesses
            @transcription.victim_fired_weapon = @incident.victim_fired_weapon
            @transcription.victim_pointed_weapon = @incident.victim_pointed_weapon
            @transcription.officer_injured = @incident.officer_injured
            @transcription.flag_for_followup = @incident.flag_for_followup
            @transcription.victim_shot_in_back = @incident.victim_shot_in_back
            @transcription.applied_lawful_force = @incident.applied_lawful_force
            @transcription.victim_shot_in_head = @incident.victim_shot_in_head
            @transcription.victim_unarmed = @incident.victim_unarmed
            @transcription.officer_couldnt_see_victims_hands = @incident.officer_couldnt_see_victims_hands
            @transcription.officer_routine_patrol = @incident.officer_routine_patrol
            @transcription.officer_responding_to_call = @incident.officer_responding_to_call
            @transcription.grabbed_officers_weapon = @incident.grabbed_officers_weapon
            @transcription.email = @incident.email
            @incident.save
            @transcription.save
            redirect_to @incident
        else
            render "edit"
        end
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

    def incident_params
        params.require(:incident).permit!
    end

end
