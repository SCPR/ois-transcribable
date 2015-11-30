class IncidentsController < ApplicationController

    layout "simple_frame"

    def index
        @user = current_user
        if current_user.email == "wcterrill@gmail.com"
            redirect_to incidents_statistics_path
        else
            @incidents = Incident.all.order("district_attorney_file_number")
            @incidents_verified = Incident.all.where("verified = '1'")
        end
    end

    def statistics
    end

    def data
        @incidents = Incident.where("on_duty_shooting_case = '1'")
        render :json => @incidents.to_json(:include => :people)
    end

    def classify_response
        @incidents = Incident.where("on_duty_shooting_case = '1'").order("led_to_response_category")
        @completed = @incidents.where("led_to_response_category != 'nil'")
        @completed_percent = (@completed.count.to_f / @incidents.count.to_f) * 100
    end

    def show
        @incident = Incident.find(params[:id])
        @transcription = Transcription.find_by district_attorney_file_number: @incident.district_attorney_file_number
    end

    def new
        @incident = Incident.new
    end

    def create
        @incident = Incident.new(incident_params)
    end

    def edit
        @user = current_user
        @incident = Incident.find(params[:id])
        @people = @incident.people
    end

    def update
        @incident = Incident.find(params[:incident_id])
        if @incident.update_attributes(incident_params)
            redirect_to(incident_path, :alert => "Updated")
        else
            render "edit"
        end
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
        @on_duty_incidents = @verified_incidents.where(on_duty_shooting_case: true)
        pct = (count.to_f / @on_duty_incidents.to_f) * 100
        return pct
    end

    def incident_params
        params.require(:incident).permit!
    end

end
