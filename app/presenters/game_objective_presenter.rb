class GameObjectivePresenter < ShowPresenter
  private

  def edit_path
    edit_game_objective_path(record)
  end

  def record_path
    game_objective_path(record)
  end

  def can_delete?
    true
  end
end
