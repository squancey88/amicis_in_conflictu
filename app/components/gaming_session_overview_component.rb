# frozen_string_literal: true

class GamingSessionOverviewComponent < ViewComponent::Base
  def initialize(gaming_session:)
    @gaming_session = gaming_session
  end

end
