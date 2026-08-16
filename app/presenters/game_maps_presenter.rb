class GameMapsPresenter < IndexPresenter
  def title
    "Maps"
  end

  def new_path
    new_game_map_path
  end

  def new_label
    "New Map"
  end
end
