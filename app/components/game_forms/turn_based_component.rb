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
      players: PlayerSerializer.new(@game.players).as_json,
      game_system: GameSystemSerializer.new(@game_system, with_traits: [:with_objectives]).as_json,
      editable: @game.editable?
    }
  end
end
