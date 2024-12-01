class UnitStat < ApplicationRecord
  belongs_to :unit
  belongs_to :unit_stat_definition

  def current_value
    change = unit.unit_applied_modifiers.includes(unit_stat_modifier: {unit_stat_changes: :unit_stat_definition})
      .where(unit_stat_modifier: {unit_stat_changes: {unit_stat_definition: unit_stat_definition}})
      .sum("unit_stat_changes.stat_change")
    base_value + change
  end
end
