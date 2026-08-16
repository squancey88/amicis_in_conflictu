module Api
  module Worlds
    class CharactersController < BaseController
      before_action :set_world

      def index
        pagy, records = pagy(@world.characters)

        paginated_json(::Worlds::CharacterSerializer.new(records, params: {pagy:}), pagy)
      end

      def show
        @character = @world.characters.find(params[:id])
        render json: ::Worlds::CharacterSerializer.new(@character).serialize
      end

      private

      def set_world
        @world = World.find(params[:world_id])
      end
    end
  end
end
