require "csv"
require "open-uri"

task :import_csv  => :environment do
    url = "https://www.dropbox.com/s/ykmbaapsr81sks6/people_transcriptions.csv?dl=1"
    csv_data = open(url).read()
    csv = CSV.parse(csv_data, :headers => true)
    csv.each do |row|
        People.create!(row.to_hash)
        puts row.to_hash
    end
end
