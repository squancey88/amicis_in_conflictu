# frozen_string_literal: true

class CampaignListComponent < ViewComponent::Base
  delegate :bootstrap_game_system_select, to: :helpers

  def initialize(gaming_group:)
    @gaming_group = gaming_group
  end
end
