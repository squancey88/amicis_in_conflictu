# frozen_string_literal: true

class GamingGroupCardComponent < ViewComponent::Base
  with_collection_parameter :gaming_group

  def initialize(gaming_group:)
    @gaming_group = gaming_group
  end
end
