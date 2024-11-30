# frozen_string_literal: true

class UnitTemplates::ListComponent < ViewComponent::Base
  delegate :traits_list, to: :helpers

  def initialize(game_system:)
    @game_system = game_system
  end
end
