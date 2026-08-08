# frozen_string_literal: true

class GameForms::TurnBasedComponent < ViewComponent::Base
  delegate :react_component,
    to: :helpers

  def initialize(game:, form:, user_player:)
    @game = game
    @game_system = @game.game_system
  end

  def component_name
    if game_system.has_objectives?
      if has_turn_data
        "RawScoreTurnForm"
      else
        "ObjectiveBasedTurnForm"
      end
    else
      "RawScoreTurnForm"
    end
  end

  def component_data
    {
      players: PlayerSerializer.new(game.players).as_json,
      game_system: GameSystemSerializer.new(game_system, with_traits: [:with_objectives]).as_json,
      editable: game.editable?
    }
  end

  def call
    react_component(component_name, component_data)
  end

  private

  attr_accessor :game_system, :game

  def has_turn_data
    @game.players.first.turns.length > 0
  end
end
