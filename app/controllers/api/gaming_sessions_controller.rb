module Api
  class GamingSessionsController < BaseController
    before_action :set_gaming_group

    def index
      sessions = @gaming_group.gaming_sessions
      render json: sessions.map { GamingSessionSerializer.new(_1).serialize }
    end

    private

    def set_gaming_group
      @gaming_group = GamingGroup.find(params[:gaming_group_id])
    end
  end
end
