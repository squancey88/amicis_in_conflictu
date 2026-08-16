module Api
  module Worlds
    class LocationsController < BaseController
      before_action :set_world

      def index
        pagy, records = pagy(@world.locations)

        paginated_json(::Worlds::LocationSerializer.new(records, params: {pagy:}), pagy)
      end

      def show
        @character = @world.locations.find(params[:id])
        render json: ::Worlds::LocationSerializer.new(@character).serialize
      end

      private

      def set_world
        @world = World.find(params[:world_id])
      end
    end
  end
end
