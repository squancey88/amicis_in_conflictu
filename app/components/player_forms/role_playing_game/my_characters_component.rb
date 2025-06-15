# frozen_string_literal: true

class PlayerForms::RolePlayingGame::MyCharactersComponent < ViewComponent::Base
  def initialize(game:, player_form:, current_player:, player_index:)
    @game = game
    @player_form = player_form
    @current_player = current_player
    @player_index = player_index
  end

  def characters
    @current_player.controller.characters.where(campaign: @game.campaign)
  end

  def render?
    @current_player.controller != @game.campaign.game_master
  end
end
