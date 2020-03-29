module Center
  class SessionsController < BaseController
    skip_before_action :require_admin_login, only: [:create, :new]

    def new
    end

    def create
      @admin_user = AdminUser.find_by(email: params[:email])
      if @admin_user&.authenticate(params[:password])
        session[:admin_user_id] = @admin_user.id
        redirect_to center_users_path
      else
        redirect_to new_center_session_path, notice: '用户名密码不正确'
      end
    end

    def destroy
      require_admin_login
      session.delete(:admin_user_id)
      redirect_to new_center_session_path
    end
  end
end
