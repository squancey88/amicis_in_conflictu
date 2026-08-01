class GameObjective < ApplicationRecord
  belongs_to :game_system
end

# == Schema Information
#
# Table name: game_objectives
#
#  id             :uuid             not null, primary key
#  description    :jsonb
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  game_system_id :uuid             not null
#
# Indexes
#
#  index_game_objectives_on_game_system_id  (game_system_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_system_id => game_systems.id)
#
