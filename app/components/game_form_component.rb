# frozen_string_literal: true

class GameFormComponent < ViewComponent::Base
  delegate :current_user, :finish_reason_select, :state_select, to: :helpers

  def initialize(game:)
    @game = game
    @game_system = game.game_system
  end

  def before_render
    @current_user = current_user
    @current_user_player = @game.players.filter { _1.user_is_player?(@current_user) }&.first
    @player_index = @game.players.find_index { |i| i.id == @current_user_player&.id }
  end
end
