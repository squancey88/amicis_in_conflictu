module Api
  module GameSystems
    class ArmiesController < BaseController
      before_action :set_game_system
      def index
        pagy, records = pagy(@game_system.armies)
        paginated_json(::GameSystems::ArmySerializer.new(records), pagy)
      end

      private

      def set_game_system
        @game_system = GameSystem.find(params[:game_system_id])
      end
    end
  end
end
