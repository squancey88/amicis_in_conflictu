# frozen_string_literal: true

class ArmySelectorComponent < ViewComponent::Base
  delegate :bootstrap_army_list_select, to: :helpers

  def initialize(game:, player_form:, current_player:, player_index:)
    @game = game
    @game_system = game.game_system
    @form = player_form
    @player = current_player
    @player_index = player_index
  end
end
