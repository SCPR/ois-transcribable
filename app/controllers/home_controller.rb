class HomeController < ApplicationController
    layout "simple_frame"
    def index
      @user = current_user
      @incidents = Incident.all
      @transcriptions = Transcription.all
      @transcribed_percent = (@transcriptions.count.to_f / @incidents.count.to_f) * 100
      @transcribed_scoreboard = @transcriptions.group_by(&:email)
      @verified = @incidents.where(verified: true)
      @verified_percent = (@verified.count.to_f / @incidents.count.to_f) * 100
      @verified_scoreboard = @verified.group_by(&:email)
      #Rails.logger.info("Verified so far - #{@verified}")
    end

    def export_dashboard_json_data
        @people = Person.select("id, district_attorney_file_number, incident_url, person_name, person_ethnicity, person_gender, person_age, person_wounded, person_killed, person_armed, armed_with_firearm, armed_with_weapon, used_vehicle_as_weapon, person_ignored_officer_commands, person_hid_hands_from_officer, person_reached_for_waistband, person_fled_by_foot_or_vehicle, person_grabbed_for_officers_weapon_holster, person_signs_of_mental_illness, person_signs_of_impairment").where("on_duty_shooting_case = '1'")
        render :json => @people.as_json(:include => {:incident => {:only => [:district_attorney_county, :district_attorney_date_of_letter, :type_of_incident, :date_of_incident, :officer_self_defense, :officer_defense_of_civillians, :officer_defense_of_officers]}})
    end

    def export_dashboard_csv_data
        @people = Person.where("on_duty_shooting_case = '1'")
        respond_to do |format|
            format.html
            format.csv do
                headers['Content-Disposition'] = "attachment; filename=\"select_ois_data-file.csv\""
                headers['Content-Type'] ||= 'text/csv'
            end
        end
    end

    def export_all_json_data
        @people = Person.where("on_duty_shooting_case = '1'")
        render :json => @people.as_json(:include => :incident)
    end

    def export_all_csv_data
        @people = Person.where("on_duty_shooting_case = '1'")
        respond_to do |format|
            format.html
            format.csv do
                headers['Content-Disposition'] = "attachment; filename=\"full_ois_data-file.csv\""
                headers['Content-Type'] ||= 'text/csv'
            end
        end
    end

end
