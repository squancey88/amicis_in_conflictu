module Api
  module GameSystems
    class GameObjectivesController < BaseController
      def index
        @pagy, @records = pagy(@game_system.game_objectives)
        render json: {
          records: ::GameSystems::GameObjectiveSerialiser.new(@records).serializable_hash,
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
