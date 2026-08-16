class GameSystemsPresenter < IndexPresenter
  def title
    "Game Systems"
  end

  def header_buttons
    [
      {label: "New wargame", href: new_game_systems_wargame_path},
      {label: "New card game", href: new_game_systems_card_game_path},
      {label: "New RPG", href: new_game_systems_role_playing_game_path}
    ]
  end
end
