json.extract! gaming_session, :id, :start_time, :created_at, :updated_at

json.games gaming_session.games do |game|
  json.extract! game, :id
  json.game_system game.game_system, :name, :edition
  json.players game.players do |player|
    json.extract! player, :id, :controller_type
    json.controller player.controller, :display_name, :id
  end
end
