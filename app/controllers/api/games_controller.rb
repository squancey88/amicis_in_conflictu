module Api
  class GamesController < BaseController
    before_action :set_game
    before_action :has_access

    def show
      render json: GameSerializer.new(@game).serialize
    end

    private

    def has_access
      unless @game.gaming_group.is_user?(current_user)
        render json: {error: "Access denied"}, status: :forbidden
      end
    end

    def set_game
      @game = Game.find(params[:id])
    end
  end
end
