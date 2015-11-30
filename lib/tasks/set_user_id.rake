task :set_user_id  => :environment do
    @transcription = Transcription.all
    @transcription.each do |this|
        @incident = Incident.find(this.incident_id)
        @incident.user_email = this.email
        @incident.user_id = this.user_id
        @incident.save
    end
end
