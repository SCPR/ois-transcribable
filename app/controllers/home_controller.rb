class HomeController < ApplicationController
    layout "simple_frame"

    def index
      @user = current_user
      @incidents = Incident.all
      @transcriptions = Transcription.all
      @transcribed_percent = (@transcriptions.count.to_f / @incidents.count.to_f) * 100
      @transcribed_scoreboard = @transcriptions.group_by(&:email)
      @verified = @incidents.where(verified: true)
      @verified_percent = (@verified.count.to_f / @incidents.count.to_f) * 100
      @verified_scoreboard = @verified.group_by(&:email)
      #Rails.logger.info("Verified so far - #{@verified}")
    end

end
