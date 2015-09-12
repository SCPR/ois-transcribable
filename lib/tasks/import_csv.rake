require "csv"
require "open-uri"

task :import_csv  => :environment do
    url = "https://www.dropbox.com/s/dnkkprcpm6hqfxp/ois_transcriptions.csv?dl=1"
    csv_data = open(url).read()
    csv = CSV.parse(csv_data, :headers => true)
    csv.each do |row|
        Transcription.create!(row.to_hash)
        puts row.to_hash
    end
end
