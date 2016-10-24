require "csv"
require "open-uri"

task :import_csv  => :environment do
    url = "https://s3-us-west-2.amazonaws.com/ois-uploads/incidents.csv"
    Incident.delete_all
    csv_data = open(url).read()
    csv = CSV.parse(csv_data, :headers => true)
    csv.each do |row|
        Incident.create!(row.to_hash)
        puts row.to_hash
    end
end

task :import_csv  => :environment do
    url = "https://s3-us-west-2.amazonaws.com/ois-uploads/people.csv"
    Person.delete_all
    csv_data = open(url).read()
    csv = CSV.parse(csv_data, :headers => true)
    csv.each do |row|
        Person.create!(row.to_hash)
        puts row.to_hash
    end
end
