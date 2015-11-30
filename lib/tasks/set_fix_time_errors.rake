task :fix_time_zone_errors  => :environment do
    @incident = Incident.where("on_duty_shooting_case = '1'")
    @incident.each do |item|
        # t = item.date_of_incident
        # puts t
        # offset = ActiveSupport::TimeZone.new('Pacific Time (US & Canada)').utc_offset()
        # t = t.in_time_zone("Pacific Time (US & Canada)")
        # puts t
        # t += -offset
        # puts t
        puts item.date_of_incident
        offset = item.date_of_incident.utc_offset()
        new_date_time = item.date_of_incident += offset.abs
        puts new_date_time
        puts Time.zone.local_to_utc(new_date_time)
        #puts Time.zone.local_to_utc(item.date_of_incident += offset)
        # incident_id = this[0]
        # transcribed_count = this[1]
        # this_incident = Incident.find(incident_id)
        # this_incident.transcribed_count = transcribed_count
        # this_incident.save
    end
end
