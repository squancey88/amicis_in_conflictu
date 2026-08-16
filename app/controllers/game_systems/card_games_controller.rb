module GameSystems
  class CardGamesController < ApplicationController
    include IsGameSystem

    def show
      @presenter = CardGamePresenter.new(view_context, @card_game)
    end

    private

    # Only allow a list of trusted parameters through.
    def game_system_params
      params.require(:game_systems_card_game).permit(:name, :slug, :edition, :competitive,
        :has_objectives,
        game_config: {})
    end
  end
end
