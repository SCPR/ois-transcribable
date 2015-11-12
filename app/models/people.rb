class People < ActiveRecord::Base
    validates :district_attorney_file_number, uniqueness:true, allow_blank: true, allow_nil: true
    belongs_to :incident, foreign_key: "district_attorney_file_number"
end
