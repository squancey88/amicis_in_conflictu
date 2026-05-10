module Api
  module GameSystems
    class ArmiesController < BaseController
      before_action :set_game_system
      def index
        @pagy, @records = pagy(@game_system.armies)
        render json: {
          records: ::GameSystems::ArmiesSerializer.new(@records).serializable_hash,
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
