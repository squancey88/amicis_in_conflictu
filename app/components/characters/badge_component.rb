# frozen_string_literal: true

class Characters::BadgeComponent < ViewComponent::Base
  delegate :player_safe_color_array, to: :helpers

  with_collection_parameter :character

  def initialize(game:, character:, character_counter:)
    @game = game
    @character = character
    @character_counter = character_counter
    @user = character.controlled_by
  end

  def badge_colors
    background = player_safe_color_array(10)[@character_counter]
    font = background.paint.dark? ? "#FFFFFF" : "#000000"
    {
      background:, font:
    }
  end
end
