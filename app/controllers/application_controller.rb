class ApplicationController < ActionController::Base

    require 'csv'

    layout "simple_frame"

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_action :authenticate_user!
end
