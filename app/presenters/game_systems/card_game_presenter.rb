module GameSystems
  class CardGamePresenter < ShowPresenter
    private

    def edit_path
      edit_game_systems_card_game_path(record)
    end

    def record_path
      game_systems_card_game_path(record)
    end

    def can_delete?
      false
    end
  end
end
