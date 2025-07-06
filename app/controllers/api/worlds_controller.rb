module Api
  class WorldsController < BaseController
    def index
      render json: WorldSerializer.new(@current_user.worlds).serialize
    end

    def show
      @world = World.find(params[:id])
      render json: WorldSerializer.new(@world).serialize
    end
  end
end
