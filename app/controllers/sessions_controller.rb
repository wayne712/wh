class SessionsController < BaseController
  skip_before_action :require_login, only: [:create, :new]

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to acquires_path
    else
      redirect_to new_session_path, notice: '用户名密码不正确'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
