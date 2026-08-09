class GameObjective < ApplicationRecord
  belongs_to :game_system

  validates :name, uniqueness: {scope: :game_system_id}
  validates :name, :scoring_key, presence: true

  def to_s = name
end

# == Schema Information
#
# Table name: game_objectives
#
#  id             :uuid             not null, primary key
#  description    :jsonb
#  name           :string
#  scoring_key    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  game_system_id :uuid             not null
#
# Indexes
#
#  index_game_objectives_on_game_system_id           (game_system_id)
#  index_game_objectives_on_name_and_game_system_id  (name,game_system_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (game_system_id => game_systems.id)
#
