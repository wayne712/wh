  class BaseController < ApplicationController
    before_action :require_login

    private

    def current_user
      @_current_user ||= session[:user_id] && User.find(session[:user_id])
    end

    def require_login
      unless current_user
        redirect_to new_session_path
      end
    end
  end
