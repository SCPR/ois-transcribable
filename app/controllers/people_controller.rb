class PeoplesController < ApplicationController

    layout "simple_frame"

    def index
        @user = current_user
        if current_user.email == "wcterrill@gmail.com"
            redirect_to incidents_statistics_path
        else
            @peoples = Person.order(:date_of_incident).where("case_relevant = '1'")
        end
    end

    def data
        @peoples = Person.select("person_name, district_attorney_file_number, incident_url, person_weapon, person_ethnicity, person_gender, person_age, year_of_incident, drugs, case_relevant, person_intoxicated, marijuana_alone, case_doubled_up, fatal, nonfatal_calc, armed_with_firearm_calc, armed_with_other_calc, vehicle_as_weapon, mention_of_waistband_in_report, person_arrested, pursuit_occurred, person_ignored_officer_commands, person_weapon_recovered, person_mentally_ill, person_fired_weapon, person_pointed_weapon, person_unarmed, person_armed_calc, officer_couldnt_see_persons_hands, grabbed_officers_weapon, date_of_incident").all
        @peoples = @peoples.where("case_relevant = '1'")
        render json: @peoples
    end

    def show
        @people = Person.find(params[:id])
    end

    def new
        @people = Person.new
    end

    def create
        @people = Person.new(people_params)
    end

    def edit
        @people = Person.find(params[:id])
    end

    def update
        @people = Person.find(params[:id])
        if @people.update_attributes(people_params)
           redirect_to(peoples_path, :alert => "Updated")
        else
            render "edit"
        end
    end

    def destroy
        @peoples = Person.find(params[:id])
        puts @peoples
        @peoples.destroy
        redirect_to(peoples_path, :alert => "Deleted")
    end

    def people_params
        params.require(:people).permit!
    end

end
