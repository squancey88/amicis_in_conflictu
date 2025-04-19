module GameSystems
  class CardGamesController < ApplicationController
    include IsGameSystem

    private

    # Only allow a list of trusted parameters through.
    def game_system_params
      params.require(:game_systems_card_game).permit(:name, :slug, :edition, :competitive,
        game_config: {})
    end
  end
end
