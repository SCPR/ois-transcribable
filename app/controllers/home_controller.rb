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

    def export_json_data
        @people = Person.select("id, person_name, district_attorney_file_number, incident_url, person_ethnicity, person_gender, person_age, person_signs_of_impairment, person_killed, person_wounded, armed_with_firearm, armed_with_weapon, used_vehicle_as_weapon, person_reached_for_waistband, person_fled_by_foot_or_vehicle, person_ignored_officer_commands, person_signs_of_mental_illness, person_unarmed, person_armed, person_hid_hands_from_officer, person_grabbed_for_officers_weapon_holster, used_vehicle_as_weapon").where("on_duty_shooting_case = '1'")
        render :json => @people.as_json(:include => {:incident => {:only => [:district_attorney_county, :type_of_incident, :date_of_incident, :district_attorney_date_of_letter, :multiple_officers, :car_stop, :officer_self_defense, :officer_defense_of_civillians, :officer_defense_of_officers]}})
    end

    def export_csv_data
        @people = Person.where("on_duty_shooting_case = '1'")
        respond_to do |format|
            format.html
            format.csv do
                headers['Content-Disposition'] = "attachment; filename=\"ois_data-file.csv\""
                headers['Content-Type'] ||= 'text/csv'
            end
        end
    end

end
