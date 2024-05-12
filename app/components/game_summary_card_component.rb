# frozen_string_literal: true

class GameSummaryCardComponent < ViewComponent::Base
  delegate :winner_badge, :state_badge, to: :helpers
  with_collection_parameter :game

  def initialize(game:)
    @game = game
  end
end
