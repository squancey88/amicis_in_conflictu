module GameSystems
  class RolePlayingGamesController < ApplicationController
    include IsGameSystem

    def show
      @presenter = RolePlayingGamePresenter.new(view_context, @role_playing_game)
    end

    private

    # Only allow a list of trusted parameters through.
    def game_system_params
      params.require(:game_systems_role_playing_game).permit(:name, :slug, :edition, :competitive,
        :has_objectives,
        game_config: {})
    end
  end
end
