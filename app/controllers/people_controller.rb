class PeopleController < ApplicationController

    layout "simple_frame"

    def index
        @user = current_user
        if current_user.email == "wcterrill@gmail.com"
            redirect_to incidents_statistics_path
        else
            @people = Person.all
        end
    end

    def data
        @people = Person.all
        @these_people = @people.where("on_duty_shooting_case = '1'").joins(:incident).where("district_attorney_county = 'Los Angeles'")
        render :json => @these_people.to_json(:include => {:incident => {:only => [:district_attorney_county, :district_attorney_file_number, :general_location_of_incident, :type_of_incident, :officer_shots_fired, :officer_name_and_badge_number, :officer_police_agency, :multiple_officers, :car_stop, :potential_police_video, :potential_civillian_video, :officer_charges_filed, :officer_self_defense, :officer_defense_of_civillians, :officer_defense_of_officers, :officer_serving_warrant, :officer_on_surveillance, :officer_on_undercover, :civilian_witnesses, :officer_injured, :flag_for_followup, :officer_routine_patrol, :officer_responding_to_call, :led_to_response_category, :date_of_incident]}})
    end

    def show
        @people = Person.find(params[:id])
    end

    def new
        @people = Person.new
    end

    def create
        @people = Person.new(people_params)
        # puts @people.district_attorney_file_number
        # @incident = Incident.where("district_attorney_file_number = params[:district_attorney_file_number]")
        # @incident = Incident.find(params[:incident_id])
        # @people = @incident.people.build
    end

    def edit
        @people = Person.find(params[:id])
    end

    def update
        @people = Person.find(params[:id])
        if @people.update_attributes(people_params)
           redirect_to(people_path, :alert => "Updated")
        else
            render "edit"
        end
    end

    def destroy
        @people = Person.find(params[:id])
        puts @people
        @people.destroy
        redirect_to(people_path, :alert => "Deleted")
    end

    def people_params
        params.require(:person).permit!
    end

end
