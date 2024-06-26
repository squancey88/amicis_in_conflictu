module GameSystems
  class Wargame < GameSystem
    store_accessor :game_config, :turn_data

    def self.category_name
      "Wargames"
    end

    def has_turns?
      scoring_system == "turn_based"
    end

    def scoring_values
      if has_turns?
        turn_data.filter { _1["scoring"] }
      end
    end

    def scoring_keys
      if has_turns?
        scoring_values.pluck("key")
      end
    end

    def setup_player_data
      player_data = {}
      player_data[:turns] = [] if has_turns?
      player_data
    end
  end
end
