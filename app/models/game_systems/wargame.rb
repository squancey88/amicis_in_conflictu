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

    def self.schema
      schema_data = super
      schema_data[:properties][:scoring_system] = {
        type: :string,
        required: true,
        enum: [:turn_based]
      }
      schema_data[:properties][:scoring_name] = {
        type: :string,
        required: true
      }
      schema_data[:properties][:finish_reasons] = {
        title: "Finish Reasons",
        required: true,
        type: :array,
        items: {
          title: "Reason",
          type: :string
        }
      }
      schema_data[:properties][:turn_data] = {
        type: :array,
        required: true,
        title: "Turn Tracking",
        items: {
          title: "Tracking Point",
          type: :object,
          properties: {
            key: {
              type: :string
            },
            type: {
              type: :string,
              enum: [:number]
            },
            name: {
              type: :string
            },
            scoring: {
              type: :boolean
            }
          }
        }
      }
      schema_data
    end
  end
end
