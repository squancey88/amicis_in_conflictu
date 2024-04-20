# frozen_string_literal: true

class GameFormComponent < ViewComponent::Base
  delegate :finish_reason_select, :state_select, to: :helpers

  def initialize(game:)
    @game = game
    @game_system = game.game_system
  end
end
