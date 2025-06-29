class UnitStat < ApplicationRecord
  belongs_to :unit
  belongs_to :unit_stat_definition

  validates :base_value, presence: true

  def current_value
    change = unit.unit_applied_modifiers.includes(unit_stat_modifier: {unit_stat_changes: :unit_stat_definition})
      .where(unit_stat_modifier: {unit_stat_changes: {unit_stat_definition: unit_stat_definition}})
      .sum("unit_stat_changes.stat_change")
    if unit_stat_definition.save_stat?
      base_value - change
    else
      base_value + change
    end
  end
end

# == Schema Information
#
# Table name: unit_stats
#
#  id                      :uuid             not null, primary key
#  base_value              :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  unit_id                 :uuid             not null
#  unit_stat_definition_id :uuid             not null
#
# Indexes
#
#  index_unit_stats_on_unit_id                  (unit_id)
#  index_unit_stats_on_unit_stat_definition_id  (unit_stat_definition_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_id => units.id)
#  fk_rails_...  (unit_stat_definition_id => unit_stat_definitions.id)
#
