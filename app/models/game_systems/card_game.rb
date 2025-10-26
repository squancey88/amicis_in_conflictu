module GameSystems
  class CardGame < GameSystem
    include HasGameConfig

    config_has_health(required: true)
    config_has_timed_turns(required: true)

    def self.category_name
      "Card Games"
    end

    def has_turns?
      true
    end

    def has_health?
      has_health
    end

    def has_timed_turns?
      has_timed_turns
    end

    def game_data_form_components(game)
      game_forms = []
      game_forms << {
        title: "External Data",
        component: GameForms::ExternalTableDataComponent
      }
      game_forms
    end

    def set_winners(game)
      if has_health?
        game.players.map { [_1, _1.game_data["current_health"]] }.each do |player, health|
          player.result = if health == 0
            :lost
          else
            :won
          end
          player.save!
        end
      end
    end

    def update_player_data(player)
      player.game_data[:current_health] = player_current_health(player)
    end

    def setup_game_data
      game_data = {
        external_data: {}
      }
      game_data["turn_tracking"] = [] if has_timed_turns?
      game_data
    end

    def setup_player_data(game)
      player_data = {}
      if has_health?
        player_data["starting_health"] = game.data["starting_health"]
        player_data["current_health"] = game.data["starting_health"]
        player_data["health_changes"] = []
      end
      player_data
    end

    def player_current_health(player)
      health = player.game_data["starting_health"]
      player.game_data["health_changes"].each do |raw_change|
        change = raw_change.with_indifferent_access
        health += change[:change]
      end
      return 0 if health < 0
      health
    end
  end
end

# == Schema Information
#
# Table name: game_systems
#
#  id             :uuid             not null, primary key
#  competitive    :boolean
#  edition        :string
#  game_config    :jsonb
#  has_armies     :boolean          default(FALSE)
#  has_army_lists :boolean          default(FALSE)
#  name           :string
#  slug           :string
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_game_systems_on_slug  (slug) UNIQUE
#
