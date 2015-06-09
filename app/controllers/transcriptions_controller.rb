class TranscriptionsController < ActionController::Base

    layout "simple_frame"

    def index
        @transcriptions = Transcription.all().sort()
        respond_to do |format|
            format.html
            format.csv do
                headers['Content-Disposition'] = "attachment; filename=\"data-export.csv\""
                headers['Content-Type'] ||= 'text/csv'
            end
        end
    end

    def show
        @transcription = Transcription.find(params[:id])
    end

    def new
        @user = current_user
        @incident = Incident.assign!(@user)

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
        @transcription = Transcription.new(transcription_params)
        @transcription.incident = @incident
        @transcription.user_id = set_user_uuid
        @transcription.email = current_user.email
        if @transcription.save
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
        if @transcription.update(transcription_params)
            redirect_to @transcription
        else
            render 'edit'
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
        params.require(:transcription).permit(:civilian_name,:district_attorney_file_number,:district_attorney_county,:district_attorney_prepared_report,:general_location_of_incident,:type_of_incident,:civillian_weapon,:officer_shots_fired,:da_on_scene,:da_investigator_on_scene,:district_attorney_conclusion,:narrative_notes,:autopsy_notes,:conclusion_notes,:officer_name_and_badge_number,:officer_police_agency,:what_happened,:underlying_crime_leading_to_shooting,:how_situation_escalated,:victim_case_number,:officer_special_unit,:officer_charges_filed_yes_detail,:victim_charges_filed,:date_of_incident,:district_attorney_date_of_letter,:car_stop,:civillian_armed,:potential_police_video,:potential_civillian_video,:mention_of_waistband_in_report,:fatal,:case_relevant,:victim_arrested,:officer_charges_filed,:officer_self_defense,:officer_defense_of_civillians,:officer_defense_of_officers,:officer_unknown,:officer_serving_warrant,:officer_on_surveillance,:officer_on_undercover,:pursuit_occurred,:victim_gang_member,:victim_ignored_officer_commands,:victim_weapon_recovered,:victim_initiated_physical_threat,:victim_intoxicated,:victim_mentally_ill,:civilian_witnesses,:victim_fired_weapon,:victim_pointed_weapon,:officer_injured,:flag_for_followup,:victim_shot_in_back,:applied_lawful_force,:victim_shot_in_head,:victim_unarmed,:officer_couldnt_see_victims_hands,:officer_routine_patrol)
  end

end
