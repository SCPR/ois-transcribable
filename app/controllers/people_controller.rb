class PeopleController < ApplicationController

    layout "simple_frame"

    def index
        @user = current_user
        if current_user.email == "wcterrill@gmail.com"
            redirect_to incidents_statistics_path
        else
            @people = Person.all.order(person_name: :asc, district_attorney_file_number: :desc).joins(:incident)
            @people_total = Person.all()
            @people_verified = Person.where("verified = '1'")
        end
    end

    def data_verified
        @people = Person.where("person_shot = '1'")
        @these_people = @people.joins(:incident).where("on_duty_shooting_case = '1'").where("verified = '1'")
        render :json => @these_people.to_json(:include => {:incident => {:only => [:district_attorney_county, :district_attorney_file_number, :general_location_of_incident, :type_of_incident, :officer_shots_fired, :officer_name_and_badge_number, :officer_police_agency, :multiple_officers, :car_stop, :potential_police_video, :potential_civillian_video, :officer_charges_filed, :officer_self_defense, :officer_defense_of_civillians, :officer_defense_of_officers, :officer_serving_warrant, :officer_on_surveillance, :officer_on_undercover, :civilian_witnesses, :officer_injured, :flag_for_followup, :officer_routine_patrol, :officer_responding_to_call, :led_to_response_category, :date_of_incident, :moving_car]}})
    end

    # needs time based param I think?
    def data_original
        @people = Person.where("person_shot = '1'")
        @these_people = @people.joins(:incident).where("district_attorney_county = 'Los Angeles'").where("on_duty_shooting_case = '1'").where("verified = '1'")
        render :json => @these_people.to_json(:include => {:incident => {:only => [:district_attorney_county, :district_attorney_file_number, :general_location_of_incident, :type_of_incident, :officer_shots_fired, :officer_name_and_badge_number, :officer_police_agency, :multiple_officers, :car_stop, :potential_police_video, :potential_civillian_video, :officer_charges_filed, :officer_self_defense, :officer_defense_of_civillians, :officer_defense_of_officers, :officer_serving_warrant, :officer_on_surveillance, :officer_on_undercover, :civilian_witnesses, :officer_injured, :flag_for_followup, :officer_routine_patrol, :officer_responding_to_call, :led_to_response_category, :date_of_incident, :moving_car]}})
    end

    def data_sb
        @people = Person.where("person_shot = '1'")
        @these_people = @people.joins(:incident).where("district_attorney_county = 'San Bernardino'").where("on_duty_shooting_case = '1'").where("verified = '1'")
        render :json => @these_people.to_json(:include => {:incident => {:only => [:district_attorney_county, :district_attorney_file_number, :general_location_of_incident, :type_of_incident, :officer_shots_fired, :officer_name_and_badge_number, :officer_police_agency, :multiple_officers, :car_stop, :potential_police_video, :potential_civillian_video, :officer_charges_filed, :officer_self_defense, :officer_defense_of_civillians, :officer_defense_of_officers, :officer_serving_warrant, :officer_on_surveillance, :officer_on_undercover, :civilian_witnesses, :officer_injured, :flag_for_followup, :officer_routine_patrol, :officer_responding_to_call, :led_to_response_category, :date_of_incident, :moving_car]}})
    end

    def show
        @people = Person.find(params[:id])
    end

    def new
        @people = Person.new
    end

    def create
        @people = Person.new(people_params)
        if(@people.save)
            #Saved successfully; go to the index (or wherever)...
            redirect_to :action => :index
        else
            #Validation failed; show the "new" form again...
            render :action => :new
        end
    end

    def edit
        @people = Person.find(params[:id])
    end

    def update
        @person = Person.find(params[:id])
        if @person.update_attributes(people_params)
           @person.save
           redirect_to(person_path, :alert => "Updated")
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
