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
