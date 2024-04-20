# frozen_string_literal: true

class NewGameModalComponent < ViewComponent::Base
  delegate :game_system_select, :player_selection, :member_selection, :team_selection, to: :helpers

  def initialize(gaming_session:)
    @gaming_session = gaming_session
    @new_game = Game.new(gaming_session: @gaming_session)
  end
end
