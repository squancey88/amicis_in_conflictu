module Api
  module Worlds
    class QuestsController < BaseController
      before_action :set_world
      def index
        @pagy, @records = pagy(@world.quests)
        render json: {
          records: ::Worlds::QuestSerializer.new(@records).serializable_hash,
          pagination: @pagy.data_hash
        }
      end

      private

      def set_world
        @world = World.find(params[:world_id])
      end
    end
  end
end
