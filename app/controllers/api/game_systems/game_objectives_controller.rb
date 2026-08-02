module Api
  module GameSystems
    class GameObjectivesController < BaseController
      before_action :set_game_system, only: %i[index]

      def index
        @pagy, @records = pagy(@game_system.game_objectives)
        render json: {
          records: GameObjectiveSerializer.new(@records, with_traits: [:with_paths]).serializable_hash,
          pagination: @pagy.data_hash
        }
      end

      private

      def set_game_system
        @game_system = GameSystem.find(params[:game_system_id])
      end
    end
  end
end
