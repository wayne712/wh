module Center
  class BaseController < ApplicationController
    layout 'center/application'

    before_action :require_admin_login

    private

    def current_admin
      @_current_admin ||= session[:admin_user_id] && AdminUser.find(session[:admin_user_id])
    end

    def require_admin_login
      unless current_admin
        redirect_to new_center_session_path
      end
    end
  end
end
