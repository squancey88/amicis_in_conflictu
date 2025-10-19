module Api
  class GameSystemsController < BaseController
    def index
      render json: GameSystem.all.map { GameSystemSerializer.new(_1).serialize }
    end
  end
end
