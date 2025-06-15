# frozen_string_literal: true

class Characters::BadgeComponent < ViewComponent::Base
  delegate :player_safe_color_array, to: :helpers

  def initialize(game:, character:, index:)
    @game = game
    @character = character
    @index = index
    @user = character.controlled_by
  end

  def badge_colors
    background = player_safe_color_array(10)[@index]
    font = background.paint.dark? ? "#FFFFFF" : "#000000"
    {
      background:, font:
    }
  end
end
