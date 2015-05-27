class PoliceOfficer < ActiveRecord::Base
    has_many :officer_involvements
    has_many :incidents, :through => :officer_involvements
end
