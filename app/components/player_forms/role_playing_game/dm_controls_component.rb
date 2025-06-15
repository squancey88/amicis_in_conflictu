# frozen_string_literal: true

class PlayerForms::RolePlayingGame::DmControlsComponent < ViewComponent::Base
  def initialize(game:, player_form:, current_player:, player_index:)
    @game = game
    @player_form = player_form
    @current_player = current_player
    @player_index = player_index
  end

  def render?
    @current_player.controller == @game.campaign.game_master
  end
end
