class Incident < ActiveRecord::Base
    transcribable :civilian_name,
        :civilian_name,
        :district_attorney_file_number,
        :district_attorney_county,
        :district_attorney_prepared_report,
        :general_location_of_incident,
        :type_of_incident,
        :civillian_weapon,
        :officer_shots_fired,
        :da_on_scene,
        :da_investigator_on_scene,
        :district_attorney_conclusion,
        :narrative_notes,
        :autopsy_notes,
        :conclusion_notes,
        :officer_name_and_badge_number,
        :officer_police_agency,
        :what_happened,
        :underlying_crime_leading_to_shooting,
        :how_situation_escalated,
        :victim_case_number,
        :officer_special_unit,
        :officer_charges_filed_yes_detail,
        :victim_charges_filed,
        :date_of_incident,
        :district_attorney_date_of_letter,
        :officers,
        :car_stop,
        :civillian_armed,
        :potential_police_video,
        :potential_civillian_video,
        :mention_of_waistband_in_report,
        :fatal,
        :case_relevant,
        :victim_arrested,
        :officer_charges_filed,
        :officer_self_defense,
        :officer_defense_of_civillians,
        :officer_defense_of_officers,
        :officer_unknown,
        :officer_serving_warrant,
        :officer_on_surveillance,
        :officer_on_undercover,
        :pursuit_occurred,
        :victim_gang_member,
        :victim_ignored_officer_commands,
        :victim_weapon_recovered,
        :victim_initiated_physical_threat,
        :victim_intoxicated,
        :victim_mentally_ill,
        :civilian_witnesses,
        :victim_fired_weapon,
        :victim_pointed_weapon,
        :officer_injured,
        :flag_for_followup,
        :victim_shot_in_back,
        :applied_lawful_force

    validates :district_attorney_file_number, uniqueness:true, allow_blank: true, allow_nil: true

    #validates :district_attorney_file_number,
        #:district_attorney_county,
        #:district_attorney_date_of_letter,
        #:district_attorney_conclusion,
        #:district_attorney_prepared_report,
        #:officer_police_agency,
        #:date_of_incident,
        #presence: true

    has_many :transcriptions

    def split_url
        my_string_array = self.url.split("https://www.documentcloud.org/documents/")
        my_data_points = my_string_array[1].split("-")
        if my_data_points[2] == "la"
            county = "Los Angeles"
        elsif my_data_points[1] == "la"
            county = "Los Angeles"
        else
            county = nil
        end
        my_data_points.insert(0, county)
        file_number = my_data_points.last(2)
        my_file_number = "#" + file_number[0] + "-" + file_number[1]
        my_data_points.insert(1, my_file_number)
        return my_data_points.first(2)
    end

end
