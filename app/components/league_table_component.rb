# frozen_string_literal: true

class LeagueTableComponent < ViewComponent::Base
  def initialize(gaming_group:)
    @gaming_group = gaming_group
  end

  def by_player
    @gaming_group.results_by_player.sort_by { [-(_1[1]), -(_1[2])] }
  end

  def by_team
    @gaming_group.results_by_team.sort_by { [-(_1[1]), -(_1[2])] }
  end
end
