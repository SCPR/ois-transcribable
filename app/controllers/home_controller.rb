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

    def data
        @people = Person.select("id, person_name, district_attorney_file_number, incident_url, person_weapon, person_ethnicity, person_gender, person_age, person_signs_of_impairment, person_killed, person_wounded, armed_with_firearm, armed_with_weapon, used_vehicle_as_weapon, person_reached_for_waistband, person_fled_by_foot_or_vehicle, person_ignored_officer_commands, person_signs_of_mental_illness, person_fired_gun_at_officer, person_pointed_gun_at_officer, person_unarmed, person_armed, person_hid_hands_from_officer, person_grabbed_for_officers_weapon_holster, person_threatened_officer_with_weapon, person_weapon_recovered, used_vehicle_as_weapon, person_shot_in_back, person_shot_in_head, person_arrested, person_signs_of_gang_affiliation").where("on_duty_shooting_case = '1'")
        render :json => @people.to_json(:include => {:incident => {:only => [:district_attorney_file_number, :district_attorney_county, :type_of_incident, :date_of_incident, :district_attorney_date_of_letter, :multiple_officers, :car_stop, :officer_self_defense, :officer_defense_of_civillians, :officer_defense_of_officers, :led_to_response_category]}})
    end

end
