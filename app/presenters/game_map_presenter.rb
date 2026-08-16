class GameMapPresenter < ShowPresenter
  private

  def edit_path
    edit_game_map_path(record)
  end

  def record_path
    game_map_path(record)
  end

  def can_delete?
    true
  end
end
