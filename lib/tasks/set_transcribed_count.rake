task :set_transcribed_count  => :environment do

    Incident.destroy(1)

    #@record_count = Transcription.group(:incident_id).count.sort_by { |k,v| v.to_s }.reverse
    #@record_count.each do |this|
        #incident_id = this[0]
        #transcribed_count = this[1]
        #this_incident = Incident.find(incident_id)
        #this_incident.transcribed_count = transcribed_count
        #this_incident.save
    #end


end
