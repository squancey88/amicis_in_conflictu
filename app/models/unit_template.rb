class UnitTemplate < ApplicationRecord
  belongs_to :army
  belongs_to :game_system

  has_many :unit_template_stats, dependent: :destroy
  has_many :unit_template_trait_mappings, dependent: :destroy
  has_many :unit_traits, through: :unit_template_trait_mappings
  has_many :unit_trait_category_mappings, dependent: :destroy, foreign_key: :mapped_to_id,
    inverse_of: :mapped_to

  accepts_nested_attributes_for :unit_template_stats
  accepts_nested_attributes_for :unit_template_trait_mappings, allow_destroy: true
  accepts_nested_attributes_for :unit_trait_category_mappings, allow_destroy: true

  validates :name, presence: true

  def self.new_with_stats(game_system)
    template = new(game_system:)
    game_system.unit_stat_definitions.each do |definition|
      template.unit_template_stats.build(unit_stat_definition: definition)
    end
    template
  end

  def to_unit(army_list)
    unit = Unit.new(army_list: army_list)
    unit.cost = cost
    unit_template_stats.each do |template_stat|
      unit.unit_stats.build(unit_stat_definition: template_stat.unit_stat_definition,
        base_value: template_stat.base_value)
    end
    unit_traits.each do |trait|
      unit.unit_trait_mappings.build(unit_trait: trait)
    end
    unit
  end

  def to_s = name
end

# == Schema Information
#
# Table name: unit_templates
#
#  id             :uuid             not null, primary key
#  cost           :integer
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  army_id        :uuid
#  game_system_id :uuid             not null
#
# Indexes
#
#  index_unit_templates_on_army_id         (army_id)
#  index_unit_templates_on_game_system_id  (game_system_id)
#
# Foreign Keys
#
#  fk_rails_...  (army_id => armies.id)
#  fk_rails_...  (game_system_id => game_systems.id)
#
