class TurnObjective < ApplicationRecord
  belongs_to :game_objective
  belongs_to :player
end

# == Schema Information
#
# Table name: turn_objectives
#
#  id                :uuid             not null, primary key
#  points_scored     :integer
#  turn              :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  game_objective_id :uuid             not null
#  player_id         :uuid             not null
#
# Indexes
#
#  index_turn_objectives_on_game_objective_id  (game_objective_id)
#  index_turn_objectives_on_player_id          (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_objective_id => game_objectives.id)
#  fk_rails_...  (player_id => players.id)
#
