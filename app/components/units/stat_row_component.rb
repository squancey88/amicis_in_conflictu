# frozen_string_literal: true

class Units::StatRowComponent < ViewComponent::Base
  def initialize(unit_stats:)
    @stats = unit_stats.includes(:unit_stat_definition).order("unit_stat_definitions.sort")
  end

  def stat_flourish(stat_definition)
    case stat_definition.stat_type
    when "save_stat"
      "+"
    when "distance_stat"
      "\""
    else
      ""
    end
  end
end
