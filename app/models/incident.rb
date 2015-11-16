class Incident < ActiveRecord::Base
    transcribable :district_attorney_file_number,
        :district_attorney_county,
        :district_attorney_prepared_report

    #validates :district_attorney_file_number, uniqueness:true, allow_blank: true, allow_nil: true
    has_many :transcriptions
    has_many :people, primary_key: "district_attorney_file_number", foreign_key: "district_attorney_file_number"

    # def split_url
    #     my_string_array = self.url.split("https://www.documentcloud.org/documents/")
    #     my_data_points = my_string_array[1].split("-")
    #     if my_data_points[2] == "la"
    #         county = "Los Angeles"
    #     elsif my_data_points[1] == "la"
    #         county = "Los Angeles"
    #     else
    #         county = nil
    #     end
    #     my_data_points.insert(0, county)
    #     file_number = my_data_points.last(2)
    #     my_file_number = "#" + file_number[0] + "-" + file_number[1]
    #     my_data_points.insert(1, my_file_number)
    #     return my_data_points.first(2)
    # end

end
