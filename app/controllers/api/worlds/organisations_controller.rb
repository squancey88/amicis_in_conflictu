module Api
  module Worlds
    class OrganisationsController < BaseController
      before_action :set_world

      def index
        pagy, records = pagy(@world.organisations)

        paginated_json(::Worlds::OrganisationSerializer.new(records, params: {pagy:}), pagy)
      end

      def show
        @character = @world.organisations.find(params[:id])
        render json: ::Worlds::OrganisationSerializer.new(@character).serialize
      end

      private

      def set_world
        @world = World.find(params[:world_id])
      end
    end
  end
end
