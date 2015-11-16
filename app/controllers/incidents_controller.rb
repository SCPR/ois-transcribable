class IncidentsController < ApplicationController

    layout "simple_frame"

    def index
        @user = current_user
        if current_user.email == "wcterrill@gmail.com"
            redirect_to incidents_statistics_path
        else
            @incidents = Incident.all.sort_by { :updated_at }.reverse
            @incidents_verified = Incident.all.where("verified = '1'")
            @transcriptions = Transcription.all
        end
    end

    def statistics
        # @incidents = Incident.all
        # container_of_officers = Array.new
        # container_of_officer_cases = Array.new
        # @relevant_incidents = @incidents.where("case_relevant = '1'")
        # @relevant_incidents.each do |item|
        #     values = item.officer_name_and_badge_number.split(",")
        #     values.each do |value|
        #         clean_name = value.gsub(/\(.*\)/, "").strip
        #         container_of_officers.push clean_name
        #         officer_case_hash = Hash.new(0)
        #         officer_case_hash["officer_name"] = clean_name
        #         officer_case_hash["district_attorney_file_number"] = item.district_attorney_file_number
        #         officer_case_hash["url"] = item.incident_url
        #         officer_case_hash["officer_police_agency"] = item.officer_police_agency
        #         container_of_officer_cases.push officer_case_hash
        #     end
        # end
        # officer_quantity = Hash.new(0)
        # container_of_officers.each do |officer|
        #     officer_quantity[officer] += 1
        # end
        # final_container = Array.new
        # officer_quantity.each do |k, v|
        #     final_hash = Hash.new(0)
        #     final_hash["name"] = k
        #     final_hash["quantity"] = v
        #     final_hash["cases"] = Array.new
        #     container_of_officer_cases.each do |item|
        #         if k == item["officer_name"]
        #             this_case = {"district_attorney_file_number"=>item["district_attorney_file_number"], "officer_police_agency"=>item["officer_police_agency"], "url"=>item["url"]}
        #             final_hash["cases"].push this_case
        #         end
        #     end
        #     final_container.push final_hash
        # end
        # @final_container = final_container
    end

    def data
        @incidents = Incident.select("car_stop, case_relevant, civilian_witnesses, da_investigator_on_scene, da_on_scene, date_of_incident, district_attorney_county, district_attorney_date_of_letter, district_attorney_file_number, district_attorney_prepared_report, flag_for_followup, general_location_of_incident, led_to_response_category, multiple_officers, officer_charges_filed, officer_defense_of_civillians, officer_defense_of_officers, officer_injured, officer_name_and_badge_number, officer_on_surveillance, officer_on_undercover, officer_police_agency, officer_responding_to_call, officer_routine_patrol, officer_self_defense, officer_serving_warrant, officer_shots_fired, officer_shots_fired_specific, potential_civillian_video, potential_police_video, type_of_incident, type_of_incident_number, verified").all

        @incidents = @incidents.where("case_relevant = '1'")

        render :json => @incidents.to_json(:include => {:people => {:only => [:id, :person_name, :district_attorney_file_number, :incident_url, :person_weapon, :person_ethnicity, :person_gender, :person_age, :person_intoxicated, :fatal, :nonfatal_calc, :armed_with_firearm_calc, :armed_with_other_calc, :vehicle_as_weapon, :mention_of_waistband_in_report, :pursuit_occurred, :person_ignored_officer_commands, :person_mentally_ill, :person_fired_weapon, :person_pointed_weapon, :person_unarmed, :person_armed_calc, :officer_couldnt_see_persons_hands, :grabbed_officers_weapon, :person_initiated_physical_threat, :person_weapon_recovered, :vehicle_as_weapon, :person_shot_in_back, :person_shot_in_head, :person_arrested, :person_gang_member]}})
    end

    def dashboard_data
        @incidents = Incident.select("district_attorney_file_number, district_attorney_county, district_attorney_prepared_report, type_of_incident, da_on_scene, da_investigator_on_scene,date_of_incident, district_attorney_date_of_letter, multiple_officers, car_stop, fatal, case_relevant, officer_self_defense, officer_defense_of_civillians, officer_defense_of_officers, type_of_incident_number, led_to_response_category").all

        @incidents = @incidents.where("case_relevant = '1'")

        render :json => @incidents.to_json(:include => {:people => {:only => [:person_name, :district_attorney_file_number, :incident_url, :person_weapon, :person_ethnicity, :person_gender, :person_age, :year_of_incident, :case_relevant, :person_intoxicated, :fatal, :nonfatal_calc, :armed_with_firearm_calc, :armed_with_other_calc, :vehicle_as_weapon, :mention_of_waistband_in_report, :pursuit_occurred, :person_ignored_officer_commands, :person_mentally_ill, :person_fired_weapon, :person_unarmed, :person_armed_calc, :officer_couldnt_see_persons_hands, :grabbed_officers_weapon, :date_of_incident]}})
    end

    def classify_response
        @incidents = Incident.where("case_relevant = '1'").order("led_to_response_category")
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

        puts @incident

        @people = @incident.people
        @transcription = Transcription.find_by district_attorney_file_number: @incident.district_attorney_file_number
    end

    def update
        @incident = Incident.find(params[:incident_id])
        @transcription = Transcription.find_by district_attorney_file_number: @incident.district_attorney_file_number
        if @incident.update_attributes(incident_params)
            @transcription.created_at = @incident.created_at
            @transcription.updated_at = @incident.updated_at
            #@transcription.person_name = @incident.person_name
            @transcription.district_attorney_file_number = @incident.district_attorney_file_number
            @transcription.district_attorney_county = @incident.district_attorney_county
            @transcription.district_attorney_prepared_report = @incident.district_attorney_prepared_report
            @transcription.general_location_of_incident = @incident.general_location_of_incident
            @transcription.type_of_incident = @incident.type_of_incident
            #@transcription.person_weapon = @incident.person_weapon
            @transcription.officer_shots_fired = @incident.officer_shots_fired
            @transcription.da_on_scene = @incident.da_on_scene
            @transcription.da_investigator_on_scene = @incident.da_investigator_on_scene
            #@transcription.district_attorney_conclusion = @incident.district_attorney_conclusion
            @transcription.narrative_notes = @incident.narrative_notes
            @transcription.autopsy_notes = @incident.autopsy_notes
            @transcription.conclusion_notes = @incident.conclusion_notes
            @transcription.officer_name_and_badge_number = @incident.officer_name_and_badge_number
            @transcription.officer_police_agency = @incident.officer_police_agency
            @transcription.what_happened = @incident.what_happened
            @transcription.underlying_crime_leading_to_shooting = @incident.underlying_crime_leading_to_shooting
            @transcription.how_situation_escalated = @incident.how_situation_escalated
            #@transcription.person_case_number = @incident.person_case_number
            @transcription.officer_special_unit = @incident.officer_special_unit
            @transcription.officer_charges_filed_yes_detail = @incident.officer_charges_filed_yes_detail
            #@transcription.person_charges_filed = @incident.person_charges_filed
            @transcription.date_of_incident = @incident.date_of_incident
            @transcription.district_attorney_date_of_letter = @incident.district_attorney_date_of_letter
            @transcription.verified = @incident.verified
            @transcription.multiple_officers = @incident.multiple_officers
            @transcription.car_stop = @incident.car_stop
            #@transcription.believed_person_armed = @incident.believed_person_armed
            @transcription.potential_police_video = @incident.potential_police_video
            @transcription.potential_civillian_video = @incident.potential_civillian_video
            #@transcription.mention_of_waistband_in_report = @incident.mention_of_waistband_in_report
            @transcription.fatal = @incident.fatal
            @transcription.case_relevant = @incident.case_relevant
            #@transcription.person_arrested = @incident.person_arrested
            @transcription.officer_charges_filed = @incident.officer_charges_filed
            @transcription.officer_self_defense = @incident.officer_self_defense
            @transcription.officer_defense_of_civillians = @incident.officer_defense_of_civillians
            @transcription.officer_defense_of_officers = @incident.officer_defense_of_officers
            #@transcription.officer_unknown = @incident.officer_unknown
            @transcription.officer_serving_warrant = @incident.officer_serving_warrant
            @transcription.officer_on_surveillance = @incident.officer_on_surveillance
            @transcription.officer_on_undercover = @incident.officer_on_undercover
            #@transcription.pursuit_occurred = @incident.pursuit_occurred
            #@transcription.person_gang_member = @incident.person_gang_member
            #@transcription.person_ignored_officer_commands = @incident.person_ignored_officer_commands
            #@transcription.person_weapon_recovered = @incident.person_weapon_recovered
            #@transcription.person_initiated_physical_threat = @incident.person_initiated_physical_threat
            #@transcription.victim_intoxicated = @incident.person_intoxicated
            #@transcription.victim_mentally_ill = @incident.person_mentally_ill
            @transcription.civilian_witnesses = @incident.civilian_witnesses
            #@transcription.person_fired_weapon = @incident.person_fired_weapon
            #@transcription.person_pointed_weapon = @incident.person_pointed_weapon
            @transcription.officer_injured = @incident.officer_injured
            @transcription.flag_for_followup = @incident.flag_for_followup
            #@transcription.person_shot_in_back = @incident.person_shot_in_back
            #@transcription.applied_lawful_force = @incident.applied_lawful_force
            #@transcription.person_shot_in_head = @incident.person_shot_in_head
            #@transcription.person_unarmed = @incident.person_unarmed
            #@transcription.officer_couldnt_see_persons_hands = @incident.officer_couldnt_see_persons_hands
            @transcription.officer_routine_patrol = @incident.officer_routine_patrol
            @incident.transcribed_count = 1
            @transcription.officer_responding_to_call = @incident.officer_responding_to_call
            #@transcription.grabbed_officers_weapon = @incident.grabbed_officers_weapon
            @incident.save
            @transcription.save
            #redirect_to @incident
            #redirect_to(incident_path, :alert => "Updated")
            redirect_to params[:redirect_location]
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
