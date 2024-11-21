# frozen_string_literal: true

class TurnBasedGameFormComponent < ViewComponent::Base
  delegate :players_attributes_form_name, to: :helpers

  def initialize(game:)
    @game = game
    @game_system = @game.game_system
    @turn_count = @game.players.first.turns.length
    @scoring_values = @game_system.scoring_values
  end

  def turn_field_name(player_index, key)
    players_attributes_form_name(player_index, "[game_data][turns][][#{key}]")
  end

  def to_input(type, field_name, name, value = nil)
    case type
    when "number"
      number_field_tag(field_name, value, class: "form-control", placeholder: name, disabled: @game.editable?)
    end
  end

  def turn_field(player, player_index, turn_field, turn_index = nil)
    field_name = turn_field_name(player_index, turn_field["key"])
    value = player ? player.turns[turn_index][turn_field["key"]] : nil
    content_tag(:div, class: "form-floating") do
      concat(to_input(turn_field["type"], field_name, turn_field["name"], value))
      concat(label_tag(field_name, turn_field["name"]))
    end
  end
end
