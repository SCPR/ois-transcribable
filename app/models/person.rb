class Person < ActiveRecord::Base
    validates :district_attorney_file_number, uniqueness: false, allow_blank: true, allow_nil: true
    validates :person_name, presence: true, uniqueness: false, allow_blank: false, allow_nil: false
    belongs_to :incident, foreign_key: "district_attorney_file_number", primary_key: "district_attorney_file_number"
end
