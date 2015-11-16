class TranscriptionsController < ActionController::Base

    layout "simple_frame"

    def index
        @user = current_user
        @transcriptions = Transcription.all.sort_by { :created_at }.reverse
        @incidents = Incident.all
        @record_count = Transcription.group(:district_attorney_file_number).count.sort_by { |k,v| v.to_s }.reverse
    end

    def show
        @transcription = Transcription.find(params[:id])
    end

    def new
        @user = current_user

        # find an incident that hasn't been seen yet
        @incident = Incident.where("transcribed_count = '0'").assign!(@user)

        # if we're able to assign a filing
        # that the user hasn't done and hasn't been verified
        if @incident.nil?
            redirect_to(root_path, :alert => "You've transcribed all of the filings. Thank you.")
            return
        end

        @transcription = Transcription.new
        @transcription.incident = @incident
    end

    def create
        @incident = Incident.find(params[:incident_id])
        @incident.transcribed_count = @incident.transcribed_count + 1
        @transcription = Transcription.new(transcription_params)
        @transcription.incident = @incident
        @transcription.user_id = set_user_uuid
        @transcription.email = current_user.email
        if @transcription.save
            @incident.save
            @incident.verify!
            redirect_to(new_transcription_path, :notice => "Thank you for transcribing. Here's another filing.")
        else
            render :action => "new", :alert => "Something went wrong. Please try again."
        end
    end

    def edit
        @transcription = Transcription.find(params[:id])
        @incident = @transcription.incident
    end

    def update
        @transcription = Transcription.find(params[:id])
        @incident = Incident.find(params[:incident_id])
        if @transcription.update(transcription_params)
            Rails.logger.info("== Verified #{@incident.incident_url}")
            @transcription.verified = true
            @incident.verified = true
            #@incident.person_name = @transcription.person_name
            @incident.district_attorney_file_number = @transcription.district_attorney_file_number
            @incident.district_attorney_county = @transcription.district_attorney_county
            @incident.district_attorney_prepared_report = @transcription.district_attorney_prepared_report
            @incident.general_location_of_incident = @transcription.general_location_of_incident
            @incident.type_of_incident = @transcription.type_of_incident
            #@incident.person_weapon = @transcription.person_weapon
            @incident.officer_shots_fired = @transcription.officer_shots_fired
            @incident.da_on_scene = @transcription.da_on_scene
            @incident.da_investigator_on_scene = @transcription.da_investigator_on_scene
            @incident.district_attorney_conclusion = @transcription.district_attorney_conclusion
            @incident.narrative_notes = @transcription.narrative_notes
            @incident.autopsy_notes = @transcription.autopsy_notes
            @incident.conclusion_notes = @transcription.conclusion_notes
            @incident.officer_name_and_badge_number = @transcription.officer_name_and_badge_number
            @incident.officer_police_agency = @transcription.officer_police_agency
            @incident.what_happened = @transcription.what_happened
            @incident.underlying_crime_leading_to_shooting = @transcription.underlying_crime_leading_to_shooting
            @incident.how_situation_escalated = @transcription.how_situation_escalated
            #@incident.person_case_number = @transcription.person_case_number
            @incident.officer_special_unit = @transcription.officer_special_unit
            @incident.officer_charges_filed_yes_detail = @transcription.officer_charges_filed_yes_detail
            #@incident.person_charges_filed = @transcription.person_charges_filed
            @incident.date_of_incident = @transcription.date_of_incident
            @incident.district_attorney_date_of_letter = @transcription.district_attorney_date_of_letter
            @incident.multiple_officers = @transcription.multiple_officers
            @incident.car_stop = @transcription.car_stop
            @incident.believed_person_armed = @transcription.believed_person_armed
            @incident.potential_police_video = @transcription.potential_police_video
            @incident.potential_civillian_video = @transcription.potential_civillian_video
            #@incident.mention_of_waistband_in_report = @transcription.mention_of_waistband_in_report
            @incident.fatal = @transcription.fatal
            @incident.case_relevant = @transcription.case_relevant
            #@incident.person_arrested = @transcription.person_arrested
            @incident.officer_charges_filed = @transcription.officer_charges_filed
            @incident.officer_self_defense = @transcription.officer_self_defense
            @incident.officer_defense_of_civillians = @transcription.officer_defense_of_civillians
            @incident.officer_defense_of_officers = @transcription.officer_defense_of_officers
            @incident.officer_unknown = @transcription.officer_unknown
            @incident.officer_serving_warrant = @transcription.officer_serving_warrant
            @incident.officer_on_surveillance = @transcription.officer_on_surveillance
            @incident.officer_on_undercover = @transcription.officer_on_undercover
            #@incident.pursuit_occurred = @transcription.pursuit_occurred
            #@incident.person_gang_member = @transcription.person_gang_member
            #@incident.person_ignored_officer_commands = @transcription.person_ignored_officer_commands
            #@incident.person_weapon_recovered = @transcription.person_weapon_recovered
            #@incident.person_initiated_physical_threat = @transcription.person_initiated_physical_threat
            #@incident.victim_intoxicated = @transcription.person_intoxicated
            #@incident.victim_mentally_ill = @transcription.person_mentally_ill
            @incident.civilian_witnesses = @transcription.civilian_witnesses
            #@incident.person_fired_weapon = @transcription.person_fired_weapon
            #@incident.person_pointed_weapon = @transcription.person_pointed_weapon
            @incident.officer_injured = @transcription.officer_injured
            @incident.flag_for_followup = @transcription.flag_for_followup
            #@incident.person_shot_in_back = @transcription.person_shot_in_back
            @incident.applied_lawful_force = @transcription.applied_lawful_force
            #@incident.person_shot_in_head = @transcription.person_shot_in_head
            #@incident.person_unarmed = @transcription.person_unarmed
            #@incident.officer_couldnt_see_persons_hands = @transcription.officer_couldnt_see_persons_hands
            @incident.officer_routine_patrol = @transcription.officer_routine_patrol
            @incident.officer_responding_to_call = @transcription.officer_responding_to_call
            #@incident.grabbed_officers_weapon = @transcription.grabbed_officers_weapon
            @incident.email = current_user.email
            @incident.transcribed_count = 1
            @incident.save
            @transcription.save
            redirect_to @transcription
        else
            render "edit"
        end
    end

    def destroy
        @transcription = Transcription.find(params[:id])
        @transcription.destroy
        redirect_to(transcriptions_path, :alert => "Deleted")
    end

    private

    # By default, the current user is stored in a cookie.
    # For rigorous purposes, please consider implementing a
    # real login system.

    def set_user_uuid
        cookie_name = "#{Rails.application.engine_name}_transcriable_user_id".to_sym
        return cookies[cookie_name] if cookies[cookie_name]
        cookies[cookie_name] = {
            :value   => UUID.new.generate(:compact),
            :expires => 5.years.from_now
        }
        cookies[cookie_name]
    end

    def transcription_params
        params.require(:transcription).permit(:district_attorney_file_number,:district_attorney_county,:district_attorney_prepared_report,:general_location_of_incident,:type_of_incident,:officer_shots_fired,:da_on_scene,:da_investigator_on_scene,:district_attorney_conclusion,:narrative_notes,:autopsy_notes,:conclusion_notes,:officer_name_and_badge_number,:officer_police_agency,:what_happened,:underlying_crime_leading_to_shooting,:how_situation_escalated,:officer_special_unit,:officer_charges_filed_yes_detail,:date_of_incident,:district_attorney_date_of_letter,:car_stop,:believed_person_armed,:potential_police_video,:potential_civillian_video,:fatal,:case_relevant,:officer_charges_filed,:officer_self_defense,:officer_defense_of_civillians,:officer_defense_of_officers,:officer_unknown,:officer_serving_warrant,:officer_on_surveillance,:officer_on_undercover,:civilian_witnesses,:officer_injured,:flag_for_followup,:applied_lawful_force,:officer_routine_patrol,:officer_responding_to_call,:multiple_officers)
    end

end
