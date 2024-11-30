class UnitStatChange < ApplicationRecord
  belongs_to :unit_stat_definition
  belongs_to :unit_stat_modifier

  validates :stat_change, presence: true
end
