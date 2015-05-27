class OfficerInvolvement < ActiveRecord::Base
    belongs_to :incident
    belongs_to :police_officer
end
