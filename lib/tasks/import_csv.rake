require "csv"
require "open-uri"

task :import_csv  => :environment do
    url = "https://www.dropbox.com/s/3scqwrldpvegsbo/incidents.csv?dl=1"
    Incident.delete_all
    csv_data = open(url).read()
    csv = CSV.parse(csv_data, :headers => true)
    csv.each do |row|
        Incident.create!(row.to_hash)
        puts row.to_hash
    end
end

task :import_csv  => :environment do
    url = "https://www.dropbox.com/s/6x4i1gfmq3r5rcp/people.csv?dl=1"
    Person.delete_all
    csv_data = open(url).read()
    csv = CSV.parse(csv_data, :headers => true)
    csv.each do |row|
        Person.create!(row.to_hash)
        puts row.to_hash
    end
end
