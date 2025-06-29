class UnitStatChange < ApplicationRecord
  belongs_to :unit_stat_definition
  belongs_to :unit_stat_modifier

  validates :stat_change, presence: true
end

# == Schema Information
#
# Table name: unit_stat_changes
#
#  id                      :uuid             not null, primary key
#  stat_change             :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  unit_stat_definition_id :uuid             not null
#  unit_stat_modifier_id   :uuid             not null
#
# Indexes
#
#  index_unit_stat_changes_on_unit_stat_definition_id  (unit_stat_definition_id)
#  index_unit_stat_changes_on_unit_stat_modifier_id    (unit_stat_modifier_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_stat_definition_id => unit_stat_definitions.id)
#  fk_rails_...  (unit_stat_modifier_id => unit_stat_modifiers.id)
#
