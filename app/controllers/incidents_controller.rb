class IncidentsController < ApplicationController

    layout "simple_frame"

    def index
        @user = current_user
        if current_user.email == "wcterrill@gmail.com"
            redirect_to incidents_statistics_path
        else
            @incidents = Incident.all.order(district_attorney_county: :asc, verified: :desc, district_attorney_file_number: :asc)
            @incidents_total = Incident.all()
            @incidents_verified = Incident.where("on_duty_shooting_case = '1'").where("verified = '1'")
            @incidents_awaiting_transcription = Incident.where("transcribed = '0'")
            @incidents_awaiting_verification = Incident.where("on_duty_shooting_case = '1'").where("transcribed = '1'").where("verified = '0'")
        end
    end

    def transcribe
        @user = current_user
        if current_user.email == "wcterrill@gmail.com"
            redirect_to incidents_statistics_path
        else
            @incidents = Incident.where("transcribed = '0'").order(verified: :asc, district_attorney_county: :asc, district_attorney_file_number: :asc)
            @incidents_awaiting_transcription = Incident.where("transcribed = '0'")
            @incidents_verified = Incident.where("on_duty_shooting_case = '1'").where("verified = '1'")
        end
    end

    def verify
        @user = current_user
        if current_user.email == "wcterrill@gmail.com"
            redirect_to incidents_statistics_path
        else
            @incidents = Incident.where("on_duty_shooting_case = '1'").where("transcribed = '1'").where("verified = '0'").order(verified: :asc, district_attorney_county: :asc, district_attorney_file_number: :asc)
            @incidents_awaiting_verification = Incident.where("on_duty_shooting_case = '1'").where("transcribed = '1'").where("verified = '0'")
            @incidents_verified = Incident.where("on_duty_shooting_case = '1'").where("verified = '1'")
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

    def moving_cars
        @incidents = Incident.where("on_duty_shooting_case = '1'").where("transcribed = '1'").where("verified = '1'").order(verified: :asc, district_attorney_county: :asc, district_attorney_file_number: :asc)
        @completed = @incidents.where("moving_car != 'nil'")
        @completed_percent = (@completed.count.to_f / @incidents.count.to_f) * 100
    end

    def fix_times
        @incidents = Incident.where("on_duty_shooting_case = '1'").where("transcribed = '1'").where("updated_at < '2017-03-23 00:01:00'").order(verified: :desc, district_attorney_county: :asc, district_attorney_file_number: :asc)
        @left = @incidents.count
        @this = @incidents.first()
    end

    def show
        @incident = Incident.find(params[:id])
    end

    def new
        @incident = Incident.new
    end

    def create
        @incident = Incident.new(incident_params)
        if @incident.incident_url.include? ".html"
           @incident.incident_url = @incident.incident_url.sub! ".html", ""
        else
            @incident.incident_url = @incident.incident_url
        end
        if(@incident.save)
            #Saved successfully; go to the index (or wherever)...
            mssg_text = @incident.incident_url.sub! "https://www.documentcloud.org/documents/", ""
            flash[:notice] = "Incident " + mssg_text + " successfully created"
            redirect_to :action => :new
        else
            #Validation failed; show the "new" form again...
            mssg_text = @incident.incident_url.sub! "https://www.documentcloud.org/documents/", ""
            flash[:alert] = "URL not saved. Incident " + mssg_text + " likely already exists"
            redirect_to :action => :index
        end
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
