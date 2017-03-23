class Incident < ActiveRecord::Base
    transcribable :district_attorney_file_number,
        :district_attorney_county,
        :district_attorney_prepared_report
    validates :incident_url, uniqueness:true, allow_blank: false, allow_nil: false
    has_many :transcriptions
    has_many :people, primary_key: "district_attorney_file_number", foreign_key: "district_attorney_file_number"
    accepts_nested_attributes_for :people
    validates_associated :people

    def split_url
        # 2107457-10-la-use-of-force-10-0966
        # 2514850-sb_-2013-00-0025411
        # 2630819-orange_12-024.html
        # https://www.documentcloud.org/documents/2094040-12-la-use-of-force-12-0006
        my_string_array = self.incident_url.split("https://www.documentcloud.org/documents/")
        this = my_string_array[1]
        county_string = this[8..-1]
        this_county = county_string[0,2]
        data_returned = Hash.new
        if this_county == "sb"
            data_returned["county"] = "San Bernardino"
            data_returned["file_number"] = "#" + county_string[4..-1]
        elsif this_county == "or"
            data_returned["county"] = "Orange"
            data_returned["file_number"] = "#" + county_string[7..-1]
        else
            data_returned["county"] = "Los Angeles"
            data_returned["file_number"] = "#" + county_string.last(7)
        end
        return data_returned
    end

    def get_incident_year
        my_string_array = self.incident_url.split("https://www.documentcloud.org/documents/")
        this = my_string_array[1]
        county_string = this[8..-1]
        this_county = county_string[0,2]
        data_returned = Hash.new
        if this_county == "sb"
            data_returned["county"] = "San Bernardino"
            data_returned["file_number"] = county_string[4..7]
        elsif this_county == "or"
            data_returned["county"] = "Orange"
            data_returned["file_number"] = "20" + county_string[7..8]
        else
            data_returned["county"] = "Los Angeles"
            data_returned["file_number"] = "20" + county_string.last(7).gsub(/-\d+/, "")
        end
        return data_returned
    end
end
