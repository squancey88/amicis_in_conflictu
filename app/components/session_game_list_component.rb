# frozen_string_literal: true

class SessionGameListComponent < ViewComponent::Base
  delegate :players_html, :state_badge, to: :helpers

  def initialize(gaming_session:)
    @gaming_session = gaming_session
  end
end
