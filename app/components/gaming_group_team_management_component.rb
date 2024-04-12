# frozen_string_literal: true

class GamingGroupTeamManagementComponent < ViewComponent::Base
  def initialize(gaming_group:, current_user:)
    @gaming_group = gaming_group
    @current_user = current_user
  end
end
