class HomeController < ApplicationController
    layout "simple_frame"
    def index
      @user = current_user
      @incidents = Incident.all
      @transcriptions = @incidents.where(transcribed: true)
      @transcribed_percent = (@transcriptions.count.to_f / @incidents.count.to_f) * 100
      @transcribed_scoreboard = @incidents.where(transcribed: true).group_by(&:user_email)
      @verified = @incidents.where(verified: true)
      @verified_percent = (@verified.count.to_f / @incidents.count.to_f) * 100
      @verified_scoreboard = @verified.group_by(&:verified_by_email)
    end

    def export_dashboard_json_data
        @people = Person.select("people.id, people.district_attorney_file_number, people.incident_url, people.person_name, people.person_ethnicity, people.person_gender, people.person_age, people.person_killed, people.person_armed, people.armed_with_firearm, people.armed_with_weapon, people.used_vehicle_as_weapon, people.person_ignored_officer_commands, people.person_hid_hands_from_officer, people.person_reached_for_waistband, people.person_fled_by_foot_or_vehicle, people.person_grabbed_for_officers_weapon_holster, people.person_signs_of_mental_illness, people.person_signs_of_impairment").where("person_shot = '1'").joins(:incident).where("district_attorney_county = 'Los Angeles'").where("on_duty_shooting_case = '1'")
        @people.each do |item|
            # fix the incident date
            date_of_incident_pacific = item.incident.date_of_incident.in_time_zone("Pacific Time (US & Canada)")
            offset = date_of_incident_pacific.utc_offset()
            date_of_incident_correct = date_of_incident_pacific += offset.abs
            date_of_incident_string = date_of_incident_correct.strftime "%Y-%m-%d %H:%M %Z"
            item.incident.date_of_incident = date_of_incident_string
            # fix the date of da letter
            da_date_of_letter_pacific = item.incident.district_attorney_date_of_letter.in_time_zone("Pacific Time (US & Canada)")
            offset = da_date_of_letter_pacific.utc_offset()
            da_date_of_letter_correct = da_date_of_letter_pacific += offset.abs
            da_date_of_letter_string = da_date_of_letter_correct.strftime "%Y-%m-%d"
            puts da_date_of_letter_string
            item.incident.district_attorney_date_of_letter = da_date_of_letter_string
        end

        render :json => @people.as_json(:include => {:incident => {:only => [:district_attorney_county, :district_attorney_date_of_letter, :type_of_incident, :date_of_incident, :officer_self_defense, :officer_defense_of_civillians, :officer_defense_of_officers]}})
    end

    def export_dashboard_csv_data
        @people = Person.where("person_shot = '1'")
        @these_people = @people.joins(:incident).where("district_attorney_county = 'Los Angeles'").where("on_duty_shooting_case = '1'")
        respond_to do |format|
            format.html
            format.csv do
                headers['Content-Disposition'] = "attachment; filename=\"select_ois_data-file.csv\""
                headers['Content-Type'] ||= 'text/csv'
            end
        end
    end

    def export_all_json_data
        @people = Person.where("person_shot = '1'")
        @these_people = @people.joins(:incident).where("district_attorney_county = 'Los Angeles'").where("on_duty_shooting_case = '1'")
        render :json => @these_people.as_json(:include => :incident)
    end

    def export_all_csv_data
        @people = Person.where("person_shot = '1'")
        @these_people = @people.joins(:incident).where("district_attorney_county = 'Los Angeles'").where("on_duty_shooting_case = '1'")
        respond_to do |format|
            format.html
            format.csv do
                headers['Content-Disposition'] = "attachment; filename=\"full_ois_data-file.csv\""
                headers['Content-Type'] ||= 'text/csv'
            end
        end
    end
end
