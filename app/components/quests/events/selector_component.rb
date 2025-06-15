# frozen_string_literal: true

class Quests::Events::SelectorComponent < ViewComponent::Base
  delegate :bootstrap_button_classes, to: :helpers

  def initialize(game:)
    @game = game
    @world = game.campaign.world
  end
end
