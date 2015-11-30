task :harvest_new_incident => :environment do
require 'rest-client'
dc = YAML.load(File.read("#{Rails.root.to_s}/config/documentcloud.yml"))
dc_project = JSON.parse(RestClient.get("https://#{CGI::escape(dc['email'])}:#{CGI::escape(dc['password'])}@www.documentcloud.org/api/projects.json"))
    dc_project = dc_project['projects'].select {|q| q['id'] == dc['project']}[0]
    dc_project['document_ids'].each do |doc_id|
        begin
            dc_doc = JSON.parse(RestClient.get("https://www.documentcloud.org/api/documents/#{doc_id}.json"))['document']
            obj = Incident.find_or_initialize_by(incident_url: "https://www.documentcloud.org/documents/#{dc_doc['id']}")
            obj.verified = false if obj.new_record?
            obj.transcribed = false if obj.new_record?
            obj.save
            puts "== added #{obj.incident_url}"
        # this will skip non-public documents
        rescue RestClient::ResourceNotFound
            next
        end
    end
end
