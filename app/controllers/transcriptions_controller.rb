class TranscriptionsController < ActionController::Base
  layout "simple_frame"

  def new
    @incident = Incident.assign!(current_user)
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
    @transcription.user_id = current_user

    if @transcription.save
      @incident.verify!
      redirect_to(new_transcription_path, :notice => "Thank you for transcribing. Here's another filing.")
    else
      render :action => "new", :alert => "Something went wrong. Please try again."
    end
  end

  private

  # By default, the current user is stored in a cookie.
  # For rigorous purposes, please consider implementing a
  # real login system.
  def current_user
    cookie_name = "#{Rails.application.engine_name}_transcriable_user_id".to_sym
    return cookies[cookie_name] if cookies[cookie_name]
    cookies[cookie_name] = {
      :value   => UUID.new.generate(:compact),
      :expires => 5.years.from_now
    }
    cookies[cookie_name]
  end

  def transcription_params
    params.require(:transcription).permit(:civilian_name,:district_attorney_file_number,:district_attorney_county,:district_attorney_date_of_letter,:district_attorney_conclusion,:district_attorney_prepared_report,:narrative_notes,:autopsy_notes,:conclusion_notes,:multiple_officers,:officer_name_and_badge_number,:officer_police_agency,:date_of_incident,:what_happened,:general_location_of_incident,:type_of_incident,:underlying_crime_leading_to_shooting,:how_situation_escalated,:civillian_weapon,:car_stop,:chase_or_pursuit,:civillian_armed,:potential_police_video,:potential_civillian_video,:mention_of_waistband_in_report)
  end
end
