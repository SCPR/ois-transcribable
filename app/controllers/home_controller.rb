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
      @people = Person.where("person_shot = '1'")
      @all_people = @people.joins(:incident).where("on_duty_shooting_case = '1'").where("verified = '1'")
      @original_people = @all_people.where("people.created_at < '2015-11-30'").where("district_attorney_county = 'Los Angeles'")
      @sb_people = @all_people.where("district_attorney_county = 'San Bernardino'")
    end

    def statistics
    end

    def export_dashboard_json_data
        @people = Person.select("people.id, people.district_attorney_file_number, people.incident_url, people.person_name, people.person_ethnicity, people.person_gender, people.person_age, people.person_killed, people.person_armed, people.armed_with_firearm, people.armed_with_weapon, people.used_vehicle_as_weapon, people.person_ignored_officer_commands, people.person_hid_hands_from_officer, people.person_reached_for_waistband, people.person_fled_by_foot_or_vehicle, people.person_grabbed_for_officers_weapon_holster, people.person_signs_of_mental_illness, people.person_signs_of_impairment").where("person_shot = '1'").joins(:incident).where("district_attorney_county = 'Los Angeles'").where("on_duty_shooting_case = '1'")
        @people.each do |item|
            item.incident.date_of_incident = item.incident.date_of_incident.strftime "%Y-%m-%d %H:%M %Z"
            item.incident.district_attorney_date_of_letter = item.incident.district_attorney_date_of_letter.strftime "%Y-%m-%d"
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

    def export_incidents
        @incidents = Incident.all
        respond_to do |format|
            format.html
            format.csv do
                headers['Content-Disposition'] = "attachment; filename=\"ois_incidents_bak.csv\""
                headers['Content-Type'] ||= 'text/csv'
            end
        end
    end

    def export_people
        @people = Person.all
        respond_to do |format|
            format.html
            format.csv do
                headers['Content-Disposition'] = "attachment; filename=\"ois_people_bak.csv\""
                headers['Content-Type'] ||= 'text/csv'
            end
        end
    end

    def export_users
        @users = User.all
        respond_to do |format|
            format.html
            format.csv do
                headers['Content-Disposition'] = "attachment; filename=\"ois_users_bak.csv\""
                headers['Content-Type'] ||= 'text/csv'
            end
        end
    end

end
