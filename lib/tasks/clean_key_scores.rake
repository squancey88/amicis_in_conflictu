namespace :data_management do
  desc "Clean up underscored keys that are now broken in react"
  task clean_key_scores: :environment do
    GameSystems::Wargame.find_each do |game|
      game.game_config["turn_data"].each do |turn_data|
        turn_data["key"] = turn_data["key"].tr("_", "-").downcase
      end
      game.save
    end
    Player.find_each do |player|
      next unless player.game_data.has_key?("turns")
      player.game_data["turns"] = player.game_data["turns"].map do |score|
        score.transform_keys do |key|
          key.tr("_", "-").downcase
        end
      end
      player.save
    end
  end
end
