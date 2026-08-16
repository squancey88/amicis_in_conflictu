module GameSystems
  class WargamePresenter < ShowPresenter
    private

    def edit_path
      edit_game_systems_wargame_path(record)
    end

    def record_path
      game_systems_wargame_path(record)
    end

    def can_delete?
      false
    end
  end
end
