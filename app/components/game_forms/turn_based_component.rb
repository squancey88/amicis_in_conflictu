# frozen_string_literal: true

class GameForms::TurnBasedComponent < ViewComponent::Base
  delegate :react_component,
    to: :helpers

  def initialize(game:, form:, user_player:)
    @game = game
    @game_system = @game.game_system
    @turn_count = @game.players.first.turns.length
    @scoring_values = @game_system.scoring_values
  end

  def component_data
    {
      players: player_data,
      game_system: GameSystemSerializer.new(@game_system).as_json,
      editable: @game.editable?
    }
  end

  def player_data
    @game.players.map do |player|
      {
        id: player.id,
        type: player.controller_type,
        displayName: player.display_name,
        turns: player.turns
      }
    end
  end
end
