module GameSystems
  class Wargame < GameSystem
    store_accessor :game_config, :turn_data

    def self.category_name
      "Wargames"
    end

    def has_turns?
      scoring_system == "turn_based"
    end

    def setup_game_data
      {}
    end

    def setup_player_data
      player_data = {}
      player_data[:turns] = [] if has_turns?
      player_data
    end
  end
end
