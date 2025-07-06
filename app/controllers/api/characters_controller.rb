module Api
  class CharactersController < BaseController
    before_action :set_world

    def index
      render json: CharacterSerializer.new(@world.characters).serialize
    end

    def show
      @character = @world.characters.find(params[:id])
      render json: CharacterSerializer.new(@character).serialize
    end

    private

    def set_world
      @world = World.find(params[:world_id])
    end
  end
end
