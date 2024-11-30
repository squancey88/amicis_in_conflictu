class Unit < ApplicationRecord
  belongs_to :army_list
  has_many :unit_stats, dependent: :destroy
  has_many :unit_applied_modifiers, dependent: :destroy
  has_many :unit_trait_mappings, dependent: :destroy
  has_many :unit_traits, through: :unit_trait_mappings

  validates :name, presence: true
  before_create :enough_cost_in_list

  accepts_nested_attributes_for :unit_stats, allow_destroy: true
  accepts_nested_attributes_for :unit_trait_mappings, allow_destroy: true

  def total_cost
    cost
  end

  def enough_cost_in_list
    unless army_list.starting_cost.nil?
      if cost > army_list.remaining_cost
        throw :abort
      end
    end
  end

  def clone_from(unit_id)
    unit = Unit.includes(unit_stats: :unit_stat_definition).find(unit_id)
    self.cost = unit.cost
    unit_stats.each do |stat|
      stat.base_value = unit.unit_stats.find_by(unit_stat_definition: stat.unit_stat_definition).base_value
    end
  end

  def self.new_with_stats(army_list)
    unit = army_list.units.new
    army_list.game_system.unit_stat_definitions.each do |definition|
      unit.unit_stats.build(unit_stat_definition: definition)
    end
    unit
  end
end
