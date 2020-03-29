module Center
  class LogsController < BaseController

    def index
      @logs = AdminLog.paginate(page: params[:page])
    end

  end
end
