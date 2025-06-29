class UnitStatDefinition < ApplicationRecord
  belongs_to :game_system

  enum stat_type: {standard_stat: 0, save_stat: 1, distance_stat: 2}

  validates :name, :label, presence: true

  def stat_type_name
    stat_type.humanize.split.first
  end
end

# == Schema Information
#
# Table name: unit_stat_definitions
#
#  id             :uuid             not null, primary key
#  label          :string
#  max            :integer
#  min            :integer
#  name           :string
#  sort           :integer
#  stat_type      :integer          default("standard_stat")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  game_system_id :uuid             not null
#
# Indexes
#
#  index_unit_stat_definitions_on_game_system_id  (game_system_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_system_id => game_systems.id)
#
