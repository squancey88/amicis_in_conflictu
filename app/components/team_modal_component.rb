# frozen_string_literal: true

class TeamModalComponent < ViewComponent::Base
  delegate :member_select, to: :helpers

  def initialize(gaming_group:, team: nil)
    @gaming_group = gaming_group
    @team = team || Team.new(gaming_group: @gaming_group)
  end

  def modal_id
    ["teamModal", @team.id].join("-")
  end
end
