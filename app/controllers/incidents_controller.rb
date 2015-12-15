class IncidentsController < ApplicationController

    layout "simple_frame"

    def index
        @user = current_user
        if current_user.email == "wcterrill@gmail.com"
            redirect_to incidents_statistics_path
        else
            @incidents = Incident.all.order(verified: :asc, district_attorney_county: :asc, district_attorney_file_number: :asc)
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
        @incident = Incident.find(params[:id])
        @people = @incident.people
        @user = current_user
        @user_id = set_user_uuid
    end

    def update
        @incident = Incident.find(params[:incident_id])
        @people = @incident.people
        @user = current_user
        @user_id = set_user_uuid
        if @incident.update_attributes(incident_params)
            if @incident.transcribed_status == nil
                @incident.transcribed = false
                @incident.transcribed_count = 0
                @incident.verified = false
            elsif @incident.transcribed_status == "in-progress"
                @incident.transcribed = false
                @incident.transcribed_count = 0
                @incident.verified = false
            elsif @incident.transcribed_status == "transcribed"
                @incident.transcribed = true
                @incident.transcribed_count = 1
                @incident.verified = false
            else
                @incident.transcribed = true
                @incident.transcribed_count = 1
                @incident.verified = true
            end
            @incident.save
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

    # By default, the current user is stored in a cookie.
    # For rigorous purposes, please consider implementing a
    # real login system.

    def set_user_uuid
        cookie_name = "#{Rails.application.engine_name}_transcriable_user_id".to_sym
        return cookies[cookie_name] if cookies[cookie_name]
        cookies[cookie_name] = {
            :value   => UUID.new.generate(:compact),
            :expires => 5.years.from_now
        }
        cookies[cookie_name]
    end

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
