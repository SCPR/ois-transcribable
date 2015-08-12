class IncidentsController < ApplicationController

    layout "simple_frame"

    def index
        @incidents = Incident.all
    end

    def show
        @incident = Incident.find(params[:id])
    end

    def destroy
        @incident = Incident.find(params[:id])
        puts @incident
        @incident.destroy
        redirect_to(incidents_path, :alert => "Deleted")
    end

    private
    def create_pct(count)
        @incidents = Incident.all
        @verified_incidents = @incidents.where(verified: true)
        @on_duty_incidents = @verified_incidents.where(case_relevant: true)
        pct = (count.to_f / @on_duty_incidents.to_f) * 100
        return pct
    end

end
