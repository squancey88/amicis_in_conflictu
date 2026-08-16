module GameSystems
  class RolePlayingGamePresenter < ShowPresenter
    private

    def edit_path
      edit_game_systems_role_playing_game_path(record)
    end

    def record_path
      game_systems_role_playing_game_path(record)
    end

    def can_delete?
      false
    end
  end
end
