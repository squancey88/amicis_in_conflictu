module Api
  class GamingSessionsController < BaseController
    before_action :set_gaming_group
    before_action :set_gaming_session, only: %i[show]

    def index
      sessions = @gaming_group.gaming_sessions
      render json: sessions.map { GamingSessionSerializer.new(_1).serialize }
    end

    def show
      render json: GamingSessionSerializer.new(@gaming_session).serialize
    end

    def create
      @gaming_session = GamingSession.new(gaming_session_params)
      @gaming_session.gaming_group = @gaming_group

      if @gaming_session.valid?
        @gaming_session.save!
        render json: GamingSessionSerializer.new(@gaming_session).serialize
      else
        render json: @gaming_session.errors, status: :unprocessable_entity
      end
    end

    private

    def set_gaming_session
      @gaming_session = GamingSession.find(params[:id])
    end

    def set_gaming_group
      @gaming_group = GamingGroup.find(params[:gaming_group_id])
    end

    def gaming_session_params
      params.require(:gaming_session).permit(:start_time, :notes)
    end
  end
end
