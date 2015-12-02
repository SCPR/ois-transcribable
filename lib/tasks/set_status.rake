task :set_status  => :environment do
    @incidents = Incident.all
    @incidents.each do |this|
        if this.district_attorney_county == "Los Angeles"
            if this.on_duty_shooting_case == true
                this.transcribed_status = "verified"
                this.transcribed_count = 1
                this.transcribed = true
                this.verified = true
            else
                this.transcribed_status = "transcribed"
                this.transcribed_count = 1
                this.transcribed = true
                this.verified = false
            end
            this.save
        end
    end
end
