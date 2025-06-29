class UnitTraitCategory < ApplicationRecord
  belongs_to :game_system

  validates :name, presence: true

  def to_s = name
end

# == Schema Information
#
# Table name: unit_trait_categories
#
#  id             :uuid             not null, primary key
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  game_system_id :uuid             not null
#
# Indexes
#
#  index_unit_trait_categories_on_game_system_id  (game_system_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_system_id => game_systems.id)
#
