class IncidentsController < ApplicationController

    layout "simple_frame"

    def index
        @user = current_user
        if current_user.email == "wcterrill@gmail.com"
            redirect_to incidents_statistics_path
        else
            @incidents = Incident.all.order("district_attorney_file_number")
            @incidents_verified = Incident.all.where("verified = '1'")
        end
    end

    def statistics
    end

    def data
        @incidents = Incident.where("on_duty_shooting_case = '1'")
        render :json => @incidents.to_json(:include => :people)
    end

    def classify_response
        @incidents = Incident.where("on_duty_shooting_case = '1'").order("led_to_response_category")
        @completed = @incidents.where("led_to_response_category != 'nil'")
        @completed_percent = (@completed.count.to_f / @incidents.count.to_f) * 100
    end

    def show
        @incident = Incident.find(params[:id])
        @transcription = Transcription.find_by district_attorney_file_number: @incident.district_attorney_file_number
    end

    def new
        @incident = Incident.new
    end

    def create
        @incident = Incident.new(incident_params)
    end

    def edit
        @incident = Incident.find(params[:id])
        @people = @incident.people
        @transcription = Transcription.find_by district_attorney_file_number: @incident.district_attorney_file_number
    end

    def update
        @incident = Incident.find(params[:incident_id])
        # @transcription = Transcription.find_by district_attorney_file_number: @incident.district_attorney_file_number
        if @incident.update_attributes(incident_params)
            # @transcription.created_at = @incident.created_at
            # @transcription.updated_at = @incident.updated_at
            # @transcription.person_name = @incident.person_name
            # @transcription.district_attorney_file_number = @incident.district_attorney_file_number
            # @transcription.district_attorney_county = @incident.district_attorney_county
            # @transcription.district_attorney_prepared_report = @incident.district_attorney_prepared_report
            # @transcription.general_location_of_incident = @incident.general_location_of_incident
            # @transcription.type_of_incident = @incident.type_of_incident
            # @transcription.person_weapon = @incident.person_weapon
            # @transcription.officer_shots_fired = @incident.officer_shots_fired
            # @transcription.district_attorney_on_scene = @incident.district_attorney_on_scene
            # @transcription.district_attorney_investigator_on_scene = @incident.district_attorney_investigator_on_scene
            # @transcription.district_attorney_conclusion = @incident.district_attorney_conclusion
            # @transcription.narrative_notes = @incident.narrative_notes
            # @transcription.autopsy_notes = @incident.autopsy_notes
            # @transcription.conclusion_notes = @incident.conclusion_notes
            # @transcription.officer_name_and_badge_number = @incident.officer_name_and_badge_number
            # @transcription.officer_police_agency = @incident.officer_police_agency
            # @transcription.what_happened = @incident.what_happened
            # @transcription.underlying_crime_leading_to_shooting = @incident.underlying_crime_leading_to_shooting
            # @transcription.how_situation_escalated = @incident.how_situation_escalated
            # @transcription.person_criminal_case_file_number = @incident.person_criminal_case_file_number
            # @transcription.officer_special_unit = @incident.officer_special_unit
            # @transcription.officer_charges_filed_yes_detail = @incident.officer_charges_filed_yes_detail
            # @transcription.person_charges_filed = @incident.person_charges_filed
            # @transcription.date_of_incident = @incident.date_of_incident
            # @transcription.district_attorney_date_of_letter = @incident.district_attorney_date_of_letter
            # @transcription.verified = @incident.verified
            # @transcription.multiple_officers = @incident.multiple_officers
            # @transcription.car_stop = @incident.car_stop
            # @transcription.believed_person_armed = @incident.believed_person_armed
            # @transcription.potential_police_video = @incident.potential_police_video
            # @transcription.potential_civillian_video = @incident.potential_civillian_video
            # @transcription.person_reached_for_waistband = @incident.person_reached_for_waistband
            # @transcription.person_killed = @incident.person_killed
            # @transcription.on_duty_shooting_case = @incident.on_duty_shooting_case
            # @transcription.person_arrested = @incident.person_arrested
            # @transcription.officer_charges_filed = @incident.officer_charges_filed
            # @transcription.officer_self_defense = @incident.officer_self_defense
            # @transcription.officer_defense_of_civillians = @incident.officer_defense_of_civillians
            # @transcription.officer_defense_of_officers = @incident.officer_defense_of_officers
            # @transcription.officer_unknown = @incident.officer_unknown
            # @transcription.officer_serving_warrant = @incident.officer_serving_warrant
            # @transcription.officer_on_surveillance = @incident.officer_on_surveillance
            # @transcription.officer_on_undercover = @incident.officer_on_undercover
            # @transcription.person_fled_by_foot_or_vehicle = @incident.person_fled_by_foot_or_vehicle
            # @transcription.person_signs_of_gang_affiliation = @incident.person_signs_of_gang_affiliation
            # @transcription.person_ignored_officer_commands = @incident.person_ignored_officer_commands
            # @transcription.person_weapon_recovered = @incident.person_weapon_recovered
            # @transcription.person_threatened_officer_with_weapon = @incident.person_threatened_officer_with_weapon
            # @transcription.victim_intoxicated = @incident.person_signs_of_impairment
            # @transcription.victim_mentally_ill = @incident.person_signs_of_mental_illness
            # @transcription.civilian_witnesses = @incident.civilian_witnesses
            # @transcription.person_fired_gun_at_officer = @incident.person_fired_gun_at_officer
            # @transcription.person_pointed_gun_at_officer = @incident.person_pointed_gun_at_officer
            # @transcription.officer_injured = @incident.officer_injured
            # @transcription.flag_for_followup = @incident.flag_for_followup
            # @transcription.person_shot_in_back = @incident.person_shot_in_back
            # @transcription.applied_lawful_force = @incident.applied_lawful_force
            # @transcription.person_shot_in_head = @incident.person_shot_in_head
            # @transcription.person_unarmed = @incident.person_unarmed
            # @transcription.person_hid_hands_from_officer = @incident.person_hid_hands_from_officer
            # @transcription.officer_routine_patrol = @incident.officer_routine_patrol
            # @incident.transcribed_count = 1
            # @transcription.officer_responding_to_call = @incident.officer_responding_to_call
            # @transcription.person_grabbed_for_officers_weapon_holster = @incident.person_grabbed_for_officers_weapon_holster
            # @incident.save
            # @transcription.save
            # redirect_to @incident
            redirect_to(incident_path, :alert => "Updated")
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
        @on_duty_incidents = @verified_incidents.where(on_duty_shooting_case: true)
        pct = (count.to_f / @on_duty_incidents.to_f) * 100
        return pct
    end

    def incident_params
        params.require(:incident).permit!
    end

end
