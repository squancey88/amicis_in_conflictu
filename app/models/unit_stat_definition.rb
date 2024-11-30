class UnitStatDefinition < ApplicationRecord
  belongs_to :game_system

  enum stat_type: {standard_stat: 0, save_stat: 1, distance_stat: 2}

  validates :name, :label, presence: true

  def stat_type_name
    stat_type.humanize.split.first
  end
end
