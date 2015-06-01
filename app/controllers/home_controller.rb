class HomeController < ApplicationController
    layout "simple_frame"

    def index

      @user = current_user

    end
end
