class GamePresenter < ShowPresenter
  def title
    record.title
  end

  def subtitle
    record.players.map(&:display_name).join(", ")
  end

  private

  def record_path
    game_path(record)
  end

  def can_delete?
    true
  end
end
