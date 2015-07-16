class HomeController < ApplicationController
    layout "simple_frame"

    def index
      @user = current_user
      @incidents = Incident.all
      @transcriptions = Transcription.all
      @percent = (@transcriptions.count.to_f / @incidents.count.to_f) * 100
      @scoreboard = @transcriptions.group_by(&:email)
      Rails.logger.info("Verified so far - #{@verified}")
      @verified = @incidents.where(verified: true).count
      @verified_percent = (@verified.to_f / @incidents.count.to_f) * 100
    end

end
