module GamesHelper
  def players_html(game)
    game.players.map(&:display_name).join(" vs ")
  end
end
