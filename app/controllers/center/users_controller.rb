module Center
  class UsersController < BaseController
    before_action :set_center_user, only: [:show, :edit, :update, :destroy]

    # GET /center/users
    # GET /center/users.json
    def index
      @users = User.all
    end

    # GET /center/users/1
    # GET /center/users/1.json
    def show
    end

    # GET /center/users/new
    def new
      @user = User.new
    end

    # GET /center/users/1/edit
    def edit
    end

    # POST /center/users
    # POST /center/users.json
    def create
      @user = User.new(center_user_params)

      if @user.save
        current_admin.action_logs.create!(target: :user, action: :new, action_value: center_user_params.to_s)
        redirect_to center_users_path, notice: '用户创建成功'
      else
        render :new
      end
    end

    # PATCH/PUT /center/users/1
    # PATCH/PUT /center/users/1.json
    def update
      if @user.update(center_user_params)
        current_admin.action_logs.create!(target: :user, action: :edit, action_value: center_user_params.to_s)
        redirect_to center_user_path(@user), notice: '用户编辑成功'
      else
        render :edit
      end
    end

    # DELETE /center/users/1
    # DELETE /center/users/1.json
    def destroy
      @user.destroy
      current_admin.action_logs.create!(target: :user, action: :delete, action_value: @user.inspect)
      respond_to do |format|
        format.html { redirect_to center_users_url, notice: '删除成功' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_center_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def center_user_params
      params.require(:user).permit(:name, :password).merge(department: params[:user][:department].to_i)
    end
  end
end
