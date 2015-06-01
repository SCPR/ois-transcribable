class Incident < ActiveRecord::Base
    transcribable :civilian_name,
        :district_attorney_file_number,
        :district_attorney_county,
        :district_attorney_date_of_letter,
        :district_attorney_conclusion,
        :district_attorney_prepared_report,
        :narrative_notes,
        :autopsy_notes,
        :conclusion_notes,
        :multiple_officers,
        :officer_name_and_badge_number,
        :officer_police_agency,
        :date_of_incident,
        :what_happened,
        :general_location_of_incident,
        :type_of_incident,
        :underlying_crime_leading_to_shooting,
        :how_situation_escalated,
        :civillian_weapon,
        :car_stop,
        :chase_or_pursuit,
        :civillian_armed,
        :potential_police_video,
        :potential_civillian_video,
        :mention_of_waistband_in_report,
        :fatal

    validates :district_attorney_file_number, uniqueness: true

    validates :district_attorney_file_number,
        :district_attorney_county,
        :district_attorney_date_of_letter,
        :district_attorney_conclusion,
        :district_attorney_prepared_report,
        :officer_police_agency,
        :date_of_incident,
        presence: true

    has_many :transcriptions
end
