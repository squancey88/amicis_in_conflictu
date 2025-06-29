class UnitStatModifier < ApplicationRecord
  include Activatable

  belongs_to :game_system
  has_many :unit_stat_changes, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :unit_stat_changes, allow_destroy: true, reject_if: proc { |attributes| attributes["stat_change"].blank? }

  def to_s = name
end

# == Schema Information
#
# Table name: unit_stat_modifiers
#
#  id                                    :uuid             not null, primary key
#  active                                :boolean
#  cost                                  :integer
#  description                           :string
#  increase_cost_by_additional_instances :boolean          default(TRUE)
#  list_cost_increase                    :integer          default(0)
#  name                                  :string
#  repeat_cost                           :integer          default(0)
#  repeatable                            :boolean          default(TRUE)
#  rich_description                      :jsonb
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#  game_system_id                        :uuid             not null
#
# Indexes
#
#  index_unit_stat_modifiers_on_game_system_id  (game_system_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_system_id => game_systems.id)
#
