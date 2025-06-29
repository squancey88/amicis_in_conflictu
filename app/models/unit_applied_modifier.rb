class UnitAppliedModifier < ApplicationRecord
  belongs_to :unit
  belongs_to :game, optional: true
  belongs_to :unit_stat_modifier

  validate :enough_xp

  def enough_xp
    if new_record? && unit
      if unit.current_xp < unit_stat_modifier.cost
        errors.add(:unit, "not enough xp for modifier")
      end
    end
  end
end

# == Schema Information
#
# Table name: unit_applied_modifiers
#
#  id                    :uuid             not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  game_id               :uuid
#  unit_id               :uuid             not null
#  unit_stat_modifier_id :uuid             not null
#
# Indexes
#
#  index_unit_applied_modifiers_on_game_id                (game_id)
#  index_unit_applied_modifiers_on_unit_id                (unit_id)
#  index_unit_applied_modifiers_on_unit_stat_modifier_id  (unit_stat_modifier_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (unit_id => units.id)
#  fk_rails_...  (unit_stat_modifier_id => unit_stat_modifiers.id)
#
