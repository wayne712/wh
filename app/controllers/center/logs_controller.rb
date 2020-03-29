module Center
  class LogsController < BaseController

    def index
      @logs = AdminLog.paginate(page: params[:page]).order(id: :desc)
    end

  end
end
