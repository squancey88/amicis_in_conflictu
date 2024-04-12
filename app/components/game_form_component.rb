# frozen_string_literal: true

class GameFormComponent < ViewComponent::Base
  def initialize(game:)
    @game = game
    @game_system = game.game_system
    @turns = [1]
  end

  def turn_field_name(player_id, turn_number, key)
    "game[#{player_id}][#{turn_number}][#{key}]"
  end

  def to_input(type, field_name, name)
    case type
    when "number"
      number_field_tag(field_name, nil, class: "form-control", placeholder: name)
    end
  end

  def turn_row(player:, turn: 0)
    content_tag(:div, class: "game-turn-row") do
      @game_system.turn_data.each do |turn_field|
        field_name = turn_field_name(player.id, turn, turn_field["key"])
        concat(content_tag(:div, class: "form-floating") do
          concat(to_input(turn_field["type"], field_name, turn_field["name"]))
          concat(label_tag(field_name, turn_field["name"]))
        end)
      end
    end
  end
end
