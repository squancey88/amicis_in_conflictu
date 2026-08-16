class GameSystemsController < ApplicationController
  # GET /game_systems or /game_systems.json
  def index
    @game_systems = GameSystem.all
    @presenter = GameSystemsPresenter.new(view_context)
  end
end
