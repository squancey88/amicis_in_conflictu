module GameSystems
  class RolePlayingGamesController < ApplicationController
    include IsGameSystem

    private

    # Only allow a list of trusted parameters through.
    def game_system_params
      params.require(:game_systems_role_playing_game).permit(:name, :slug, :edition, :competitive,
        game_config: {})
    end
  end
end
