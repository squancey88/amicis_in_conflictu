# frozen_string_literal: true

class GroupSessionsOverviewComponent < ViewComponent::Base
  def initialize(gaming_group:)
    @gaming_group = gaming_group
  end
end
